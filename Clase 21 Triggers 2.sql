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