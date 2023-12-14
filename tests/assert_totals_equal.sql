select *
from (
with src as (
    select 0 as id, sum(quantity) as src_sum
    from {{ ref("stg_raw__parcel_product") }}
),
agg as (
    select 0 as id, sum(nb_items) as agg_sum
    from {{ ref("parcel_kpi")}}
)
select *
from src
join agg
using (id)
where src_sum != agg_sum
)