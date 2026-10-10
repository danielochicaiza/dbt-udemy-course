SELECT *
FROM {{ ref('fct_reviews') }}
WHERE review_date > current_timestamp
LIMIT 1