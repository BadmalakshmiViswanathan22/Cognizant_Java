-- ===========================================
-- StoredProcedures.sql
-- Exercise 3 : Stored Procedures
-- ===========================================

SET SERVEROUTPUT ON;

--------------------------------------------------------
-- Scenario 1
-- Process Monthly Interest
--------------------------------------------------------

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01),
        LastModified = SYSDATE
    WHERE AccountType = 'Savings';

    DBMS_OUTPUT.PUT_LINE('Monthly Interest Processed Successfully');
END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

--------------------------------------------------------
-- Verify Scenario 1
--------------------------------------------------------

SELECT * FROM Accounts;

--------------------------------------------------------
-- Scenario 2
-- Update Employee Bonus
--------------------------------------------------------

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus
(
    p_Department IN VARCHAR2,
    p_BonusPercent IN NUMBER
)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_BonusPercent / 100)
    WHERE Department = p_Department;

    DBMS_OUTPUT.PUT_LINE('Employee Bonus Updated Successfully');
END;
/

BEGIN
    UpdateEmployeeBonus('HR',10);
END;
/

--------------------------------------------------------
-- Verify Scenario 2
--------------------------------------------------------

SELECT * FROM Employees;

--------------------------------------------------------
-- Scenario 3
-- Transfer Funds
--------------------------------------------------------

CREATE OR REPLACE PROCEDURE TransferFunds
(
    p_FromAccount IN NUMBER,
    p_ToAccount IN NUMBER,
    p_Amount IN NUMBER
)
AS
    v_Balance NUMBER;
BEGIN

    SELECT Balance
    INTO v_Balance
    FROM Accounts
    WHERE AccountID = p_FromAccount;

    IF v_Balance >= p_Amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_Amount,
            LastModified = SYSDATE
        WHERE AccountID = p_FromAccount;

        UPDATE Accounts
        SET Balance = Balance + p_Amount,
            LastModified = SYSDATE
        WHERE AccountID = p_ToAccount;

        INSERT INTO Transactions
        (
            TransactionID,
            AccountID,
            TransactionDate,
            Amount,
            TransactionType
        )
        VALUES
        (
            3,
            p_FromAccount,
            SYSDATE,
            p_Amount,
            'Transfer'
        );

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

END;
/

BEGIN
    TransferFunds(1,2,200);
END;
/

--------------------------------------------------------
-- Verify Scenario 3
--------------------------------------------------------

SELECT * FROM Accounts;

SELECT * FROM Transactions;

COMMIT;