---count hot and cold by coundtry and temp_range

create table hvacbuilding_countextreme
as
select final_tbl.country, final_tbl.temp_range, count(*) as count_extreme
from final_tbl
where final_tbl.extreme_temp > 0
group by final_tbl.country, final_tbl.temp_range;

---count hot/cold by country---

create table hvacbuilding_countcold
as
select final_tbl.country, count(*) as count_cold
from final_tbl
where final_tbl.temp_range='COLD'
group by final_tbl.country;



create table hvacbuilding_counthot
as
select final_tbl.country, count(*) as count_hot
from final_tbl
where final_tbl.temp_range='HOT'
group by final_tbl.country;

------count by product---------

create table hvacbuilding_countbyprod
as
select final_tbl.country, final_tbl.hvac_product, count(*) as count_extremetemp
from final_tbl
where final_tbl.extreme_temp>0
group by final_tbl.hvac_product, final_tbl.country
order by count_extremetemp;

