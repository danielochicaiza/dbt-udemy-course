import textblob

def model(dbt, session):
    dbt.config(
        materialized = "table",
        packages = ["textblob", "snowflake-connector-python[pandas]"],
        tags = ['python']
    )

    reviews_df = dbt.ref("fct_reviews")

    df = reviews_df.to_pandas()

    # Calculate sentiment score for each review from -1 (negative) to 1 (positive)
    df["SENTIMENT_SCORE"] = df["SENTIMENT_SCORE"] = df["REVIEW_TEXT"].apply(
        lambda x: textblob.TextBlob(x).sentiment.polarity if isinstance(x, str) else None
    )

    # Round sentiment scores to 2 decimal places
    df["SENTIMENT_SCORE"] = df["SENTIMENT_SCORE"].round(2)

    # return final dataset (Pandas DataFrame)
    return df