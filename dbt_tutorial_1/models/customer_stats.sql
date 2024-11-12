{{
  config(
    materialized='view'
  )
}}

with w_customers as (
    select * from {{ ref('stg_customers') }}
),

w_orders as (
    select * from {{ ref('stg_orders') }}
),

w_customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(id) as number_of_orders
    from w_orders
    group by customer_id
),

final as (
    select
        w_customers.id as customer_id,
        w_customers.first_name,
        w_customers.last_name,
        w_customer_orders.first_order_date,
        w_customer_orders.most_recent_order_date,
        coalesce(w_customer_orders.number_of_orders, 0) as number_of_orders
    from w_customers
    left join w_customer_orders on w_customers.id = w_customer_orders.customer_id
)

select * from final
