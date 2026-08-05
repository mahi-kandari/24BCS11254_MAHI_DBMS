/*https://www.codechef.com/learn/course/sql-intermediate/SQ00BS09/problems/GSQ85D?tab=Submissions*/

select round(
(sum(case when cuisine = "American" then price else 0 end)
/sum(price))*100,2) 
as American_Revenue
from orders;

