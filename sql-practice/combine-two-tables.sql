--  Problem: https://leetcode.com/problems/combine-two-tables/description/

-- Solution
SELECT p.firstName, p.lastName, a.city, a.state from Person p
LEFT JOIN Address a on p.personId = a.personId;