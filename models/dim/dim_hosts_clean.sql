{{
    config(
      materialized = 'view',
    )
}}
WITH src_hosts AS (
 SELECT
 *
 FROM
 {{ ref('src_hosts') }}
)
SELECT
 host_id,
 NVL(
 host_name,
 'Anonymous'
 ) AS host_name,
 is_superhost,
 created_at,
 updated_at
FROM
 src_hosts

limit 100


-- dim_hosts_clean
-- dim_listings_clean
