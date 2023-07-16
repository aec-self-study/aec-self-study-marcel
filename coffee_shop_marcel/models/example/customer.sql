{{  config(
    materialized='table'
)

}}


select
  orders.customer_id,
  customers.name,
  customers.email,
  min(orders.created_at) as first_order_at,
  count(distinct orders.id) as number_of_orders
from analytics-engineers-club.coffee_shop.customers as customers 
left join  analytics-engineers-club.coffee_shop.orders  as orders on customers.id = orders.customer_id
Group by
  orders.customer_id,
  customers.name,
  customers.email
order by first_order_at