with invoicejoin as (
    select a.productid, a.product,a.locationid,a.quantityinstock, b.LOCATION,b.sum_units_sold,b.avg_units_sold
    from {{ ref('transforminventory') }} a
    left outer join {{ ref('transforminvoice') }} b
    on a.locationid=b.locationid and a.productid=b.productid
)

select i.PRODUCTID,i.PRODUCT,i.LOCATIONID,i.QUANTITYINSTOCK,i.LOCATION,i.SUM_UNITS_SOLD,i.AVG_UNITS_SOLD,c.ONORDERQTY,iff(c.ETADATE is null,'No_PO', c.ETADATE) as ETADATE
from invoicejoin i 
left outer join {{ ref('transformprodorders') }} c
on i.LOCATIONID=c.LOCATIONID and i.PRODUCTID=c.PRODID
