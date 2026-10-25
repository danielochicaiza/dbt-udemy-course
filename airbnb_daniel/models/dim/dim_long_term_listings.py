def model(dbt, session):
    dbt.config(tags=['python'])
    listings = dbt.ref("dim_listings_cleansed")

    return (listings.filter(listings["MINIMUM_NIGHTS"] >= 30)
                   .select("LISTING_ID", "LISTING_NAME", "PRICE"))
