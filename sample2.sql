 select shohin_bunrui , sum(hanbai_tanka) from shohin group by shohin_bunrui union all select '全商品' , sum(hanbai_tanka) from shohin;
select shohin_bunrui , sum(hanbai_tanka) from shohin group by rollup(shohin_bunrui);
select shohin_bunrui , torokubi , sum(hanbai_tanka) from shohin group by shohin_bunrui , torokubi order by shohin_bunrui;
select case when grouping(shohin_bunrui) = 1 then '合計' else shohin_bunrui end , sum(hanbai_tanka) from shohin g
roup by rollup(shohin_bunrui);
select * from books;
select name from books;
select name , release_year from books;
select distinct release_year from books;
select name as "書籍名" , total_page as "総ページ数" from books;
select * from books where release_year = 2020;
select * from books where name = '宇宙の歴史';
select * from books where name like '%マンガ%';
