with tinventory as (
    select * from {{ source('analytics', 'inventory') }}
    unpivot(QuantityinStock for LOCATIONID in (LOCATIONID1, LOCATIONID2, LOCATIONID3, LOCATIONID4, LOCATIONID5))
)

select 
productid,
product,
TRIM(locationid, 'LOCATIONID') as locationid,
quantityinstock
from tinventory