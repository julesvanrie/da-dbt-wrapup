select
    transporter,
    month,
    count(parcel_id) as nb_parcels,
    sum(delayed) as nb_delayed,
    avg(delayed) as pct_delayed

from {{ ref("int_parcel") }}

group by
    transporter,
    month

order by 
    transporter,
    month
