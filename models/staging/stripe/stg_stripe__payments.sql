with 

source as (

    select * from {{ source('stripe', 'payments') }}

),

transformed as (

  select

    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    created as payment_created_at,
    status as payment_status,
    {{ cent_to_dollars('amount') }} as payment_amount

  from source

)

select * from transformed
