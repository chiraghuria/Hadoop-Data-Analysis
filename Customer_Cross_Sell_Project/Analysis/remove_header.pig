data = load '/home/cloudera/Projects/Customer Cross Sell Project/Customer_Cross_sell.csv' using PigStorage('\t');
ranked = rank data;
rem_header = filter ranked by (rank_data>1);
store rem_header into '/home/cloudera/Projects/Customer Cross Sell Project/Customer_Cross_sell_opt.csv';

