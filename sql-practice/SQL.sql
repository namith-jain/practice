-- Problem: https://leetcode.com/problems/combine-two-tables/description/ 
-- Joins

-- Solution
SELECT p.firstName, p.lastName, a.city, a.state from Person p
LEFT JOIN Address a on p.personId = a.personId;

-- Problem: https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
-- Joins

-- Solution
SELECT e1.name as employee from employee e1
LEFT JOIN employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;