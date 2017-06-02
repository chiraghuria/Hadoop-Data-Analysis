--joining user id

create view temp1 as select ol.user_id, ru.dob, ru.gender, ol.city, ol.country, ol.url, ol.ip_address, ol.date_time from registered_user ru
join omniture_logs ol
on ru.user_id==ol.user_id;

create view temp2 as select * from url_product up
join temp1 t1
on t1.url==up.url;

create table clickstream_analysis like temp2;
insert overwrite table clickstream_analysis select * from temp2;

