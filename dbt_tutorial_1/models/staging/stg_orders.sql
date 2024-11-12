select
    id,
    customer_id,
    order_date,
    status_id
from {{ source('freepdb1_orausers', 'orders') }}
