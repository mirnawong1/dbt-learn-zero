select *
from
    {{ ref('dim_listings_clean') }}
where minimum_nights < 1
limit 10
