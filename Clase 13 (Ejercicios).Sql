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
    END LOOP;

    dbms_output.put_line(1); -- Imprimir el 1 final
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