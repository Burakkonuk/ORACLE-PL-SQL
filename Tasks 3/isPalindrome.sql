REM   Script: isPalindrome
REM   isPalindrome

CREATE OR REPLACE FUNCTION isPalindrome(numberx IN OUT NUMBER) 
RETURN STRING IS returnx STRING(10); 
 
numbery NUMBER; 
counterx NUMBER; 
temp NUMBER; 
BEGIN 
temp := numberx; 
numbery:=0; 
IF(SUBSTR(numberx,1,1) = '-') THEN --NEGATIVE NUMBERS CAN NOT BE PALINDROME 
return 'false'; 
END IF; 
 
 
WHILE(numberx !=0) LOOP 
    numbery :=(numbery*10)+mod(numberx,10); --https://www.programiz.com/java-programming/examples/reverse-number 
    numberx := numberx / 10;                --we can solve this part by assigning the first half of number to a array and other half to another array reversely if it has even number of elements.Then compare 2 arrays. If It has odd number of elements (length/2)-+1 would solve the problem  
    numberx := FLOOR(numberx); 
 
 
END LOOP; 
 
IF (temp = numbery) THEN 
    return 'True'; 
ELSE  
    return 'False'; 
END IF; 
DBMS_OUTPUT.PUT_LINE(numbery); 
return 'x'; 
END; 
/

DECLARE 
numx INTEGER; 
 
BEGIN 
numx:= '1234567890987654321'; 
 
DBMS_OUTPUT.PUT_LINE(isPalindrome(numx)); 
 
 
EXCEPTION 
    WHEN VALUE_ERROR THEN
    dbms_output.put_line('Please enter an integer'); 
END; 
 
 

/

