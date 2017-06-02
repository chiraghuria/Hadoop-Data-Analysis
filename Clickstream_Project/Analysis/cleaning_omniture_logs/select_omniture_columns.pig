--loading the data

data = load '/user/cloudera/Projects/Project_Clickstream/myfiles/Omniture.0.tsv' using PigStorage('\t');

--extracting the required columns

selective = foreach data generate $13 as user_id, $1 as timestamp, $7 as ip_address, $49 as city, $50 as country, $12 as url;

--removing curly braces from start and end of user_id eg  - {.....}

remove_curly = foreach selective generate SUBSTRING(TRIM(REPLACE(user_id,'^\\{','')),0,36) as user_id, timestamp, ip_address, city, country, url;

no_duplicate = distinct remove_curly;

--storing the cleaned data

store no_duplicate into '/user/cloudera/Projects/Project_Clickstream/omniture_logs.out';
