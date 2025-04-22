
--Cursores implicitos solamente pueden devolver una fila
--recuperar el oficio del empleado rey

DECLARE
     v_oficio emp.oficio%type;

BEGIN
     select oficio into v_oficio from emp where upper(apellido)='REY';
     dbms_output.put_line('El oficio de REY es...'|| v_oficio);
END;

--Cursos explicito
--Pueden devolver mas de una fila
--Es necesario declararlos
--Se declaran con la palabra cursor

--Mostrar el apellido y salario de todos los empleados

DECLARE 
     v_ape EMP.APELLIDO%TYPE;
     V_sal EMP.SALARIO%TYPE;
--Declaramos nuestro cursos con una consulta
--La consulta debe tener los mismos datos para luego
--hacer el fetch
cursor cursoremp IS
select apellido, salario from emp;
BEGIN
--abrir el cursor
    open cursoremp;
--bucle infinito
    LOOP
--extraemos los datos del cursor
     fetch cursoremp into v_ape, v_sal;
--dibujamos los datos
     dbms_output.put_line('Apellido: '|| v_ape|| 'Salario: '|| v_sal);
     exit when cursoremp%notfound;
    END LOOP;
    close cursoremp;
END;

select * from emp;

--ATRIBUTO ROWCOUNT para las consultas de accion
--Incrementar en 1 el salario de los empleados del departamento 10.

--Mostrar el numero de empleados modificados.

BEGIN
    update emp set salario= salario+1 
    where dept_no=10;
    dbms_output.put_line( 'Empleados modificados'|| SQL%ROWCOUNT);
END;

select * from emp;


--Incrementar en 10.000 al empleado menos cobre en la empresa:
--¿que necesito para esto?
--minimo salario

DECLARE
v_salario emp.salario%type;

BEGIN
    select min(salario) into v_salario from emp;
    update emp set salario= salario+10000 where salario= v_salario;
    dbms_output.put_line( 'Salarios incrementados '|| SQL%ROWCOUNT || ' empleados');
END;

select * from emp;

--Realizar un codigo PL/SQL donde pediremos 
--el numero, nombre y localidad de un departamento
--si el departamento existe , modificamos su nombre y localidad
--si el departamento no existe, lo insertamos

--90, I+D, GIJON
select * from dept;


DECLARE
v_id dept.dept_no%type;
v_nombre dept.dnombre%type;
v_localidad dept.loc%type;
v_existe  dept.dept_no%type;

cursor cursoremp IS
select dept_no, dnombre, loc from emp where dept_no= v_id;

BEGIN
    v_id:=&iddepartamento;
    v_nombre:= '&nombre';
    v_localidad:= '&localidad';

open cursoremp;
fetch cursoremp into v_id, v_nombre, v_localidad;
exit when cursoremp%notfound;

if (v_existe is null) THEN
dbms_output.put_line('Update');

else

dbms_output.put_line('insert');

END if;

update 

END;