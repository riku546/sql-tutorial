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
select * from authors where gender = '男性' limit 3;
select * from books where release_year is not null;
select * from books where total_page between 300 and 400;
select * from books where release_year in (2004 , 2008 , 2018);
select book_id , price * 1.1 as tax_included_price from book_sales;
select * from books where total_page < 100;
select * from stores where holiday <> '月曜日';
select * from books where release_year >= 2000 and total_page <= 200;
select count(*) from authors where gender = '女性';
select sum(figure) as sum from book_sales;
select avg(total_page) from books;
select max(total_page) , min(total_page) from books;
select * from books order by release_year desc;
select release_year , count(*) as books_num from books group by release_year order by books_num desc;
select release_year , count(*) as books_num from books group by release_year having count(*) >= 2 order by books_num desc;
insert into events values(3 , '2022 WEBデザイントレンド' , 100);
select * from events;
update events set max_num = 30 where id = 2;
select * from events;
delete from events where id = 2;
select * from events;
select * from books as b1 where total_page > (select b2.total_page from books as b2 where name = 'コードと回路');
select * from books as b1 where release_year in (select b2.release_year from books as b2 where name in ('時短レシピ100' , 'かもめ飛行'));
select b.name as book_name , a.name as author_name from books as b inner join book_authors as ba on b.id = ba.book_id inner join authors as a on  ba.author_id = a.id;
select * from books where release_year is null;
select name , total_page from books order by total_page desc;
select c.name , count(*) as num from books as b  inner join book_categories as bc  on b.id = bc.book_id inner join categories as c on bc.category_id = c.id group by c.name  order by num desc , c.name limit 3;
delete from events where id = 1;
select * from events;
select gender , count(*) as num from authors group by gender order by num desc;
select s.name , sum(b.price * b.figure) from book_sales as b inner join stores as s on b.store_id = s.id group by s.name order by s.name;
select b.name , bs.price , (bs.price * 0.1) as tax from books as b inner join book_sales as bs on b.id = bs.book_id;
select b.name from books as b inner join book_sales as bs on b.id = bs.book_id where bs.store_id = (select id from stores where name = 'オンライン');
select c.name, sum(price * figure) as sales from book_sales as bs inner join book_categories as bc on bs.book_id = bc.book_id inner join categories as c on bc.category_id = c.id group by c.id order by sales desc limit 3; 
select a.name , count(*) as published_title_num from books as b inner join book_authors as ba on b.id = ba.book_id inner join authors as a on ba.author_id = a.id group by a.name order by published_title_num desc , a.name limit 3;
select b.name from books as b  inner join book_categories as bc on b.id = bc.book_id inner join categories as c on bc.category_id = c.id group by b.name having count(b.name) >= 2;
select b.name from books as b inner join book_authors as ba on b.id = ba.book_id inner join authors as a on ba.author_id = a.id where (b.name like '%宇宙%' or b.name like '%星%') and a.gender = '女性';
delete from events where id = 1;
update events set max_num = 200 where id = 2;
insert into events (id , name , max_num) values (3 , '古本まつり' , 75);
select * from events;
select coalesce(t.tenpo_id, '不明') , coalesce(t.tenpo_mei , '不明') , s.shohin_id , s.shohin_mei , s.hanbai_tanka from shohin as s left join tenpo  as t on s.shohin_id = t.shohin_id;
select shohin_id , shohin_mei , shohin_bunrui , hanbai_tanka , (select avg(hanbai_tanka) from shohin) as hanbai_tanka_all from shohin;
select shohin_id , shohin_mei , shohin_bunrui , hanbai_tanka , (select avg(hanbai_tanka) from shohin as s2 where s2.shohin_bunrui = s1.shohin_bunrui group by shohin_bunrui) as avg_hanbai_tanka from shohin as s1;
select e1.name , e1.salary from employees as e1 where e1.salary >= (select avg(e2.salary) from employees as e2 where e1.department_id = e2.department_id group by department_id) as avg_salary;
create table subjects (id integer autoincrement , subject text not null , prof_id integer not null unique, foreign key (prof_id) references pros(id) , primary key(id));
select * from books where release_year is null;
select name , total_page from books order by total_page desc;
select c.name , count(*) as num from books as b inner join book_categories as bc on b.id = bc.book_id inner join categories as c on bc.category_id = c.id group by c.name order by num desc , c.name limit 3; 
select e1.name , e1.salary from employees as e1 where e1.salary >= (select avg(e2.salary) from employees as e2 where e1.department_id = e2.department_id group by department_id) as avg_salary;
delete from events where id = 1;
select * from events;
select gender , count(*) as num from authors  group by gender order by num desc;
select b.name from books as b inner join book_sales as bs on b.id = bs.book_id group by b.name having sum(bs.stock) = 0 ;
select s.name , sum(bs.price * bs.figure) as sales from book_sales as bs inner join stores as s on bs.store_id = s.id group by s.name order by s.name;
select b.name , bs.price , (bs.price * 0.1) as tax from books as b inner join book_sales as bs on b.id = bs.book_id;
select b.name  as name from books as b inner join book_sales as bs on b.id = bs.book_id inner join stores as s on bs.store_id = s.id where bs.book_id in (select bs2.book_id from book_sales as bs2 where bs2.store_id = 3) group by b.name having count(*) = 1 order by name;
select c.name ,  sum(bs.price * bs.figure) as sales from categories as c inner join book_categories as bc on c.id = bc.category_id inner join book_sales as bs on bc.book_id = bs.book_id group by c.name order by sales desc limit 3;
select a.name , count(*) as published_title_num from authors as a inner join book_authors as ba on a.id = ba.author_id group by a.name order by published_title_num desc , a.name limit 3;
select b.name from books as b inner join book_categories as bc on b.id = bc.book_id group by b.name having  count(*) >= 2; 
select b.name from books as b inner join book_authors as ba on b.id = ba.book_id inner join authors as a on ba.author_id = a.id where (b.name like '%宇宙%' or b.name like '%星%') and a.gender = '女性';
delete from events where id = 1;
update events set max_num = 200 where id = 2;
insert into events values(3 , '古本まつり' , 75);
select * from events;
select id , f_roman , g_roman from students where id == 3 and tel like '090%'　limit 2;
select id , f_roman , g_roman , pref from students where id between 10030 and 10039 (pref in ('Chiba' , 'g_roman' , 'pref'));
select c.id from classes as c where prof_id = (select p.id from profs.p where name = 'Mitchell Orange');
select count(id) as total , class_id from students group by class_id;
select count(id) , pref from students as s inner join classes as c on s.class_id = c.id inner join profs as p  on c.prof_id = p.id where p.name = 'Mitchell Orange' group by s.pref;
select * from students where pref = 'Tokyo' and tel is not null order by class_id;
delete from players where name = 'Trout';
update players set weight = 107 where name = 'Trout';
select name from players where hometown like 'g%';
select count(*) as n_players , team from players group by team;
select name from players order by height desc;
select name , weight from players where weight <= 98;
INSERT INTO players (name, height, weight, team) VALUES
('Ohtani', 193, 95, 'Angels'),
('Sawamura', 183, 96, 'Red Sox'),
('Trout', 188, 106, 'Angels'),
('Darvish', 196, 99, 'Padres');

CREATE TABLE players (
    name TEXT PRIMARY KEY,
    height INTEGER NOT NULL,
    weight INTEGER NOT NULL,
    team TEXT NOT NULL,
    FOREIGN KEY (team) REFERENCES baseball_teams(name)
);

insert into baseball_teams values ('Angels' , 'LosAngeles');
insert into baseball_teams values ('Red Sox' , 'Boston');
insert into baseball_teams values ('Padres' , 'San Diego');
create table baseball_teams (name text primary key , hometown text);
select b.name from books as b inner join book_sales as bs on b.id = bs.book_id  group by name having sum(stock) = 0;
select s.name , sum(price * figure) as sales from book_sales as bs inner join stores as s on bs.store_id = s.id group by s.name order by s.name;
select b.name , bs.price , bs.price * 0.1 as tax from books as b inner join book_sales as bs on b.id = bs.book_id;
select a.name , count(*) as published_title_num from book_authors as ba inner join authors as a on ba.author_id = a.id inner join books as b on ba.book_id = b.id  group by a.name  order by published_title_num desc , a.name limit 3; 
select b.name from books as b inner join book_categories as bc on b.id = bc.book_id inner join categories as c on c.id = bc.category_id group by b.name having count(*) >= 2;
select b.name from books as b inner join book_authors as ba on b.id = ba.book_id inner join authors as a on ba.author_id = a.id where a.gender = '女性' and (b.name like '%宇宙%' or b.name like '%星%');
