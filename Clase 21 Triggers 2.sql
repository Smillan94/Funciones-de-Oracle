drop trigger tr_dept_control_localidades
drop trigger tr_dept_before_update;
drop trigger tr_dept_before_delete;
drop trigger tr_doctor_control_salario_update;


--ejemplo integridad relacional con update
--si cambiamos un id de departamento que se modifiquen tambien
--los empleados asociados

create or replace trigger tr_update_dept_cascade
before update 
on dept   
for each ROW
     when (new.dept_no <> old.dept_no)
declare 

begin 
    dbms_output.put_line('Dept_no cambiado');
    --modificamos los datos asociados (EMP) 
    update emp set dept_no=:new.dept_no where
    dept_no=:old.dept_no;

end;

select * from dept;

update dept set dept_no =31 where dept_no=30;
select * from emp where dept_no=31;

--impedir insertar un nuevo presidente si ya existe uno en la tabla emp

create or replace trigger tr_emp_control_president_insert
before UPDATE
on emp
for each row
    when (upper(new.oficio)='PRESIDENTE')
declare
     v_presis Number;

BEGIN
     dbms_output.put_line('Derrocando presidente!!');
     select count(emp_no) into v_presis from emp    
     where upper(oficio)= 'PRESIDENTE';

     if v_presis  <> 0 Then   
        raise_application_error(-20001, 'Solo un presidente activo ');
    end if;
END;

insert into emp values( 8888, 'Millan', 'Jefe', 1994, sysdate, 3000,0,99);

select * from emp;


--packege para almacenar las variables entre triggers


create or replace package PK_TRIGGERS
as
    v_nueva_localidad DEPT.LOC%TYPE;
end PK_TRIGGERS;
create or replace trigger tr_dept_control_localidades_row
before update --VAMOS A COMPROBAR ANTES DE UPDATE
on DEPT
for each row
declare
begin
    dbms_output.PUT_LINE('For each ROW ');
    --almacenamos el valor de la nueva localidad
    PK_TRIGGERS.v_nueva_localidad := :new.LOC;
end;
drop trigger tr_dept_control_localidades_after;
--creamos el trigger de update para after
create or replace trigger tr_dept_control_localidades_after
after update
on DEPT
declare
      v_numero number;
begin

    select count(dept_no) into v_numero from dept
    where upper (loc)=upper(pk_triggers.v_nueva_localidad);
    if(v_numero >0 ) Then
    raise_application_error(-20001, 'Solo un departamento por localidad');
    end if;
    dbms_output.PUT_LINE('Localidad nueva: ' || PK_TRIGGERS.v_nueva_localidad);
    
end;

update DEPT set LOC='CADIZ' where DEPT_NO=10;

--TRIGGERS INSTEAD OF

--Creamos una vista con todos los datos de los departamentos

create or replace view vista_departamentos
as   
   select* from dept;

insert into vista_departamentos values (11, 'Vista', 'Sin Trigger');

-- creamos un trigger sobre la vista 
create or replace trigger tr_vista_dept 
instead of insert
on vista_departamentos
declare
begin 
     dbms_output.put_line('Insertando en vista dept');

End;

insert into vista_departamentos values (12, 'vista', 'con trigger');
create 
select * from vista_departamentos;


--vamos a crear una vista con los datos de los empleados
--pero sin sus datos sensibles (salario, comision, fecha_alt)

create or replace view vista_empleados

as
    select emp_no, apellido, oficio, dir, dept_no from emp;


select * from vista_empleados;

insert into vista_empleados values(555, 'el nuevo', 'Becario', 7566, 31);

select * from emp where dept_no=31;

--creamos un trigger rellenando los huevos que quedan de emp

create or replace trigger tr_vista_empleados

instead of insert 
on vista_empleados
declare 

begin
     --con new capturamos los datos que vienen en la vista
     --y rellenamos el resto
    insert into emp values( :new.emp_no , 
    :new.apellido, 
    :new.oficio, 
    :new.dir, 
    sysdate,
    0, 
    0,
    :new.dept_no);

end; 
insert into vista_empleados values(555, 'el nuevo', 'Becario', 7566, 31);
select * from emp where dept_no=31;
rollback;


--vamos a crear una vista para mostrar doctores

create or replace view vista_doctores
from doctor
    
    inner join hospital
    on doctor.hospital_cod =hospital.hospital_cod;


select * from vista_doctores;




create or replace trigger tr_vista_doctores

instead of insert 
on vista_doctores
declare 
     v_codigo hospital.hospital_cod%type;
begin
     --con new capturamos los datos que vienen en la vista
     --y rellenamos el resto
    select hospital_cod into v_codigo from hospital
    where upper (nombre)= upper(:new.nombre);
    insert into doctor values( :new.hospital_cod , 
    :new.doctor_no, 
    :new.apellido, 
    :new.especialidad, 
    :new:salario);
end;


end; 

insert into vista_doctores values (111,'House2, 'Especialidad, 45000, 'Provisional');


