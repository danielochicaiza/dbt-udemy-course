SELECT
    l.listing_id AS listing_id,
    f.review_date AS review_date,
    l.created_at AS created_at
FROM {{ ref('fct_reviews') }} f
LEFT JOIN {{ ref('dim_listings_cleansed') }} l
    ON f.listing_id = l.listing_id
WHERE review_date < created_at