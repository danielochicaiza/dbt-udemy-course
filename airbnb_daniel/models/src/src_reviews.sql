WITH raw_reviews AS (
    SELECT * FROM {{ source('airbnb', 'reviews') }}
)

SELECT
    date AS review_date,
    listing_id,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews
