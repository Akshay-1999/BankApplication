-- Enable extension for UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Users Table
CREATE TABLE Users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE NOT NULL,
    aadhar VARCHAR(20) UNIQUE,
    pancard VARCHAR(20) UNIQUE,
    address TEXT,
    dob DATE,
    gender VARCHAR(10),
    age INT,
    unique_user_id VARCHAR(50) UNIQUE NOT NULL
);

-- Account_Type Table
CREATE TABLE Account_Type (
    account_type_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    account_type_name VARCHAR(50) NOT NULL
);

-- Account Table
CREATE TABLE Account (
    account_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES Users(user_id) ON DELETE CASCADE,
    account_type_id UUID REFERENCES Account_Type(account_type_id),
    branch_name VARCHAR(100),
    balance NUMERIC(15,2) DEFAULT 0.0
);

-- Login Table
CREATE TABLE Login (
    login_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES Users(user_id) ON DELETE CASCADE,
    account_id UUID REFERENCES Account(account_id) ON DELETE CASCADE,
    password VARCHAR(255) NOT NULL
);
