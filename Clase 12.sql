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


