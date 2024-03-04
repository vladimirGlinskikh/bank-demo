CREATE TABLE users
(
    user_id     SERIAL PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    email       VARCHAR(255) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    token       VARCHAR(255),
    code        INT,
    verified    INT       DEFAULT 0,
    verified_at TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE accounts
(
    account_id     SERIAL PRIMARY KEY,
    user_id        INT,
    account_number VARCHAR(100) NOT NULL,
    account_name   VARCHAR(50)  NOT NULL,
    account_type   VARCHAR(50)  NOT NULL,
    balance        DECIMAL(18, 2) DEFAULT 0.00,
    created_at     TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
);

CREATE TABLE transaction_history
(
    transaction_id   SERIAL PRIMARY KEY,
    account_id       INT,
    transaction_type VARCHAR(50) NOT NULL,
    amount           DECIMAL(18, 2),
    source           VARCHAR(50),
    status           VARCHAR(50),
    reason_code      VARCHAR(100),
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts (account_id) ON DELETE CASCADE
);

CREATE TABLE payments
(
    payment_id         SERIAL PRIMARY KEY,
    account_id         INT,
    beneficiary        VARCHAR(50),
    beneficiary_acc_no VARCHAR(255),
    amount             DECIMAL(18, 2),
    reference_no       VARCHAR(100),
    status             VARCHAR(50),
    reason_code        VARCHAR(100),
    created_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts (account_id) ON DELETE CASCADE
);

CREATE VIEW v_transaction_history AS
SELECT t.transaction_id,
       a.account_id,
       u.user_id,
       t.transaction_type,
       t.amount,
       t.source,
       t.status,
       t.reason_code,
       t.created_at
FROM transaction_history AS t
         INNER JOIN
     accounts AS a ON t.account_id = a.account_id
         INNER JOIN
     users AS u ON a.user_id = u.user_id;


CREATE VIEW v_payments AS
SELECT p.payment_id,
       a.account_id,
       u.user_id,
       p.beneficiary,
       p.beneficiary_acc_no,
       p.amount,
       p.status,
       p.reference_no,
       p.reason_code,
       p.created_at
FROM payments AS p
         INNER JOIN
     accounts AS a ON p.account_id = a.account_id
         INNER JOIN
     users AS u ON a.user_id = u.user_id;


SELECT *
FROM v_transaction_history;

SELECT *
FROM v_payments;
