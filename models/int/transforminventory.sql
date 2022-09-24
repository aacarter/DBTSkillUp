with tinventory as (
    select * from {{ source('analytics', 'inventory') }}
    unpivot(QuantityinStock for LOCATIONID in (LOCATIONID1, LOCATIONID2, LOCATIONID3, LOCATIONID4, LOCATIONID5))
)

select 
productid,
product,
case when LOCATIONID = 'LOCATIONID1' then '010'
when LOCATIONID = 'LOCATIONID2' then '020'
when LOCATIONID = 'LOCATIONID3' then '030'
when LOCATIONID = 'LOCATIONID4' then '050'
when LOCATIONID = 'LOCATIONID5' then '060' end as LOCATIONID,
quantityinstock
from tinventory