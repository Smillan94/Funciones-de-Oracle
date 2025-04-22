--ejemplos
--Bucle para mostrar los numeros entre 1 y 10
--Bucle while y bucle for

DECLARE
i int;

BEGIN
    i:=1;
while i <=10
LOOP
    dbms_output.put_line(i);
    i:= i + 1; 
    end loop;
dbms_output.put_line('Fin del bucle While ');

END;

--AHORA CON FOR

DECLARE
i int;

BEGIN
    FOR i in 1..10
LOOP
    dbms_output.put_line(i);
    end loop;
dbms_output.put_line('Fin del bucle FOR ');

END;

--Pedir al usuario un numero inicio 
--y un numero final
--mostrar los numeros comprendidos entre dicho rango

DECLARE
inicio int;
fin int;

BEGIN
    inicio:= &inicial;
    fin:=&final;
    FOR i in inicio..fin
LOOP
    dbms_output.put_line(i);
    end loop;
dbms_output.put_line('Fin del programa ');
END;
undefine inicial;
undefine final;


--Queremos un bucle pidiendo un inicio y un fin
--mostrar los numeros pares comprendidos en dicho inicio y fin

DECLARE
inicio int;
fin int;

BEGIN
    inicio:= &inicial;
    fin:=&final;
    FOR i in inicio..fin  LOOP
    if (mod(i,2)=0) THEN
    dbms_output.put_line(i);
    end if;
    end loop;
dbms_output.put_line('Fin del programa ');
END;
undefine inicial;
undefine final;

--Conjetura de collatz
--la teoria indica que cualquier numero siempre llegara a ser 1 
--siguiendo una serie de instrucciones:
--si el numero es par, se divide entre 2
--si el numero es impar, se multiplica por 3 y sumamos 1
--6,3,10,5,16,8,4,2,1


DECLARE
    numero INT;
BEGIN
    numero := &num1;

    WHILE numero != 1 LOOP
        dbms_output.put_line(numero);

        IF MOD(numero, 2) = 0 THEN
            numero := numero / 2;
        ELSE
            numero := numero * 3 + 1;
        END IF;
        dbms_output.put_line(numero);
    END LOOP;
    dbms_output.put_line('Fin del programa');
END;


DECLARE
    numero INT;
BEGIN
    numero := &num1;

    FOR i IN 1..1000 LOOP
        dbms_output.put_line(numero);

        IF numero = 1 THEN
            EXIT;
        ELSIF MOD(numero, 2) = 0 THEN
            numero := numero / 2;
        ELSE
            numero := numero * 3 + 1;
        END IF;
    END LOOP;

    dbms_output.put_line('Fin del programa');
END;
undefine num1;

--Mostrar la tabla de multiplicar de un numero que pida el usuario

DECLARE
    numero INT;
BEGIN
    numero := &numero1;

    FOR i IN 1..10 LOOP
        dbms_output.put_line(numero ||'*'|| i ||'='|| numero*i);
        
    END LOOP;
    dbms_output.put_line('Fin del programa');
END;
undefine numero1;


--Ahora con cadena de texto

DECLARE
v_texto varchar2(50);
v_longitud int;
v_letra varchar2(1);

BEGIN
    v_texto:= '&v_texto';
    v_longitud:= length(v_texto);
    for i in 1..v_longitud loop
       v_letra := substr(v_texto, i, 1);
       dbms_output.put_line(v_letra);
    END LOOP;
    dbms_output.put_line('Fin del programa');
END;
undefine texto;

--Necesito un programa donde el usuario introducira un texto numerico:1234
--Nececesito mostrar la suma de todos los caracteres numericos

DECLARE

v_texto_numero varchar2(50);
v_longitud int;
v_letra char(1);
v_numero int;
v_suma int;

BEGIN
v_suma:= 0;
v_texto_numero:= '&texto';
v_longitud:= lenght(v_texto_numero);
for i in 1..v_longitud loop
  v_letra:= substr(v_texto_numero, i,1);
  v_numero:= to_number(v_letra);
  v_suma:= v_suma + v_numero;
END LOOP;
dbms_output.put_line('La suma de'|| v_texo_numero|| 'es'|| v_suma);
END;

DECLARE
  v_texto_numero VARCHAR2(50);
  v_longitud     INT;
  v_letra        CHAR(1);
  v_numero       INT;
  v_suma         INT;
BEGIN
  v_suma := 0;
  v_texto_numero := '&texto';
  v_longitud := LENGTH(v_texto_numero);
  
  FOR i IN 1..v_longitud LOOP
    v_letra := SUBSTR(v_texto_numero, i, 1);
    v_numero := TO_NUMBER(v_letra);
    v_suma := v_suma + v_numero;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('La suma de ' || v_texto_numero || ' es ' || v_suma);
END;
