with convert as (
    select LOCATIONID,
    TRIM(LOCATION,'" ') as LOCATION,
    DATESOLD,
    TO_VARCHAR(PRODUCTID) as PRODUCTID,
    UNITSSOLD
    from {{ source('analytics', 'invoice') }}
)
select * from convert