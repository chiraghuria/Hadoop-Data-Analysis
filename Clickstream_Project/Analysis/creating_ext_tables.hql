create external table if not exists omniture_logs (user_id string, date_time timestamp, ip_address string, city string, country string, url string) 
row format delimited
fields terminated by '\t'
location '/user/cloudera/Projects/Project_Clickstream/omniture_logs.out/';

create external table if not exists registered_user (user_id string, DOB date, gender char)
row format delimited
fields terminated by '\t'
location '/user/cloudera/Projects/Project_Clickstream/myfiles/regusers/';

create external table if not exists url_product (url string, product string)
row format delimited
fields terminated by '\t'
location '/user/cloudera/Projects/Project_Clickstream/url_product.out/'

