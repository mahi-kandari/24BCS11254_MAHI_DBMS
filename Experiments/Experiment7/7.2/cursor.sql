<!-- Write a PL/SQL cursor loop to process the Orders table row-by-row and print "High Value" for every order where the Amount exceeds 10,000.  -->


CREATE TABLE ORDERS (
    ORDER_ID NUMBER PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(100),
    AMOUNT NUMBER(10, 2)
);

INSERT INTO ORDERS VALUES (501, 'John', 12500.00);
INSERT INTO ORDERS VALUES (502, 'Sara', 4500.00);
INSERT INTO ORDERS VALUES (503, 'Mike', 15000.00);
INSERT INTO ORDERS VALUES (504, 'Emma', 8900.00);
INSERT INTO ORDERS VALUES (505, 'David', 22000.00);
COMMIT;

DECLARE
    CURSOR c_orders IS
        SELECT ORDER_ID, CUSTOMER_NAME, AMOUNT
        FROM ORDERS;

    v_order_id ORDERS.ORDER_ID%TYPE;
    v_cust_name ORDERS.CUSTOMER_NAME%TYPE;
    v_amount ORDERS.AMOUNT%TYPE;

BEGIN
    OPEN c_orders;

    LOOP
        FETCH c_orders INTO v_order_id, v_cust_name, v_amount;
        EXIT WHEN c_orders%NOTFOUND;
        IF v_amount > 10000 THEN
            DBMS_OUTPUT.PUT_LINE('Order ' || v_order_id || ' (' || v_cust_name || '): High Value');
        END IF;
    END LOOP;

    CLOSE c_orders;
END;
/