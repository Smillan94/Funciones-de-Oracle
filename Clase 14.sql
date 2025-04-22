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


--CURSORES
--bloque para consultas de acción
--insetar un departamento de un bloque pl/sql

DECLARE
v_id int;
v_nombre dept.dnombre%TYPE;
v_loc dept.loc%TYPE;

BEGIN
--vamos a realizar un bucle para insertar 5 departamentos
v_id:=1;
for i in 1..5 loop
v_nombre:= 'Departamento '|| i;
v_loc:= 'Localidad '|| i;
insert into dept values (i, v_nombre, v_loc);

END LOOP;
dbms_output.put_line('Fin del programa');

END;

select * from dept;

DECLARE
v_id int;
v_nombre dept.dnombre%TYPE;
v_loc dept.loc%TYPE;

BEGIN
--vamos a realizar un bucle para insertar 5 departamentos
v_id:=1;
for i in 1..5 loop
v_nombre:= 'Departamento '|| i;
v_loc:= 'Localidad '|| i;
insert into dept values
((select max(dept_no)+1 from dept), v_nombre, v_loc);

END LOOP;
dbms_output.put_line('Fin del programa');

END;
