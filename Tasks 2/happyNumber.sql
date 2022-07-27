REM   Script: HappyNumber
REM   HappyNumber

CREATE OR REPLACE FUNCTION happyNumber(happy IN OUT INTEGER) 
RETURN STRING IS isHappy STRING(100); 
digit NUMBER; 
decim NUMBER; 
hundred NUMBER; 
counter NUMBER; 
BEGIN 
counter:=1; 
while(happy != 1) LOOP 
counter:= counter + 1; 
    digit := FLOOR(MOD(happy,10)); 
    decim := FLOOR(happy/10); 
    IF decim >= 10 THEN 
        decim := FLOOR(MOD(decim,10)); 
    END IF; 
    hundred := FLOOR(happy/100); 
    IF hundred >10 THEN 
        hundred := FLOOR(MOD(hundred,10)); 
    END IF; 
    happy := digit*digit + decim*decim + hundred*hundred; 
    IF happy = 1 THEN 
        RETURN 'Happy Number!'; 
    END IF; 
    IF counter =100 THEN  -- INFINITE LOOP CHECK 
        RETURN 'Not Happy Number!'; 
    END IF; 
END LOOP; 
 
END;
/

DECLARE  
 
numx NUMBER; 
BEGIN  
numx:=94; 
DBMS_OUTPUT.PUT_LINE(happyNumber(numx));  
 
END;
/

