--------------------------------------------------------
--  File created - Wednesday-April-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function FUNCTION_1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "EJERCICIOS"."FUNCTION_1" (a IN NUMBER, b IN NUMBER, c IN NUMBER)
RETURN VARCHAR2 IS
    texto VARCHAR2(255);
BEGIN
    IF b >= c THEN
        texto := a || '/' || (a * b) || '/ANDRES';
    ELSE
        texto := a || '/' || (a * b) || '/MARTINEZ';
    END IF;
    RETURN texto;
END;
--------------------------------------------------------
--  DDL for Function FUNCTION_2
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "EJERCICIOS"."FUNCTION_2" (a IN NUMBER, b IN VARCHAR2, c IN VARCHAR2)
RETURN VARCHAR2 IS
    texto VARCHAR2(255) := '';
    palindromo VARCHAR2(255) := '';
    posicion NUMBER;
    vocales NUMBER := 0;
    caracter VARCHAR2(255);
    numberchar VARCHAR2(255);
BEGIN
    /*palindromo*/
    numberchar := a || '';
    posicion := LENGTH(numberchar);
    WHILE posicion <> 0 LOOP
        palindromo := palindromo || SUBSTR(numberchar, posicion, 1);        
        posicion := posicion - 1;
    END LOOP;
    IF numberchar = palindromo THEN
         texto := texto || 'true/';
    ELSE
        texto := texto || 'false/';
    END IF;
    /*palindromo*/
    posicion := 1;
    WHILE posicion <= LENGTH(b) LOOP
        IF MOD(posicion, 2) = 0 THEN
            texto := texto || UPPER(SUBSTR(b, posicion, 1));
        ELSE
            texto := texto || LOWER(SUBSTR(b, posicion, 1));
        END IF;
        posicion := posicion + 1;
    END LOOP;
    texto := texto || '/';
    /*vocales*/
    posicion := 1;
    WHILE posicion <= LENGTH(c) LOOP
        caracter := LOWER(SUBSTR(c, posicion, 1));
        IF caracter = 'a' OR caracter = 'e' OR caracter = 'i' OR caracter = 'o' OR caracter = 'u' THEN
            vocales := vocales + 1;
        END IF;
        posicion := posicion + 1;
    END LOOP;
    texto := texto || vocales || '/' || LENGTH(numberchar || b || c);
    RETURN texto;
END;
