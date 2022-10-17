-- create marketing_data table
drop table if exists public.marketing_data

CREATE TABLE public.marketing_data
(
date date, 
geo varchar(2), 
impressions float, 
clicks float);

copy public.marketing_data
from '/Users/xxxeeee/Desktop/marketing_data.csv' delimiters ',' csv

-- create store_revenue table
drop table if exists public.store_revenue

CREATE TABLE public.store_revenue
(
date date, 
brand_id int, 
store_location varchar(250), 
revenue float);

copy public.store_revenue
from '/Users/xxxeeee/Desktop/store_revenue.csv' delimiters ',' csv

-- Question #1 Generate a query to get the sum of the clicks of the marketing data​
select sum(clicks) as sum_clicks
from marketing_data

-- Question #2 Generate a query to gather the sum of revenue by store_location from the store_revenue table​
select store_location, sum(revenue) as sum_revenue
from store_revenue
group by store_location
order by store_location

-- Question #3 Merge these two datasets so we can see impressions, clicks, and revenue together by date and geo. Please ensure all records from each table are accounted for.​
-- use outer full join to make sure all records from each table are accounted for
-- use coalesce(geo, right(store_location, 2)) to fill the missing value in geo with the state abbreviation in store_location
-- use coalesce(t.date, marketing_data.date) to fill the missing date value in store_revenue table with date in marketing_data table
select coalesce(t.date, marketing_data.date) as date, coalesce(geo, right(store_location, 2)) as geo, impressions, clicks, revenue
from
(select date, store_location, sum(revenue) as revenue
from store_revenue 
group by date, store_location) t
full outer join marketing_data
on right(store_location, 2) = geo and t.date = marketing_data.date

-- Question #4 In your opinion, what is the most efficient store and why?​
-- based on the table of Question 3(t1), I compute the average revenue per click of each state and order by the average revenue per click
-- store in CA is the most efficient as it has the highest average revenue per click
with t1 as (select coalesce(t.date, marketing_data.date) as date, coalesce(geo, right(store_location, 2)) as geo, impressions, clicks, revenue
from
(select date, store_location, sum(revenue) as revenue
from store_revenue 
group by date, store_location) t
full outer join marketing_data
on right(store_location, 2) = geo and t.date = marketing_data.date)

select geo, avg(revenue/clicks) as avg_revenue_per_click
from t1
where revenue is not null
group by geo
order by avg_revenue_per_click desc

-- Question #5 Generate a query to rank in order the top 10 revenue producing states​
-- rank store_location by sum(revenue) of that store_location
select store_location, rank() over(order by sum(revenue) desc)
from store_revenue
group by store_location
limit 10



