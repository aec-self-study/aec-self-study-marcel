select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        customer_id as value_field,
        count(*) as n_records

    from `aec-students`.`dbt_marcel`.`customers`
    group by customer_id

)

select *
from all_values
where value_field not in (
    '1','2','3'
)



      
    ) dbt_internal_test