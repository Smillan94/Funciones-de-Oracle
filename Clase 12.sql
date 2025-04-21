--Estructura de control
--Ejemplo

--debemos comprobar si un numero es positivo o negativo

DECLARE

v_numero int;

BEGIN
    --pedimos el numero al usuario
    v_numero:= &numero;
    --preguntamos por el propio numero
    if (v_numero >= 0) THEN
       DBMS_OUTPUT.put_line('Positivo: '|| v_numero);
    ELSE
       DBMS_OUTPUT.put_line('Negativo: '|| v_numero); 
    END if;
       DBMS_OUTPUT.put_line('Fin de Programa');

END; 

undefine numero;


---Debemos comprobar si un numero es positivo, negativo o cero

DECLARE

v_numero int;

BEGIN
    --pedimos el numero al usuario
    v_numero:= &numero;
    --preguntamos por el propio numero
    if (v_numero > 0) THEN
       DBMS_OUTPUT.put_line('Es Positivo: '|| v_numero);
    elsif
       (v_numero = 0) THEN
       DBMS_OUTPUT.put_line('Es cero: '|| v_numero); 
    else
       DBMS_OUTPUT.put_line('Es negativo '|| v_numero); 
    END if;
       DBMS_OUTPUT.put_line('Fin de Programa');

END;

--Pedir un número al usuario del 1 al 4.
--1.-Primavera
--2.-Verano
--3.-Otoño 
--4.-Invierno
--Si nos da otro número, le indicamos que esta mal


DECLARE

v_numero int;

BEGIN
    --pedimos el numero al usuario
    v_numero:= &numero;
    --preguntamos por el propio numero
    if (v_numero = 1) THEN
       DBMS_OUTPUT.put_line('Es Primavera');
    elsif
       (v_numero = 2) THEN
       DBMS_OUTPUT.put_line('Es Verano'); 
    elsif
       (v_numero = 3) THEN
       DBMS_OUTPUT.put_line('Es otoño'); 
    elsif
       (v_numero = 4) THEN
       DBMS_OUTPUT.put_line('Es Invierno'); 
    ELSE
       DBMS_OUTPUT.put_line('Esta mal');
    END iF;

END;

undefine numero;

--Ejemplo código para evaluar número mayor y número menor que
--pediremos al usuario

DECLARE

v_numero1 int;
v_numero2 int;

BEGIN

    v_numero1:= &num1;
    v_numero2:= &num2;

    if 
       (v_numero1 > v_numero2) THEN
       DBMS_OUTPUT.put_line( v_numero1 ||' Es mayor que '|| v_numero2);
    Elsif 
        (v_numero1 = v_numero2) THEN
       DBMS_OUTPUT.put_line(v_numero2 || ' Es igual que '|| v_numero1 );
    Elsif 
        (v_numero1 < v_numero2) THEN
       DBMS_OUTPUT.put_line(v_numero1 || ' Es menor que '|| v_numero2);
    END if;
       DBMS_OUTPUT.put_line('Fin de Programa');

END; 

undefine num1;
undefine num2;


--PEDIMOS UN NUMERO DE USUARIO e INDICAR SI ES PAR O ES IMPAR

DECLARE

v_numero int;

BEGIN 
   v_numero:= &numero;
   if 
     MOD(v_numero, 2)=1 THEN
     DBMS_OUTPUT.put_line('Es impar');
   else 
      DBMS_OUTPUT.put_line('Es par');
   END if;

   END;
undefine numero;


--
/
declare 
   v_letra varchar2(1);

Begin 
   v_letra:= UPPER('&letra');
     if(v_letra= 'A' or 
        v_letra = 'E' or 
        v_letra='I' or 
        v_letra='O' or 
        v_letra='U') THEN
       dbms_output.put_line('Es vocal: '|| v_letra);

    else
       dbms_output.put_line('Es consonate: '|| v_letra);

    end if;
       dbms_output.put_line('Fin del Programa');

END;
/
undefine letra;      

--Pedir tres numeros al usuario 
--debemos mostrar el mayor de ellos y el menor de ellos.

DECLARE
    v_num1 INT;
    v_num2 INT;
    v_num3 INT;
    
BEGIN
    v_num1 := &numero1;
    v_num2 := &numero2;
    v_num3 := &numero3;

    -- Encontrar el menor
    IF (v_num1 <= v_num2) AND (v_num1 <= v_num3) THEN
        dbms_output.put_line('Es el menor: ' || v_num1);
    ELSIF (v_num2 <= v_num1) AND (v_num2 <= v_num3) THEN
        dbms_output.put_line('Es el menor: ' || v_num2);
    ELSE
        dbms_output.put_line('Es el menor: ' || v_num3);
    END IF;

    -- Encontrar el mayor
    IF (v_num1 >= v_num2) AND (v_num1 >= v_num3) THEN
        dbms_output.put_line('Es el mayor: ' || v_num1);
    ELSIF (v_num2 >= v_num1) AND (v_num2 >= v_num3) THEN
        dbms_output.put_line('Es el mayor: ' || v_num2);
    ELSE
        dbms_output.put_line('Es el mayor: ' || v_num3);
    END IF;

    dbms_output.put_line('Fin del Programa');
END;


--De otra manera:
/
DECLARE
   v_num1 INT;
   v_num2 INT;
   v_num3 INT;
   v_mayor INT;
   v_menor INT;
   v_intermedio INT;
   v_suma       INT;
BEGIN
   v_num1 := &num1;
   v_num2 := &num2;
   v_num3 := &num3;

   -- Determinar el mayor
   IF (v_num1 >= v_num2 AND v_num1 >= v_num3) THEN
      v_mayor := v_num1;
   ELSIF (v_num2 >= v_num1 AND v_num2 >= v_num3) THEN
      v_mayor := v_num2;
   ELSE
      v_mayor := v_num3;
   END IF;

   -- Determinar el menor
   IF (v_num1 <= v_num2 AND v_num1 <= v_num3) THEN
      v_menor := v_num1;
   ELSIF (v_num2 <= v_num1 AND v_num2 <= v_num3) THEN
      v_menor := v_num2;
   ELSE
      v_menor := v_num3;
   END IF;

   -- Calcular intermedio
   v_suma := v_num1 + v_num2 + v_num3;
   v_intermedio := v_suma - v_mayor - v_menor;

   -- Imprimir resultados
   DBMS_OUTPUT.PUT_LINE('Mayor: ' || v_mayor);
   DBMS_OUTPUT.PUT_LINE('Menor: ' || v_menor);
   DBMS_OUTPUT.PUT_LINE('Intermedio: ' || v_intermedio);
END;
/

UNDEFINE num1;
UNDEFINE num2;
UNDEFINE num3;





