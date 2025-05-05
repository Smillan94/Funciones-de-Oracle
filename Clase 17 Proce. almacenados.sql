--Realizar un procedimiento para insertar un nuevo departamento
create or replace procedure sp_insetardepartamento
(p_id dept.dept_no%type, p_nombre dept.dnombre%type, p_localidad dept.loc%type)
AS
BEGIN
   insert into dept values (p_id, p_nombre, p_localidad);

END;

Begin 
   sp_insetardepartamento(11,'11','11');

END;

select * from dept;

rollback;

--normalmente dentro de los procedimiento se suele incluir 
--rollaback o commit (es opcional)

--version 2

--Realizar un procedimiento para insertar un nuevo departamento
--generamos un id con el max utomatico dentro del procedure 
create or replace procedure sp_insertardepartamento
(p_nombre dept.dnombre%type, p_localidad dept.loc%type)
AS
   v_max_id dept.dept_no%type;
BEGIN
select max(dept_no)+1 into v_max_id from dept;
   insert into dept values (v_max_id, p_nombre, p_localidad);
exception 
    when no_data_found THEN
       dbms_output.put_line('No existen datos');
       rollback;
END;

Begin 
   sp_insertardepartamento('miercoles','miercoles');

END;

select * from dept;

--Realizar un procedimiento para incrementar 
--el salario de los empleados por un oficio y el incremento
create or replace procedure sp_incremento_emp_oficio
(p_oficio emp.oficio%type, p_incremento number)

as

begin
    update emp set salario= salario + p_incremento
    where oficio= p_oficio;

end;

BEGIN
    SP_INCREMENTO_EMP_OFICIO(UPPER('analista'), 100);

end;

select * from emp where oficio = UPPER('analista');


--Realizar un procedimiento para insertar un doctor
--enviaremos todos los datos deñ doctor, excepto el id
--debemos recuperar el maximo id de doctor dentro del procedimiento


select * from doctor;
create or replace procedure sp_insertardoctor
(p_apellido doctor.apellido%type
, p_especialidad doctor.especialidad%type
, p_salario doctor.salario%type
, p_hospital doctor.hospital_cod%type)

AS 
  v_max_iddoctor doctor.doctor_no%type;

Begin 
    select max(doctor_no) + 1 into v_max_iddoctor from doctor;
    insert into doctor values(p_hospital
    , v_max_iddoctor
    , p_apellido
    , p_especialidad
    , p_salario);
    dbms_output.put_line('Insertados '|| SQL%ROWCOUNT);

END;

BEGIN 
    SP_insertardoctor ('Willson2', 'Doctor', 280000, 19);
END;

--version 2
--Realizar un procedimiento para insertar un doctor
--enviaremos todos los datos del doctor, excepto el id
--debemos recuperar el maximo id de doctor dentro del procedimiento
--Enviaremos el nombre del hospital en lugar del id del hospital
--Controlar si no existe el hospital eviado

select * from hospital;
create or replace procedure sp_insertardoctor
(p_apellido doctor.apellido%type
, p_especialidad doctor.especialidad%type
, p_salario doctor.salario%type
, p_hospital_nombre hospital.nombre%type)

AS 
  v_max_iddoctor doctor.doctor_no%type;
  v_hospital_cod hospital.hospital_cod%type;

Begin 
    select hospital_cod into v_hospital_cod
    from hospital
    where upper(nombre)= upper(p_hospital_nombre);
    select max(doctor_no) + 1 into v_max_iddoctor from doctor;
    insert into doctor values(v_hospital_cod
    , v_max_iddoctor
    , p_apellido
    , p_especialidad
    , p_salario);
    dbms_output.put_line('Insertados '|| SQL%ROWCOUNT);
exception 
     when no_data_found THEN
     dbms_output.put_line('No existe el hospital '|| p_hospital_nombre);

END;

--Podemos utilizar cursosres explicitos
--realizar un pro para mostrar los empleados de un determinado numero de
--departamentos
create or replace procedure sp_empleados_dept
(p_deptno emp.dept_no%type)

AS
  cursor cursor_emp IS
  select * from emp
  where dept_no = p_deptno;

BEGIN
     for v_reg_emp in cursor_emp
    
     loop 
         dbms_output.put_line( 'Apellido '
         || v_reg_emp.apellido 
         ||' , oficio '
         || v_reg_emp.oficio);
     end loop;

end; 

--OUT
--vamos a realizar un procedimiento para enviar el nombre
--del departamento y devolver el numero de dicho departamento

create or replace procedure sp_numerodepartamento
(p_nombre dept.dnombre%type, p_iddept out dept.dept_no%type)

as 
 v_iddept dept.dept_no%type;
begin

    select dept_no into v_iddept from dept
    where upper(dnombre) = upper(p_nombre);
    p_iddept:= v_iddept;
    dbms_output.put_line(' El número de departamento es '|| v_iddept);

end;

begin 
     sp_numerodepartamento('Ventas');
END; 

--Necesito un procedimiento para incrementar en 1 
--el salario de los empleados de un departamento
--Enviaremos al procedimiento el nombre del departamento

create or replace procedure sp_incrementar_sal_dept
(p_nombre dept.dnombre%type)

as    
    v_num dept.dept_no%type;
BEGIN
     
    --recuperamos el id del departamento a partir del nombre
SP_NUMERODEPARTAMENTO(p_nombre, v_num);
    update emp set salario = salario + 1
    where dept_no=v_num;
    dbms_output.put_line('Salarios modificados: '|| SQL%ROWCOUNT);
    
END; 

Begin 



     sp_incrementar_sal_dept('Ventas');
END; 
