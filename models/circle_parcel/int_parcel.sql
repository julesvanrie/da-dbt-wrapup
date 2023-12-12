select
    parcel_id,
    parcel_tracking,
    transporter,
    priority,
    date_purchase,
    date_shipping,
    date_delivery,
    date_cancelled,
    extract(month from date_purchase) as month,
    if(date_diff(date_delivery, date_purchase, day) > 5, 1, 0) as delayed

from {{ ref("stg_raw__parcel") }} 