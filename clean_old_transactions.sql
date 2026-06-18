-- Script to clean up old transaction data
-- WARNING: This will delete ALL existing transactions
-- Only run this if you want to start fresh

USE bankingapp;

-- Option 1: Delete all transactions (uncomment to use)
-- DELETE FROM transaction;

-- Option 2: Update all existing transactions to current date (uncomment to use)
-- UPDATE transaction SET transaction_date = NOW();

-- To execute this script, run:
-- mysql -u root -p bankingapp < clean_old_transactions.sql
