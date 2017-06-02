data = load '/user/cloudera/Projects/Project_Clickstream/myfiles/regusers.tsv' using PigStorage('\t');

--ranking of the input data from regusers to get rid of the header line

ranked = rank data;

filter_rank = filter ranked by ($0>1);

--to retain order of the original dataset and filtering out the rank column

orderdata = order filter_rank by $0;
noheader = foreach orderdata generate $1, $2, $3;

store noheader into '/user/cloudera/Projects/Project_Clickstream/regusers.tsv';



