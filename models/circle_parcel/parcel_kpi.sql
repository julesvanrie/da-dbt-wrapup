select
    transporter,
    `month`,
    sum(qty) as nb_items,
    count(parcel_id) as nb_parcels,
    sum(delayed) as nb_delayed,
    avg(delayed) as pct_delayed
from
    {{ ref("int_parcel") }}
join
    {{ ref("int_parcel_product_agg") }}
using
    (parcel_id)
group by
    transporter,
    month
order by
    transporter,
    month
