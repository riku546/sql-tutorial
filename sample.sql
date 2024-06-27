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




SELECT *
from test_table
WHERE 売上金額 Between 10000 and 200000


SELECT *
from test_table 
WHERE 商品名 Like '%A%'

SELECT Distinct JOB
from EMP


INSERT INTO test_table (name , price , tax )
VALUES('test' , 1000 , 0.1)


SELECT A.氏名 , A.数学, B.国語
from test01 as A
INNER JOIN test02 as B
on A.氏名 = B.氏名


SELECT *
from test_table
WHERE not 商品名 = 'ニット';


SELECT *
from test_table
WHere 商品名 is null;


SELECT *
from test_table
WHere 商品名 is not null;


SELECT *
from test_table
where 商品名 = 'ニット' and 売上金額 = 3000




SELECT *
from test_table
where 商品名 = 'ニット' or 売上金額 = 3000


SELECT *
from test_table
ORDER by 売上金額 DESC
limit 10;

SELECT 商品名 as a
from test_table as test


SELECT *
from test_tablea
where > (
    SELECT 売上金額
    from test_table
    where  単価 > 1000
);


SELECT *
FROM players
join countries 
on players.country_id = countries.id
left join teams
on players.previous_team_id = teams.id;


SELECT countries.name as '国名' , avg(goals) as '平均得点'
FROM players
join countries
on countries.id = players.country_id
group by countries.name;



select name , price , price - cost
from items


select avg(price - cost)
from items;



select name , price - cost
from items
order by price - cost desc
limit 5;


select name , price
from items
where price  >   (
select price
from items
where name = 'グレーパーカー'

);


select name , price - cost
from items
where price <= 7000 and  price -cost > (
select price - cost
from items
where name = 'グレーパーカー'

);



select item_id , count(item_id)
from sales_records
group by item_id;


select item_id , count(item_id)
from sales_records
group by item_id
order by count(item_id) desc
limit 5;


