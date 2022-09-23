with convertprods as (
    select LOCATIONID,
    TO_VARCHAR(PRODID),
    ETAMONTH,
    TO_VARCHAR(ETADAY),
    TO_VARCHAR(ETAYEAR),
    ONORDERQTY
    from {{ source('analytics', 'prodorders') }}
)
select * from convertprods