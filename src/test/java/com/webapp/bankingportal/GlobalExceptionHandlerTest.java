package com.webapp.bankingportal;

import com.webapp.bankingportal.entity.Account;
import com.webapp.bankingportal.entity.User;
import lombok.val;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.redis.RedisConnectionFailureException;
import org.springframework.http.MediaType;

import com.webapp.bankingportal.service.AccountService;
import com.webapp.bankingportal.util.ApiMessages;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class GlobalExceptionHandlerTest extends BaseTest {

    @MockBean
    private AccountService accountService;

    private void stubAccountCreation() {
        Mockito.when(accountService.createAccount(Mockito.any(User.class))).thenAnswer(invocation -> {
            User user = invocation.getArgument(0);
            Account account = new Account();
            account.setAccountNumber(getRandomAccountNumber());
            account.setBalance(0.0);
            account.setUser(user);
            return account;
        });
    }

    @Test
    void whenRedisConnectionFails_shouldReturn503() throws Exception {
        stubAccountCreation();

        val userDetails = createAndLoginUser();
        val token = userDetails.get("token");

        Mockito.when(accountService.isPinCreated(Mockito.anyString()))
               .thenThrow(new RedisConnectionFailureException("Redis down"));

        mockMvc.perform(get("/api/account/pin/check")
                .header("Authorization", "Bearer " + token))
                .andExpect(status().isServiceUnavailable())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$.message")
                .value(ApiMessages.REDIS_CONNECTION_FAILURE.getMessage()));
    }
}
