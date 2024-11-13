 select shohin_bunrui , sum(hanbai_tanka) from shohin group by shohin_bunrui union all select '全商品' , sum(hanbai_tanka) from shohin;
