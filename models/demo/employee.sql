{{
    config(materialized='table')
}}
with employee as
    (
        select 
            EMPID,
            split_part(NAME,' ', 1) as first_name,
            split_part(NAME,' ',2) as last_name,
            SALARY,
            HIREDATE DATE,
            split_part(ADDRESS,',',1) as street_name,
            split_part(ADDRESS,',',2) as City,
            split_part(ADDRESS,',',3) as country,
            split_part(ADDRESS,',',4) as country_code
from {{source('employee','EMPLOYEE_RAW')}}
--demodb.demoschema.employee_raw
    )
    select * from employee