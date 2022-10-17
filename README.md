I use PostgreSQL to finish this SQL assessment

Question 1:
| sum_clicks  |
|-------------|
|   1792      |

Question 2: 
| store_location  |sum_revenue|
|-----------------|-----------|
|United States-CA	| 235237    |
|United States-NY	| 51984     |
|United States-TX	| 9629      |

Question 3:
| date     | geo|impressions|clicks|revenue|
|----------|----|-----------|------|-------|
|2016-01-01| TX	|2532	      |45	   |654    |
|2016-01-01| CA	|3425	      |63	   |	334  |
|2016-01-01| NY	|3532	      | 25	 |	284  |
|2016-01-01| MN	|1342	      |	784  |	     |
|2016-01-02| TX	|3643	      |	23	 |5765   |
|2016-01-02| CA	|1354	      |	53	 |465    |
|2016-01-02| NY	|4643	      |	85	 |2574   |
|2016-01-02| MN	|2366	      |	85	 |       |
|2016-01-03| TX	|2353	      |	57	 |423    |
|2016-01-03| CA	|5258	      |	36	 |234334 |
|2016-01-03| NY	|4735	      |	63	 |3479   |
|2016-01-03| MN	|5783	      |	87	 |       |
|2016-01-04| TX	|5783	      |	47	 |2357   |
|2016-01-04| CA	|7854	      |	85	 |36     |
|2016-01-04| NY	|4754	      |	36	 |45289  |
|2016-01-04| MN	|9345	      |	24	 |       |
|2016-01-05| TX	|2535	      |	63	 |427    |
|2016-01-05| CA	|4678	      |	73	 |68     |
|2016-01-05| NY	|2364	      |	33   |	358  |
|2016-01-05| MN	|3452	      |	25   |	     |
|2016-01-06| TX	|		        |      | 3     |

Question 4: 
In my opinion, store in CA is the most efficient as it has the highest average revenue per click
|geo|avg_revenue_per_click|
|---|---------------------|
|CA	|1304.9415972492209   |
|NY	|273.14816755793225   |
|TX	|65.90665476518926    |

Question 5:
|store_location  |rank|
|----------------|----|
|United States-CA|	1 |
|United States-NY|	2 |
|United States-TX|	3 |
