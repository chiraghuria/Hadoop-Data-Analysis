--loading HVAC data
data = load '/user/cloudera/Projects/Project_SensorHVAC/HVAC.csv' using PigStorage(',') as (Date:chararray,Time:chararray,TargetTemp:int,ActualTemp:int,System:int,SystemAge:int,BuildingID:int);

/*
--loading Buidling data
building_data = load '/user/cloudera/Projects/Project_SensorHVAC/building.csv' using PigStorage(',');
--dump data2;
*/

--removing the header from HVAC data 
ranked = rank data;
filter_ranked = filter ranked by (rank_data>1);
ordered_data = order filter_ranked by rank_data;
--lim_data = limit ordered_data 5;
--dump lim_data;

--adding temperature difference column
add_tempdiff = foreach ordered_data generate Date..BuildingID, ActualTemp-TargetTemp as Temp_Diff;
--dump add_tempdiff;

--adding temperature range column
add_temprange = foreach add_tempdiff generate Date.., (CASE
		WHEN ABS(Temp_Diff)<=5 THEN 'NORMAL'
		WHEN Temp_Diff<-5 THEN 'COLD'
		WHEN Temp_Diff>5 THEN 'HOT'
		END) as Temp_Range;
--dump add_temprange;

--adding extreme temperature column
add_extremetemp = foreach add_temprange generate Date.., (Temp_Range!='NORMAL'?1:0) as Extreme_Temp;
--dump add_extremetemp;
/*
hvac_building = join add_extremetemp by BuildingID, building_data by $0;
join_building = foreach hvac_building generate $0..$5, $7..;
--lim_join = limit join_building 5;
--dump lim_join;
*/
store add_extremetemp into '/user/cloudera/Projects/Project_SensorHVAC/building';
