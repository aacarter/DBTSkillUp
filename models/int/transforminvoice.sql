select LOCATIONID,
LOCATION,
PRODUCTID,
SUM(UNITSSOLD) as sum_units_sold,
AVG(UNITSSOLD) as avg_units_sold
from {{ ref('invoice') }}
group by LOCATIONID, LOCATION, PRODUCTID