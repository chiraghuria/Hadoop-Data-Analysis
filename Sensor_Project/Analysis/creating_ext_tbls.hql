create external table project_sensorhvac.hvac(date string,time string,target_temp int,actual_temp int,system int,system_age int,building_id int, temp_diff int, temp_range string, extreme_temp int)
row format delimited
fields terminated by '\t'
location '/user/cloudera/Projects/Project_SensorHVAC/hvac';

select * from hvac;

create external table project_sensorhvac.building(building_id int,building_mgr string,building_age int,hvac_product string,country string)
row format delimited
fields terminated by  ','
location '/user/cloudera/Projects/Project_SensorHVAC/building';

select * from building limit 5;

create table final_tbl
as
select building.building_id, building.country, building.hvac_product, hvac.target_temp, hvac.actual_temp, hvac.temp_diff, 
       hvac.temp_range, hvac.extreme_temp
from building join hvac on (building.building_id=hvac.building_id);

select * from final_tbl limit 5;
