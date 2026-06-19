-- CTE : common table expression
-- creating temporary table
-- also called WITH query since starts with "WITH"
-- similar to subquery

-- WITH ____ AS(
--     -- ? sql query
-- );

WITH cls_avg AS ( -- temporary table in memory
    SELECT AVG(score) AS class_avg
    FROM exam_scores
)
SELECT
    s.name AS student_name,
    s.branch AS student_branch,
    e.score,
    ca.class_avg
FROM exam_scores AS e
INNER JOIN students AS s
    ON s.student_id = e.student_id
CROSS JOIN cls_avg AS ca
WHERE e.score > ca.class_avg 