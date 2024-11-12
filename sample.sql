SELECT
    ID,
    数量
FROM
    test_table
SELECT
    *
FROM
    test_table
WHERE
    ID > 2
SELECT
    *
from
    test_table
WHere
    ID < 10
ORDER by
    単価 DESC,
    売上金額
SELECT
    商品名,
    sum(売上金額),
    count(*),
    count(商品名)
FROM
    test_table
GROUP by
    商品名
ORDER by
    sum(売上金額)
SELECT
    *
FROM
    test_table
WHERE
    商品名 != 'ニット'
GROUP by
    商品名
HAVING
    sum(売上金額) > 10000
ORDER by
    売上金額
SELECT
    *
from
    test_table
WHERE
    売上金額 Between 10000
    and 200000
SELECT
    *
from
    test_table
WHERE
    商品名 Like '%A%'
SELECT
    Distinct JOB
from
    EMP
INSERT INTO
    test_table (name, price, tax)
VALUES
    ('test', 1000, 0.1)
SELECT
    A.氏名,
    A.数学,
    B.国語
from
    test01 as A
    INNER JOIN test02 as B on A.氏名 = B.氏名
SELECT
    *
from
    test_table
WHERE
    not 商品名 = 'ニット';

SELECT
    *
from
    test_table
WHere
    商品名 is null;

SELECT
    *
from
    test_table
WHere
    商品名 is not null;

SELECT
    *
from
    test_table
where
    商品名 = 'ニット'
    and 売上金額 = 3000
SELECT
    *
from
    test_table
where
    商品名 = 'ニット'
    or 売上金額 = 3000
SELECT
    *
from
    test_table
ORDER by
    売上金額 DESC
limit
    10;

SELECT
    商品名 as a
from
    test_table as test
SELECT
    *
from
    test_tablea
where
    > (
        SELECT
            売上金額
        from
            test_table
        where
            単価 > 1000
    );

SELECT
    *
FROM
    players
    join countries on players.country_id = countries.id
    left join teams on players.previous_team_id = teams.id;

SELECT
    countries.name as '国名',
    avg(goals) as '平均得点'
FROM
    players
    join countries on countries.id = players.country_id
group by
    countries.name;

select
    name,
    price,
    price - cost
from
    items
select
    avg(price - cost)
from
    items;

select
    name,
    price - cost
from
    items
order by
    price - cost desc
limit
    5;

select
    name,
    price
from
    items
where
    price > (
        select
            price
        from
            items
        where
            name = 'グレーパーカー'
    );

select
    name,
    price - cost
from
    items
where
    price <= 7000
    and price - cost > (
        select
            price - cost
        from
            items
        where
            name = 'グレーパーカー'
    );

select
    item_id,
    count(item_id)
from
    sales_records
group by
    item_id;

select
    item_id,
    count(item_id)
from
    sales_records
group by
    item_id
order by
    count(item_id) desc
limit
    5;

select
    i.id,
    i.name,
    count(sale.item_id)
from
    items as i
    join sales_records as sale on i.id = sale.item_id
group by
    sale.item_id
order by
    count(sale.item_id) desc
limit
    5;

select
    sum(i.price) as '総売上',
    sum(i.price - i.cost) as '総利益'
from
    items as i
    join sales_records as sale on i.id = sale.item_id
select
    purchased_at,
    count(purchased_at) as '販売個数'
from
    sales_records
group by
    purchased_at
order by
    purchased_at;

select
    purchased_at,
    sum(price) as '売上額'
from
    items as i
    join sales_records as sale on i.id = sale.item_id
group by
    purchased_at
order by
    purchased_at
select
    u.id,
    u.name,
    count(sale.user_id) as '購入数'
from
    users as u
    join sales_records as sale on u.id = sale.user_id
group by
    u.id
having
    count(u.id) >= 10;

select
    distinct u.id,
    u.name
from
    users as u
    join sales_records as sale on u.id = sale.user_id
where
    sale.item_id = (
        select
            id
        from
            items
        where
            name = 'サンダル'
    );

select
    i.gender,
    sum(i.price) as '売上額'
from
    sales_records as sale
    join items as i on sale.item_id = i.id
group by
    i.gender;

select
    i.id,
    i.name,
    sum(price) as '売上額'
from
    sales_records as sale
    join items as i on sale.item_id = i.id
group by
    i.id
order by
    sum(price) desc
limit
    5;

select
    i.id,
    i.name,
    sum(price)
from
    sales_records as sale
    join items as i on sale.item_id = i.id
group by
    i.id
having
    sum(price) > (
        select
            sum(price)
        from
            sales_records as sale
            join items as i on sale.item_id = i.id
        group by
            i.id
        having
            i.name = 'グレーパーカー'
    );

Insert into
    students(name, course)
values
    ('Kate', 'Java');

update
    students
set
    name = 'jordan',
    course = 'HTML'
WHERE
    id = 6;

delete from
    students
where
    id = 7;

select
    release_year,
    count(*) as books_num
from
    books
group by
    release_year
having
    count(*) >= 2
order by
    books_num desc;

select
    *
from
    (
        select
            shohin_bunrui,
            count(*) as cnt_shohin
        from
            shohin
        group by
            shohin_bunrui
    ) as shohin_bunrui_num
where
    cnt_shohin >= 4;

create view ViewRenshu5_1 (shohim_mei, hanbai_tanka, torokubi) as
select
    shohin_mei,
    hanbai_tanka,
    torokubi
from
    shohin
where
    hanbai_tanka >= 1000
    and torokubi = '2009-09-20';

create view AvgTankaByBunrui as
select
    shohin_id,
    shohin_mei,
    shohin_bunrui,
    hanbai_tanka,
    (
        select
            avg(hanbai_tanka)
        from
            shohin as s2
        where
            s2.shohin_bunrui = s1.shohin_bunrui
        group by
            s2.shohin_bunrui
    ) as avg_hanbai_tanka
from
    shohin as s1
select
    count(
        case
            when hanbai_tanka <= 1000 then hanbai_tanka
        end
    ) as low_price,
    count(
        case
            when hanbai_tanka between 1001
            and 3000 then hanbai_tanka
        end
    ) as mid_price,
    count(
        case
            when hanbai_tanka >= 3001 then hanbai_tanka
        end
    ) as high_price
from
    shohin;

select
    id,
    name,
    (
        select
            case
                when salary < 50000 then '低'
                when salary between 50000
                and 99999 then '中'
                when salary >= 100000 then '高'
            end
    ) as level
from
    employees;

select
    id,
    name,
    (
        case
            when category in ('A', 'B') then 'グループ１'
            when category = 'C' then 'グループ２'
            else 'その他'
        end
    ) as category
from
    products;

select
    gender,
    count(*) as num
from
    authors
group by
    gender
order by
    num desc;

select
    id,
    postion,
    name,
    height,
    weight
from
    players
where
    height > 195
union
all
select
    id,
    postion,
    name,
    height,
    weight
from
    players
where
    weight > 95
order by
    id;

select
    p.id,
    p.price,
    s.saleNum
from
    product as p
    inner join sale as s on p.id = s.id;

select
    b.book_name,
    a.author_name
from
    books as b
    inner join book_authors as ba on b.id = ba.book_id
    inner join authors as a on ba.author_id = a.id;

select
    shohim_mei,
    shohin_bunrui,
    hanbai_tanka,
    rank() over (
        partition by shohin_bunrui
        order by
            hanbai_tanka
    ) as ranking
from
    shohin;

select
    shohin_mei,
    shohin_bunrui,
    hanbai_tanka,
    rank() over (
        order by
            hanbai_tanka
    ) as ranking
from
    shohin;