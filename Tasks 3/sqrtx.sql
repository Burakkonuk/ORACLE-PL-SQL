REM   Script: sqrtx
REM   sqrtx

CREATE OR REPLACE FUNCTION mySqrt(numberx IN OUT NUMBER) 
RETURN NUMBER IS returnx NUMBER; 
 
temp NUMBER; 
BEGIN 
IF numberx<0 THEN 
    return -1; 
END IF; 
temp := FLOOR(SQRT(numberx)); 
 
 
return temp; 
END; 
/

DECLARE 
numx INTEGER; 
 
BEGIN 
numx:= 81; 
 
DBMS_OUTPUT.PUT_LINE(mySqrt(numx)); 
 
END; 
 
 

/

