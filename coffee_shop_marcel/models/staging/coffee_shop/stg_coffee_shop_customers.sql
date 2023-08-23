with source as (
  select * from {{ source('coffee_shop','customers') }}
),

renamed as (
  select *
  from source
)

select *
from renamed