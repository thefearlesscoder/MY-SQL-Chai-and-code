show tables;

-- sub queries / nestes queries

--  calculate the class average score
SELECT AVG(score) as class_avg FROM exam_scores;

--  fetch the records were the score is greater than the avrrage score
-- note: subquery must return as single column since we are comparing with as single value

select * FROM exam_scores where score > ( SELECT avg(score) from exam_scores );

-- ! criteria for placement
-- 1. atleast one exam attempt as score >= 90
--  and any ine of the project should have marks >= 85

