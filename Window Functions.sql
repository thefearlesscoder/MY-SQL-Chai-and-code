-- similar functionality as group by
-- give the subject names along withe total socre int each subject
-- 1. using group by
SELECT e.subject as subject,
    sum(e.score) as subject_total
FROM exam_scores as e
GROUP BY e.subject;

-- here for genrating the result the group by has shrinked the orignal table to these 5 rows
-- but the requirment is that that a neew table is not created, rather a new colum gets added to the existing table
--  that shows the total marks in front of the subject
-- for this we use the window fumction

-- window fucntion

SELECT 
    *,
    SUM(e.score) as subject_total OVER (PARTITION BY e.subject)
FROM exam_scores as e;

--  partition krke window bana raha hoon, here partition is perfomred on the subject


-- Bank passbook
-- use case of window functions
-- Initial balance - o

-- 31st Dec 100 rupees 100 
-- 1st Jan 500 rupees 600 
-- 11th Jan 500 rupees 1100 
-- 15th Jan 1000 rupees 2100

--  rolling or cumulative sum

CREATE TABLE bank_transactions(
    transaction_id INT PRIMARY KEY,
    account_holder VARCHAR (100),   
    transaction_date DATE,
    transaction_type VARCHAR (20),
    amount DECIMAL (10, 2)
);


INSERT INTO bank_transactions (
    transaction_id,
    account_holder,
    transaction_date,
    transaction_type,
    amount
)
VALUES
    (1, 'Shubham', '2026-01-01', 'DEPOSIT', 1000),
    (2, 'Shubham', '2026-01-03', 'WITHDRAW', -200),
    (3, 'Shubham', '2026-01-05', 'DEPOSIT', 500),
    (4, 'Shubham', '2026-01-07', 'WITHDRAW', -100),
    (5, 'Rahul', '2026-01-01', 'DEPOSIT', 2000),
    (6, 'Rahul', '2026-01-04', 'WITHDRAW', -300),
    (7, 'Rahul', '2026-01-06', 'DEPOSIT', 400);



SELECT *,
    sum(amount) over(
        PARTITION BY account_holder
        ORDER BY transaction_date
    ) AS closing_balance    
FROM bank_transactions;


-- ranking window functions

-- ROW_NUMBER(), RANK(), DENSE_RANK()

-- row number applies ordering ant the windopw level

SELECT e.student_id,
    s.name,
    s.branch,
SUM (score) AS total_score,
ROW_NUMBER () OVER (
    PARTITION BY s.branch
    ORDER BY SUM (e.score) DESC)
FROM exam_scores AS e
    INNER JOIN students as s on.student_id = e.student_id
    GROUP BY e.student_id,
        s.name,
        s.branch;