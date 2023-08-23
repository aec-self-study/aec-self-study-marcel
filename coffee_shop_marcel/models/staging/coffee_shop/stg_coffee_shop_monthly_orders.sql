select
	
	count(*) as new_customers
from {{ref('stg_coffee_shop_customers') }}
