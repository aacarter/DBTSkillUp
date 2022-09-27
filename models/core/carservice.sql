with service as (
    select CUSTOMERID,FIRSTNAME,LASTNAME,EMAIL, max(DATEOFSERVICE) as MAXDATEOFSERVICE,max(MILEAGEATSERVICE) as MAXMILEAGEATSERVICE,
    sum(COSTOFSERVICE) as SUMCOSTOFSERVICE
    from 
{{ source('analytics','carservice' )}}
group by CUSTOMERID,FIRSTNAME,LASTNAME,EMAIL
),

firstval as (
    select CUSTOMERID, COSTOFSERVICE,
    row_number() over (partition by CUSTOMERID,FIRSTNAME,LASTNAME,EMAIL order by CUSTOMERID desc) as row_number
        from 
{{ source('analytics','carservice' )}}
qualify row_number = 1
),

final as (
    select a.CUSTOMERID,a.FIRSTNAME,a.LASTNAME,a.EMAIL,a.MAXDATEOFSERVICE,a.MAXMILEAGEATSERVICE,a.SUMCOSTOFSERVICE,b.COSTOFSERVICE
    from service a 
    inner join firstval b on a.CUSTOMERID = b.CUSTOMERID
)

select * from final
