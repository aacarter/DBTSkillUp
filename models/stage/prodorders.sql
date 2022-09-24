with convertprods as (
    select LOCATIONID,
    TO_VARCHAR(PRODID) as PRODID,
    ETAMONTH,
    TO_VARCHAR(ETADAY) as ETADAY,
    TO_VARCHAR(ETAYEAR) as ETAYEAR,
    ONORDERQTY
    from {{ source('analytics', 'prodorders') }}
)
select * from convertprods