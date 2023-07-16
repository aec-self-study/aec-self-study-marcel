select
	date_trunc(first_order_at,month) as date_month,
	count(*) as new_customers
from {{ref('customer') }}
group by 1