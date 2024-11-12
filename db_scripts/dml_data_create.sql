DECLARE
    cid number := 0;
BEGIN
    FOR l in 1 .. 1000 LOOP
        cid := seq_customer_id.nextval;
        INSERT INTO CUSTOMERS (
            ID,
            FIRST_NAME,
            LAST_NAME
        )
        VALUES
        (
            cid,
            'Firstname_'||cid,
            'Lastname_'||cid
        );
    END LOOP;
END;

BEGIN
    FOR l in 1 .. 1000 LOOP
        INSERT INTO ORDERS(
            ID,
            CUSTOMER_ID,
            ORDER_DATE,
            STATUS_ID
        )
        VALUES
        (
            seq_order_id.nextval,
            floor(dbms_random.value(1,1001)),
            sysdate - floor(dbms_random.value(1,366)),
            floor(dbms_random.value(1,5))
        );
    END LOOP;
END;

INSERT INTO ORDER_STATUSES(ID, NAME) VALUES (seq_order_status_id.nextval,'placed');
INSERT INTO ORDER_STATUSES(ID, NAME) VALUES (seq_order_status_id.nextval,'waiting');
INSERT INTO ORDER_STATUSES(ID, NAME) VALUES (seq_order_status_id.nextval,'cancelled');
INSERT INTO ORDER_STATUSES(ID, NAME) VALUES (seq_order_status_id.nextval,'fulfilled');
