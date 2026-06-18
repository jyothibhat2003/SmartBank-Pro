# Banking Portal Rest API Using Spring Boot & Spring Security

## Fork and Star ⭐ Github Repo For New Feature Update

[![GitHub Repo](https://img.shields.io/badge/GitHub-UI%20Repo-blue.svg?style=flat-square)](https://github.com/abhi9720/BankingPortal-UI)
[![GitHub Repo](https://img.shields.io/badge/GitHub-API%20Repo-blue.svg?style=flat-square)](https://github.com/abhi9720/BankingPortal-API)

## API Documentation

- [https://github.com/abhi9720/BankingPortal-API/wiki](https://github.com/abhi9720/BankingPortal-API/wiki)

## Banking Portal UI

- [https://github.com/abhi9720/BankingPortal-UI](https://github.com/abhi9720/BankingPortal-UI)

![image](https://github.com/abhi9720/BankingPortal-API/assets/68281476/237694d9-6e8d-48e8-a7a2-982b9f8ca671)

***

The Banking Portal API provides a set of endpoints for managing user accounts, fund transfers, and transactions. This project aims to facilitate secure and efficient banking operations for users.

## Features

- User Registration: Users can register by providing their details, such as name, email, address, and phone number.
- PIN Management: Users can create and update their PINs for added security.
- Cash Deposit and Withdrawal: Users can deposit and withdraw cash from their accounts.
- Fund Transfer: Users can transfer funds to other accounts within the system.
- Transaction History: Users can view their transaction history.

## Technologies Used

![image](https://github.com/abhi9720/BankingPortal-API/assets/68281476/31896d20-16d9-4fe1-a534-0490841de4b9)
![image](https://github.com/abhi9720/BankingPortal-API/assets/68281476/c09bc4ac-c0ca-4f7c-9c6e-8eb9818eb35b)
![image](https://github.com/abhi9720/BankingPortal-API/assets/68281476/78c75fff-e8a8-49c6-9897-34b08b2c9308)
![image](https://github.com/abhi9720/BankingPortal-API/assets/68281476/3647613e-1d6e-4bc4-98b6-2da5648659f9)
![image](https://github.com/abhi9720/BankingPortal-API/assets/68281476/8a5c0b00-776b-444e-bc24-36fc6bfe4c41)
![image](https://github.com/abhi9720/BankingPortal-API/assets/68281476/b56a7167-6a3a-49a0-8b8a-8a4e3e71a383)
![image](https://github.com/abhi9720/BankingPortal-API/assets/68281476/b5c86e65-cbe8-400a-afeb-895846601da7)

## TODO

- UI Fix for Dashboard Charts
- Pagination in table
- Save JWT Token in db and remove on logout
- Email trigger on account login
- Send Bank Statement on Email

## Complete Local Setup

This project is split into two parts:

- Backend: `C:\Users\Admin\Downloads\SmartBank-Pro`
- Frontend: `C:\Users\Admin\Downloads\BankingPortal-UI`

## Required Installs

1. Install Git: https://git-scm.com/downloads
2. Install JDK 17 or newer. JDK 17 is recommended, and JDK 23 also works.
3. Install Node.js. Node 20 LTS is recommended, and Angular 18 works best with Node 18, 20, or 22.
4. Install VS Code: https://code.visualstudio.com

## VS Code Extensions

Backend:

- Extension Pack for Java
- Spring Boot Extension Pack
- Maven for Java
- Lombok Annotations Support for VS Code

Frontend:

- Angular Language Service
- ESLint
- Prettier
- Tailwind CSS IntelliSense

Optional:

- GitLens
- Thunder Client or REST Client
- Docker, if you want MySQL and Redis via Docker

## Backend Setup

Open a terminal and go to the backend folder:

```powershell
cd C:\Users\Admin\Downloads\SmartBank-Pro
```

Create the local config file:

```powershell
Copy-Item src\main\resources\application.properties.sample src\main\resources\application.properties
```

For the easiest local run, update `src/main/resources/application.properties` with this H2 config:

```properties
server.port=8180

spring.datasource.url=jdbc:h2:file:./data/bankingapp;MODE=MySQL;DATABASE_TO_LOWER=TRUE;NON_KEYWORDS=USER;DB_CLOSE_DELAY=-1
spring.datasource.username=sa
spring.datasource.password=
spring.datasource.driver-class-name=org.h2.Driver
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.jpa.generate-ddl=true
spring.jpa.show-sql=false
spring.jpa.hibernate.ddl-auto=update
spring.main.allow-circular-references=true
server.error.include-message=always
spring.h2.console.enabled=true
management.health.redis.enabled=false

jwt.secret=VGhpcy1pcy1hLWxvY2FsLWRldi1zZWNyZXQtdGhhdC1pcy1sb25nLWVub3VnaC1mb3ItSFMyNTYtYW5kLUhTNTEyLXRva2Vucy0xMjM0NTY3ODkw
jwt.expiration=86400000
jwt.header=Authorization
jwt.prefix=Bearer

spring.mail.host=smtp.gmail.com
spring.mail.port=587
spring.mail.username=example@gmail.com
spring.mail.password=dummy-password
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.starttls.enable=true

geo.api.url=https://api.findip.net/
geo.api.key=your-api-key
```

Run the backend:

```powershell
.\mvnw.cmd spring-boot:run
```

Backend URL:

```text
http://localhost:8180
```

Swagger UI:

```text
http://localhost:8180/swagger-ui/index.html
```

## Frontend Setup

Open a second PowerShell window and go to the frontend folder:

```powershell
cd C:\Users\Admin\Downloads\BankingPortal-UI
npm install
npm start
```

Frontend URL:

```text
http://localhost:4200
```

The UI is already configured to call:

```text
http://localhost:8180/api
```

The frontend config file is:

```text
BankingPortal-UI/src/environment/environment.ts
```

It should contain:

```ts
export const environment = {
   production: false,
   apiUrl: 'http://localhost:8180/api',
   tokenName: 'authToken',
   origin: 'http://localhost:4200'
};
```

## How To Use

1. Start the backend first:

```powershell
cd C:\Users\Admin\Downloads\SmartBank-Pro
.\mvnw.cmd spring-boot:run
```

2. Start the frontend second:

```powershell
cd C:\Users\Admin\Downloads\BankingPortal-UI
npm start
```

3. Open `http://localhost:4200`.
4. Register a new user.
5. Log in.
6. Create a PIN.
7. Use the dashboard, deposit, withdraw, fund transfer, transactions, and profile pages.

## Common Errors

If `JAVA_HOME` is not found:

```powershell
setx JAVA_HOME "C:\Program Files\Java\jdk-17"
```

Then reopen the terminal.

If port `8180` is already in use:

```powershell
netstat -ano | findstr :8180
Stop-Process -Id PID_NUMBER -Force
```

If port `4200` is already in use:

```powershell
netstat -ano | findstr :4200
Stop-Process -Id PID_NUMBER -Force
```

If login says user not found, register first. The login identifier is either email or account number.

## Screenshots

![project](https://github.com/abhi9720/BankingPortal-API/assets/68281476/45bca1e0-0af2-4d63-a8d0-efd7b67df6bf)

## Error Handling

The API implements global exception handling for common error scenarios, such as account not found, unauthorized access, and insufficient balance.

## How to Contribute

We welcome and encourage developers to contribute to the project and help us make it even better. If you are interested in contributing, follow these steps:

👉🏻**Fork the Repository**: Click on the "Fork" button on the top right corner of the GitHub repository page. This will create a copy of the repository in your GitHub account.

👉🏻**Clone the Forked Repository**: Open your terminal or command prompt and use the following command to clone the repository to your local machine:

   ```sh
   git clone https://github.com/your-username/BankingPortal-API.git
   ```

   Replace `your-username` with your GitHub username.

👉🏻**Create a New Branch**: Move into the project directory using `cd BankingPortal-API` and create a new branch for your changes:

   ```sh
   git checkout -b feature/your-new-feature
   ```

   Replace `your-new-feature` with a descriptive name for your contribution.

👉🏻**Make Changes**: Now, make the desired changes to the codebase using your favorite code editor.

👉🏻**Commit Changes**: After making the changes, save your work and commit the changes with a meaningful commit message:

   ```sh
   git add .
   git commit -m "Add your commit message here"
   ```

👉🏻**Push Changes**: Push your changes to your forked repository:

   ```sh
   git push origin feature/your-new-feature
   ```

👉🏻**Create a Pull Request**: Go to your forked repository on GitHub, and you'll see a "Compare & Pull Request" button. Click on it to create a new pull request.

👉🏻**Wait for Review**: Your pull request will be reviewed by the project maintainers. Make any necessary changes based on their feedback.

**👏🏻👏🏻 Congratulations! 🎉🎊** Your contribution has been accepted and merged into the main repository. You are now a contributor to the project.
