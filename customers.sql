select
  o.customer_id
  ,c.name
  ,c.email
  ,min(o.created_at) as first_order_at
  ,count(distinct o.id) as number_of_orders
from analytics-engineers-club.coffee_shop.customers as c left join  analytics-engineers-club.coffee_shop.orders   as o on c.id = o.customer_id
Group by
  o.customer_id
  ,c.name
  ,c.email
order by first_order_at