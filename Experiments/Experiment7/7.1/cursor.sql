<!-- Implement a PL/SQL block with a cursor to fetch and display the Name and Salary of the top 5 highest-paid employees from the Staff table. -  -->

CREATE TABLE STAFF (
    EMP_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    SALARY NUMBER(10, 2) NOT NULL
);

INSERT INTO STAFF VALUES (1, 'Mahi', 120000);
INSERT INTO STAFF VALUES (2, 'Chhavi', 110000);
INSERT INTO STAFF VALUES (3, 'Ankita', 95000);
INSERT INTO STAFF VALUES (4, 'Ayush', 90000);
INSERT INTO STAFF VALUES (5, 'Mudit', 82000);
INSERT INTO STAFF VALUES (6, 'Rishabh', 75000);
INSERT INTO STAFF VALUES (7, 'Vishal', 65000);
COMMIT;

DECLARE
    CURSOR c_top_staff IS
        SELECT NAME, SALARY
        FROM STAFF
        ORDER BY SALARY DESC
        FETCH FIRST 5 ROWS ONLY;

    v_name   STAFF.NAME%TYPE;
    v_salary STAFF.SALARY%TYPE;

BEGIN
    OPEN c_top_staff;
    
    DBMS_OUTPUT.PUT_LINE('Top 5 Highest-Paid Employees:');

    LOOP
        FETCH c_top_staff INTO v_name, v_salary;
        EXIT WHEN c_top_staff%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ' | Salary: ' || v_salary);
    END LOOP;

    CLOSE c_top_staff;
END;
/