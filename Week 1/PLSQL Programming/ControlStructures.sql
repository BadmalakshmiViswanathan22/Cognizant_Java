-- ===========================================
-- ControlStructures.sql
-- Exercise 1 : Control Structures
-- ===========================================

----------------------------------------------------
-- CREATE TABLES
----------------------------------------------------

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    LastModified DATE
);

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER,
    LastModified DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
    TransactionID NUMBER PRIMARY KEY,
    AccountID NUMBER,
    TransactionDate DATE,
    Amount NUMBER,
    TransactionType VARCHAR2(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER,
    InterestRate NUMBER,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Position VARCHAR2(50),
    Salary NUMBER,
    Department VARCHAR2(50),
    HireDate DATE
);

----------------------------------------------------
-- INSERT SAMPLE DATA
----------------------------------------------------

INSERT INTO Customers
VALUES (1,'John Doe',TO_DATE('1985-05-15','YYYY-MM-DD'),1000,SYSDATE);

INSERT INTO Customers
VALUES (2,'Jane Smith',TO_DATE('1990-07-20','YYYY-MM-DD'),1500,SYSDATE);

INSERT INTO Accounts
VALUES (1,1,'Savings',1000,SYSDATE);

INSERT INTO Accounts
VALUES (2,2,'Checking',1500,SYSDATE);

INSERT INTO Transactions
VALUES (1,1,SYSDATE,200,'Deposit');

INSERT INTO Transactions
VALUES (2,2,SYSDATE,300,'Withdrawal');

INSERT INTO Loans
VALUES (1,1,5000,5,SYSDATE,ADD_MONTHS(SYSDATE,60));

INSERT INTO Employees
VALUES (1,'Alice Johnson','Manager',70000,'HR',
TO_DATE('2015-06-15','YYYY-MM-DD'));

INSERT INTO Employees
VALUES (2,'Bob Brown','Developer',60000,'IT',
TO_DATE('2017-03-20','YYYY-MM-DD'));

COMMIT;

----------------------------------------------------
-- SCENARIO 1
-- Apply 1% Discount to Loan Interest
-- for Customers Above 60 Years
----------------------------------------------------

BEGIN

    FOR c IN (
        SELECT CustomerID,
               DOB
        FROM Customers
    )
    LOOP

        IF FLOOR(MONTHS_BETWEEN(SYSDATE,c.DOB)/12) > 60 THEN

            UPDATE Loans

            SET InterestRate = InterestRate - (InterestRate*0.01)

            WHERE CustomerID = c.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest Rates Updated');

END;
/

----------------------------------------------------
-- SCENARIO 2
-- VIP Customers
----------------------------------------------------

ALTER TABLE Customers
ADD IsVIP VARCHAR2(5);

BEGIN

    FOR c IN (
        SELECT CustomerID,
               Balance
        FROM Customers
    )
    LOOP

        IF c.Balance > 10000 THEN

            UPDATE Customers
            SET IsVIP='TRUE'
            WHERE CustomerID=c.CustomerID;

        ELSE

            UPDATE Customers
            SET IsVIP='FALSE'
            WHERE CustomerID=c.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('VIP Status Updated');

END;
/

----------------------------------------------------
-- SCENARIO 3
-- Loan Reminder
----------------------------------------------------

BEGIN

    FOR l IN (

        SELECT c.Name,
               l.EndDate

        FROM Customers c
        JOIN Loans l

        ON c.CustomerID=l.CustomerID

        WHERE l.EndDate BETWEEN SYSDATE
        AND SYSDATE+30

    )

    LOOP

        DBMS_OUTPUT.PUT_LINE(

        'Reminder : Dear '

        || l.Name ||

        ', Your Loan is Due on '

        || TO_CHAR(l.EndDate,'DD-MON-YYYY')

        );

    END LOOP;

END;
/

----------------------------------------------------
-- VIEW RESULTS
----------------------------------------------------

SELECT * FROM Customers;

SELECT * FROM Loans;