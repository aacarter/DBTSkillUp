with convert as (
    select LOCATIONID,
    LOCATION,
    DATESOLD,
    TO_VARCHAR(PRODUCTID) as PRODUCTID,
    UNITSSOLD
    from {{ source('analytics', 'invoice') }}
)
select * from convert