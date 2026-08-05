-- if and else 

DO 
$$
    DELCARE 
    AGE INT := 19;
    BEGIN
		    IF AGE >=18 THEN
            RAISE NOTICE 'YOUR AGE ID % AND YOU ARE ELIGIBLE TO VOTE',AGE;
        ELSE 
            RAISE NOTICE 'YOUR AGE IS % AND YOU ARE NOT ELIGIBLE TO VOTE' , AGE;
        END IF;
    END;
$$

---- if elsif else ladder
DO 
$$
    DECLARE
    VAL INT := 20;
    BEGIN
    IF VAL>=1 AND VAL<=10 THEN 
    RAISE NOTICE 'VALUE = % AND RANGE = 1 - 10',VAL;
    ELSIF VAL>10 AND VAL<=20 THEN 
    RAISE NOTICE 'VALUE = % AND RANGE = 10 - 20',VAL;
    ELSE 
    RAISE NOTICE 'VALUE = % AND GREATER THAN 20',VAL;
    END IF;
    END;
$$