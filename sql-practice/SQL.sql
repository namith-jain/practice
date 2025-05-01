-- Problem: https://leetcode.com/problems/combine-two-tables/description/ 
-- JOINS

-- Solution
SELECT p.firstName, p.lastName, a.city, a.state from Person p
LEFT JOIN Address a on p.personId = a.personId;

-- Problem: https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
-- JOINS

-- Solution
SELECT e1.name as employee from employee e1
LEFT JOIN employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;

-- Problem: https://leetcode.com/problems/duplicate-emails/description/
-- HAVING, GROUP BY

-- Solution
SELECT email from Person
GROUP BY email
HAVING COUNT(email) > 1;


-- Problem: https://leetcode.com/problems/customers-who-never-order/description/
-- HAVING, GROUP BY

-- Solution
SELECT c.name as Customers from Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;


-- Problem: https://leetcode.com/problems/delete-duplicate-emails/description/
-- DELETE, SUBQUERY, GROUP BY

-- Solution
DELETE p1
FROM Person p1
JOIN (
    SELECT email, MIN(id) as id FROM Person
    GROUP BY email
) p2
ON p1.email = p2.email
AND p1.id > p2.id


-- Problem: https://leetcode.com/problems/rising-temperature/description/
-- DATEDIFF

-- Solution
SELECT w1.Id from Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND w1.temperature > w2.temperature


-- Problem: https://leetcode.com/problems/game-play-analysis-i/description/
-- CTE, ROW_NUMBER

-- Solution
WITH CTE AS(
    SELECT player_id, event_date, ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date ASC) AS rn FROM Activity)

SELECT player_id, event_date AS first_login
FROM CTE
WHERE rn=1;
