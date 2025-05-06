{{ config(materialized = "table") }}

with employee_raw as (
    select
        EMPID                              as employee_id,
        split_part(NAME, ' ', 1)           as employee_firstname,
        split_part(NAME, ' ', 2)           as employee_lastname,
        SALARY                             as emp_salary,
        HIREDATE                           as emp_hiredate,
        split_part(ADDRESS, ',', 1)        as emp_street,
        split_part(ADDRESS, ',', 2)        as emp_city,
        split_part(ADDRESS, ',', 3)        as emp_country,
        split_part(ADDRESS, ',', 4)        as emp_zip
    from {{ source('employee', 'EMPLOYEE_RAW') }}
)

select * from employee_raw;
