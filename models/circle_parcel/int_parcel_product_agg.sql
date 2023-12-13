select
    parcel_id,
    count(model_name) as count_models,
    sum(quantity) as qty
from
    {{ ref("stg_raw__parcel_product") }}
group by
    parcel_id