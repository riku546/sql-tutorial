SELECT ID , 数量
FROM test_table


SELECT *
FROM test_table
WHERE ID > 2


SELECT * 
from test_table
WHere ID < 10
ORDER by 単価 DESC , 売上金額


SELECT 商品名 , sum(売上金額), count(*) , count(商品名)
FROM test_table
GROUP by 商品名
ORDER by sum(売上金額)



SELECT * 
FROM test_table
WHERE 商品名 != 'ニット'
GROUP by 商品名
HAVING sum(売上金額) > 10000
ORDER by 売上金額