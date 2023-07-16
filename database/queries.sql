select "transactionId", "title", "groupId", "total", "payedBy", "comment", "createdAt" from transactions ;

--  transactionId |      title      | groupId | total | payedBy | comment |           createdAt
-- ---------------+-----------------+---------+-------+---------+---------+-------------------------------
--             37 | Fischrestaurant |       9 |   100 |       1 |         | 2023-06-04 21:21:17.779367+02
--             45 | Tank            |       9 |   100 |      20 |         | 2023-06-05 16:25:01.396023+02


--
-- Example 45: split the bill equally
--

SELECT
"userTransaction"."transactionId",  "users"."userId",  "users"."username", "userTransaction"."amount"
FROM "userTransaction"
LEFT JOIN "users" ON "userTransaction"."userId" = "users"."userId"
WHERE "transactionId" = 45
ORDER BY "amount", "username";


--
-- Result:  look for Mary, she is the one who paid the bill
--          this is why there are two entries for her:
--          a positive one for what she payed
--          a negative one for what she should pay for this transaction
--

--  transactionId | userId | username | amount
-- ---------------+--------+----------+--------
--             45 |     18 | Kalin    |    -25
--             45 |     20 | Mary     |    -25
--             45 |     19 | Tom      |    -25
--             45 |      1 | Vinz     |    -25
--             45 |     20 | Mary     |    100


--
-- Example 37: split the bill unequally
--


SELECT
"userTransaction"."transactionId",  "users"."userId",  "users"."username", "userTransaction"."amount"
FROM "userTransaction"
LEFT JOIN "users" ON "userTransaction"."userId" = "users"."userId"
WHERE "transactionId" = 37
ORDER BY "amount", "username";


--  transactionId | userId | username | amount
-- ---------------+--------+----------+--------
--             37 |     18 | Kalin    |    -35
--             37 |     20 | Mary     |    -25
--             37 |     19 | Tom      |    -20
--             37 |      1 | Vinz     |    -20
--             37 |      1 | Vinz     |    100
