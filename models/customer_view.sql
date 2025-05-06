{{
    config
    (
        materialized='view'
    )
}}

SELECT * FROM {{ ref('customer') }} 
where COUNTRY = 'USA'