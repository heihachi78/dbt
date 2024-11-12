create table customers (
    id number,
    first_name varchar2(1000),
    last_name varchar2(1000)   
);

create table orders (
    id number,
    customer_id number,
    order_date date,
    status_id number    
);

create table order_statuses (
    id number,
    name varchar2(100)
);

create sequence seq_customer_id START WITH 1 INCREMENT BY 1;
create sequence seq_order_id START WITH 1 INCREMENT BY 1;
create sequence seq_order_status_id START WITH 1 INCREMENT BY 1;
