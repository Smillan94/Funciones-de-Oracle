--Insertar en la tabla EMP un empleado con código 9999 asignado directamente 
--en la variable con %TYPE, apellido ‘PEREZ’, oficio ‘ANALISTA’ y código del
--departamento al que pertenece 10

select * from emp;


DECLARE
   v_emp      emp.emp_no%TYPE; 
   v_apellido emp.apellido%TYPE;
   v_oficio   emp.oficio%TYPE;
   v_numero   emp.dept_no%TYPE;
BEGIN
   v_emp := 9999;
   v_apellido := 'PEREZ';
   v_oficio := 'ANALISTA';
   v_numero := 10;

   INSERT INTO emp (emp_no, apellido, oficio, dept_no)
   VALUES (v_emp, v_apellido, v_oficio, v_numero);
END;

--Incrementar el salario en la tabla EMP en 200 EUROS a todos los trabajadores que
--sean ‘ANALISTA’, mediante un bloque anónimo PL, asignando dicho
--valor a una variable declarada con %TYPE.

DECLARE
    v_emp emp.salario%TYPE;
    
BEGIN
    v_emp:= 200;
    update EMP set salario = salario + 200 where oficio = 'ANALISTA';

END;
select * from emp;


--Realizar un programa que devuelva el número de cifras de un número entero,
--introducido por teclado, mediante una variable de sustitución

DECLARE
    v_emp emp.salario%TYPE;
    
BEGIN
    v_emp:= 200;
    update EMP set salario = salario + 200 where oficio = 'ANALISTA';

END;
select * from emp;

Declare 
     Longitud int;
BEGIN
     Longitud:= '&data';
     longitud:=LENGTH(Longitud);
     dbms_output.put_line('La longitud es: '||longitud);
END;

undefine data;

--Crear un bloque PL para insertar una fila en la tabla DEPT. Todos los
--datos necesarios serán pedidos desde teclado

select * from dept;

DECLARE
     v_numero dept.dept_no%type;
     v_nombre dept.dnombre%type;
     v_localidad dept.loc%TYPe; 


BEGIN 
    v_numero:= '&numero';
    v_nombre:= '&nombre';
    v_localidad:='&localidad';
    insert into DEPT values (v_numero, v_nombre, v_localidad);

end; 

select * from dept;
undefine numero;
undefine nombre;
undefine localidad;

--Crear un bloque PL que actualice el salario de los empleados que no cobran comisión
--en un 5%
select * from emp;

DECLARE
    v_emp emp.salario%TYPE;
    
BEGIN
    v_emp:= 0.05;
    update EMP set salario = salario + (salario* 0.05) where comision = 0 or comision = null;

END;
select * from emp;

--Crear un bloque PL que almacene la fecha del sistema en una variable. Solicitar un
--número de meses por teclado y mostrar la fecha del sistema incrementado en ese
--número de meses


DECLARE
    n_meses INT;
    fecha DATE;
    suma DATE;
BEGIN
    n_meses := '&mes';
    fecha := SYSDATE;
    suma := ADD_MONTHS(fecha, n_meses);

    DBMS_OUTPUT.PUT_LINE('Su Fecha nueva es: ' || TO_CHAR(suma, 'DD-MM-YYYY'));
END;

undefine mes;


--Introducir dos números por teclado y devolver el resto de la
--división de los dos números

--Solicitar un nombre por teclado y devolver ese nombre con la primera inicial en
--mayúscula.

--Crear un bloque anónimo que permita borrar un registro de la tabl
--a emp introduciendo por parámetro un número de empleado