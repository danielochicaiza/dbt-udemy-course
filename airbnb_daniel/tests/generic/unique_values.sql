{% test unique_values(model, column_name) %}
    SELECT
        {{ column_name }} AS duplicate_value,
        count(*) AS occurrences
    FROM {{ model }}
    WHERE {{ column_name }} IS NOT NULL
    GROUP BY {{ column_name }}
    HAVING COUNT(*) > 1
{% endtest %}