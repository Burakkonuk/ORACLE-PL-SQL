CREATE OR REPLACE FUNCTION SOLVE(inputArray   IN OUT array_type) 
RETURN array_type AS l_data array_type := array_type(); 

start1 NUMBER;
end1 NUMBER;
tempS STRING(100);
x NUMBER;           
tempS1 STRING(100);
arr array_type;
temp array_type;
BEGIN
temp := array_type();
for i in 1..inputArray.COUNT LOOP
   IF inputArray(i) = '{' THEN
        start1 := i;
   
   
   ELSIF inputArray(i) = '}' THEN
        end1 := i;
        
        temp.extend(25);
        x := 1;
            for j in start1+1..i LOOP
                temp(x):=inputArray(j);
                x := x+1;
                inputArray(j) := '';
                inputArray(i) := '';
            END LOOP;
            
            temp:= REVERSEFUNC(temp); 
            for i1 in 1..temp.COUNT LOOP
                tempS := tempS || temp(i1);
            END LOOP;
            
            inputArray(start1):= tempS;
            
            return solve(inputArray);
   END IF; 
   
   IF inputArray(i) = '[' THEN
        start1 := i;
   
   
   ELSIF inputArray(i) = ']' THEN
        tempS1 := '';
            for j in start1+1..i LOOP
                tempS1:= tempS1 || inputArray(j);
                inputArray(j) := '';
                inputArray(i) := '';
            END LOOP;
            
            
            inputArray(start1):= tempS1;
            
            return solve(inputArray);
   END IF; 

END LOOP;

return inputArray;
END; 
 
/



CREATE OR REPLACE FUNCTION REVERSEFUNC(inputArray   IN OUT  array_type) 
RETURN array_type AS l_data array_type := array_type(); 
arr array_type;
len NUMBER;
BEGIN
arr := array_type();
arr.extend(inputArray.COUNT);
len := inputArray.COUNT;

IF len = 0 THEN
    RETURN null;
END IF;
for i in 1..inputArray.COUNT LOOP
    arr(i):= inputArray(len);
    len := len -1;
END LOOP;

return arr;


END;



CREATE OR REPLACE TYPE array_type IS TABLE OF VARCHAR2(100); 
/
create or replace TYPE stringlist IS TABLE OF VARCHAR2(4000);
/
create or replace TYPE stringlist2 IS TABLE OF VARCHAR2(4000);
/

DECLARE
word String(100);
arr array_type;
finalarr array_type;
BEGIN
arr := array_type();
finalarr := array_type();
word := '{a[bc]d{ef{gh}}}';
arr.extend(LENGTH(word)); 
for i in 1..LENGTH(word) LOOP
    arr(i) := SUBSTR(word,i,1); 

END LOOP;

for i in 1..arr.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(arr(i)); 

END LOOP;
finalarr := SOLVE(arr);
DBMS_OUTPUT.PUT_LINE(finalarr(1));

END;




