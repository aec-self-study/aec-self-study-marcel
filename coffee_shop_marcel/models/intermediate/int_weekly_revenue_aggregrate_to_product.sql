with

order_items as (

   select * from {{ ref('stg_coffee_shop__order_items') }}

), 

orders as (

   select * from {{ ref('stg_coffee_shop__orders') }}

), 

products as (

   select * from {{ ref('stg_coffee_shop__products') }}

),


product_prices as (

   select * from {{ ref('stg_coffee_shop__product_prices') }}

),


order_items_and_orders_and_products_and_product_prices as (
   select   orders.created_at,
            orders.order_id,
            products.name,
            product_price_id,
            product_prices.price
                   
   from order_items left join orders
         on order_items.order_id = orders.order_id
      left join products 
         on order_items.product_id = products.product_id
      left join product_prices 
         on order_items.product_id = product_prices.product_id 
            and orders.created_at between product_prices.created_at and product_prices.ended_at
),

order_items_and_orders_and_products_and_product_prices_at_product_week_grain as(
Select   DATE_TRUNC(created_at, WEEK) AS weekly_date,
         name,
         sum(price) as revenue
from order_items_and_orders_and_products_and_product_prices

Group by 1,2
)

select * from order_items_and_orders_and_products_and_product_prices_at_product_week_grain