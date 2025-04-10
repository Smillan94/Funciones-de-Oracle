--Fundamentos de PL-SQL+

--DECLARE
--BEGIN
--END
--se ejecutan a la vez:

DECLARE
--mi comentario
--declaramos una variable
        numero int;
        texto varchar2(50);
BEGIN
    texto:='Mi primer PL/SQL';
    dbms_output.put_line('Mensaje:'||texto);
    dbms_output.put_line('Mi primer bloque anónimo');
    numero :=44;
    dbms_output.put_line('Valor del número:'||numero);
    numero :=22;
    dbms_output.put_line('Nuevo valor del número:'||numero);
end; 

DECLARE
       nombre varchar2(30);

BEGIN
      nombre:= '&dato';
      dbms_output.put_line('Su nombre es:'||nombre);

END;

Declare 
       fecha date;
       texto varchar2(50);
       Longitud int;
BEGIN
     fecha:= SYSDATE;
     texto:= '&data';
--Almacenamos la longitud del texto
     longitud:=LENGTH(texto);
--La longitud de su texto es 41
     dbms_output.put_line('La longitud del texto es: '||longitud);
--Hoy es...Miercoles
     dbms_output.put_line('Hoy es '||to_char(fecha, 'day','nls_date_language=SPANISH'));
     dbms_output.put_line(texto);

ENd; 


DECLARE
   
    numero1 int;
    numero2 int;
    suma int;
BEGIN

    numero1 := '&num1';  
    numero2 := '&num2'; 
    suma:= numero1 + numero2;
    dbms_output.put_line('La suma de '|| numero1 || '+' || numero2 || '='|| suma);
END;
undefine num1;
undefine num2;


DECLARE

--declaramos una variable para almacenar el numero de departamento
v_departamento int;

BEGIN
--pedimos un numero al usuario
     v_departamento:='&departamento';
     update EMP set salario = salario +1 where dept_no = v_departamento;

END;

undefine departamento;
select * from EMP;






