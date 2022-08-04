REM   Script: reverseVowels
REM   reverseVowels

CREATE OR REPLACE TYPE array_type IS TABLE OF CHAR; 
/

CREATE OR REPLACE FUNCTION reverseVowels(str IN OUT STRING) 
RETURN STRING IS returnx STRING(100); 
myarray array_type; 
vowelArray array_type; -- all vowels in alphabet 
vowelsInStr array_type; --vowels in string 
indexArray array_type; --indexes of vowels 
strArray array_type;   -- array of str 
revArray array_type;   -- reversed vowels 
counter1 NUMBER; 
counter2 NUMBER; 
arraytemp NUMBER; 
BEGIN 
 
counter1 := 1; 
vowelsInStr := array_type(); 
indexArray := array_type(); 
indexArray.extend(LENGTH(str)); 
strArray := array_type(); 
revArray := array_type(); 
 
vowelArray := array_type('a','e','i','o','u','A','E','I','O','U'); 
for i in 1..LENGTH(str) LOOP 
    for j in 1..vowelArray.COUNT LOOP 
        IF (SUBSTR(str,i,1) = vowelArray(j)) THEN 
            vowelsInStr.extend; 
            revArray.extend; 
            vowelsInStr(counter1) := vowelArray(j); -- SESLİ HARFLER 
            indexArray(counter1):= INSTR(str,vowelArray(j),i,1); -- INDEXLER 
            counter1 := counter1 + 1; 
        END IF; 
    END LOOP; 
 
END LOOP; 
 
for i in 1..indexArray.COUNT LOOP 
    --DBMS_OUTPUT.PUT_LINE(vowelsInStr(i)); 
    --DBMS_OUTPUT.PUT_LINE(indexArray(i)); 
    strArray.extend; 
    strArray(i):= SUBSTR(str,i,1); 
 
END LOOP; 
 
counter2:= vowelsInStr.COUNT; 
FOR i in 1..vowelsInStr.COUNT LOOP  --reversing vowels 
    revArray(counter2):= vowelsInStr(i); 
    counter2 := counter2 - 1; 
END LOOP; 
 
arraytemp := strArray.COUNT; 
counter1 := 1; 
for i in 1..arraytemp LOOP 
    for j in 1..vowelArray.COUNT LOOP 
        IF (strArray(i) = vowelArray(j)) THEN  --If there is a vowel in the original string replace it with the reversed array vowels. 
        revarray.extend; 
        strarray(i) := revarray(counter1); 
        counter1 := counter1 +1; 
        EXIT; 
        
         
        END IF; 
    END LOOP; 
 
END LOOP; 
 
for i in 1..strArray.COUNT LOOP 
 
    DBMS_OUTPUT.PUT(strArray(i));   -- Printing last string 
 
END LOOP; 
 
 
return ' '; 
END; 
 
/

DECLARE 
str STRING(100); 
 
BEGIN 
str:= 'leetcode'; 
DBMS_OUTPUT.PUT_LINE(reverseVowels(str)); 
 
END;
/

