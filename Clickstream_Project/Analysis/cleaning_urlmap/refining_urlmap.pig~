data = load '/user/cloudera/Projects/Project_Clickstream/myfiles/urlmap/urlmap.tsv' using PigStorage('\t');

ranked = rank data;

noheader = filter ranked by ($0>1);

order_noheader = order noheader by $0;

clean_data = foreach order_noheader generate $1, $2;

store clean_data into '/user/cloudera/Projects/Project_Clickstream/url_product/';
