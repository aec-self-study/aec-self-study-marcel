select
  date_trunc(created_at, month) as date_month,
  {% for state in ['Ohio', 'Iowa', 'Utah'] %}
  sum(case when  state = '{{state}}' then 1 end) as {{state}}_amount,
  {% endfor %}
    sum(1) as count 
-- you may have to `ref` a different model here, depending on what you've built previously
from {{ ref('stg_coffee_shop__orders') }} 
where state in ( 'Ohio', 'Iowa', 'Utah')
group by 1