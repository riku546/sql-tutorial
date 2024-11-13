 select shohin_bunrui , sum(hanbai_tanka) from shohin group by shohin_bunrui union all select '全商品' , sum(hanbai_tanka) from shohin;
select shohin_bunrui , sum(hanbai_tanka) from shohin group by rollup(shohin_bunrui);
select shohin_bunrui , torokubi , sum(hanbai_tanka) from shohin group by shohin_bunrui , torokubi order by shohin_bunrui;
select case when grouping(shohin_bunrui) = 1 then '合計' else shohin_bunrui end , sum(hanbai_tanka) from shohin g
roup by rollup(shohin_bunrui);
