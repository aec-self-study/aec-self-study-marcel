{% test is_greater_than_zero(model, column_name) %}
    SELECT * 

    FROM {{model}} 
    WHERE NOT {{column_name}} >= 0
 {% endtest %}