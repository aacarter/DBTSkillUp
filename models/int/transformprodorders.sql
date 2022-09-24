with dateconcat as (
    select LOCATIONID,
    PRODID,
    ONORDERQTY,
    CONCAT(ETAMONTH,' ',ETADAY,', ',ETAYEAR) as ETADATE
    from {{ ref('prodorders') }}
)

select 
LOCATIONID,
PRODID,
SUM(ONORDERQTY) as ONORDERQTY,
MIN(ETADATE) as ETADATE
from dateconcat
group by LOCATIONID,PRODID