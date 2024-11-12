select
    id,
    first_name,
    last_name
from {{ source('freepdb1_orausers', 'customers') }}
