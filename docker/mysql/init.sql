-- Initialize database with correct timezone and clean up old transactions
-- This script will run when the MySQL container is first initialized

-- Set timezone to system timezone
SET GLOBAL time_zone = '+00:00';
SET time_zone = '+00:00';

-- If you want to update existing transactions to current date (OPTIONAL - uncomment if needed)
-- WARNING: This will update ALL existing transaction dates to the current date
-- UPDATE transaction SET transaction_date = NOW();

-- Create indexes for better performance on transaction queries
CREATE INDEX IF NOT EXISTS idx_transaction_date ON transaction(transaction_date);
CREATE INDEX IF NOT EXISTS idx_source_account ON transaction(source_account_id);
CREATE INDEX IF NOT EXISTS idx_target_account ON transaction(target_account_id);
