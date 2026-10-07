/*Implement a Row-Level BEFORE UPDATE Trigger on the Salary_Hike table that restricts a salary 
increase to no more than 15% of the :OLD.salary value; if the increase exceeds this limit, 
the trigger must raise a custom User-Defined Exception  with a specific message
*/


CREATE OR REPLACE FUNCTION check_salary_hike()
RETURNS TRIGGER
AS $$
BEGIN
    IF (NEW.salary - OLD.salary) > (OLD.salary * 0.15) THEN
        RAISE EXCEPTION 'Salary increase exceeds the maximum allowed limit of 15%%';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_salary_hike
BEFORE UPDATE ON Salary_Hike
FOR EACH ROW
EXECUTE FUNCTION check_salary_hike();

UPDATE Salary_Hike 
SET salary = 55000 
WHERE emp_id = 3;

UPDATE Salary_Hike 
SET salary = 50000 
WHERE emp_id = 2;