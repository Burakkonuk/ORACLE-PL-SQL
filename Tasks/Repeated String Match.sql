REM   Script: Repeated String Match
REM   Repeated String Match

create or replace function repeatedStringMatch(stringA IN OUT STRING, stringB IN OUT STRING) 
RETURN number is stepSize number; 
resultx NUMBER; 
tempString STRING(10000); 
BEGIN 
resultx :=1; 
tempString := stringA; 
 
--FIRST CONTROLS 
IF (INSTR(stringA,stringB) >0) THEN 
    resultx := 0; 
    return resultx ; 
ELSIF (LENGTH(stringA)>LENGTH(stringB) AND INSTR(stringA||stringA,stringB) <=0 ) THEN 
    resultx := -1; 
    return resultx; 
END IF; 
-- 
WHILE (LENGTH(stringA) <= LENGTH(stringB) ) LOOP 
    stringA := stringA || tempString; 
    resultx := resultx + 1; 
    IF(INSTR(stringA,stringB)>0) THEN 
        return resultx; 
    END IF; 
END LOOP; 
 
    resultx := -1; 
 
RETURN resultx; 
END; 
/

DECLARE 
firstString STRING(10000); 
secondString STRING(10000); 
BEGIN 
firstString := 'abcd'; 
secondString := 'cdabcdab'; 
DBMS_OUTPUT.PUT_LINE(repeatedStringMatch(firstString,secondString)); 
 
END; 

/

