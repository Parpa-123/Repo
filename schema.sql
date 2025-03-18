CREATE DATABASE bank;
USE bank;
CREATE TABLE accounts (
    num BIGINT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    balance FLOAT
);
