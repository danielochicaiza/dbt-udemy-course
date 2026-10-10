{% test t_and_f_values(model, column_name) %}
    SELECT *
    FROM {{ model }}
    WHERE {{ column_name }} NOT IN ('t', 'f')
{% endtest %}