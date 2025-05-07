--Trigger

Create or replace trigger tr_dept_before_insert
before INSERT
on dept
for each row
declare
Begin
    dbms_output.put_line('Trigger Dept before insert row');
    dbms_output.put_line(:new.dept_no || ' , '|| :new.dnombre|| ' , '|| :new.loc);
end;

insert into dept values (111, 'nuevo', 'toledo');

Create or replace trigger tr_dept_before_delete
before delete
on dept
for each row
declare
Begin
    dbms_output.put_line('Trigger Dept before insert row');
    dbms_output.put_line(:old.dept_no || ' , '|| :old.dnombre|| ' , '|| :old.loc);
end;

delete from dept where dept_no=111;

select * from dept;

Create or replace trigger tr_dept_before_update
before update
on dept
for each row
declare
Begin
    dbms_output.put_line('Trigger Dept before insert row');
    dbms_output.put_line(:old.dept_no || ', antigua LOC:  ' || :old.loc || ', Nueva Loc: '||: new.LOC);
end;

update dept set loc = 'Victoria' where dept_no=92;

--Trigger control doctor

Create or replace trigger tr_doctor_control_salario_update
before update
on DOCTOR
for each row
when (new.salario> 250000)
declare
Begin
    dbms_output.put_line('Trigger DOCTOR before Update row');
    dbms_output.put_line('D/Dra '
    ||:old.apellido 
    ||', cobra mucho dinero:  '
    ||:new.salario 
    ||', Antes: '
    ||: old.salario);
end;


update doctor set salario = '151151' where doctor_no=386;

--no podemos tener dos trigger del mismo tipo en una tabla.

create or replace trigger tr_dept_control_barcelona
before INSERT
on dept
for each row
declare
Begin
    dbms_output.put_line('Trigger control Barcelona');
    if (UPPER(:new.LOC)='BARCELONA') THEN
    dbms_output.put_line('No se admiten departamentos en Barcelona');
    raise_application_error (-20001,'En munich solo ganadores' );
    END IF;
end;
insert into dept values(66, 'Milan', 'BARCELONA');
select * from dept;

--La forma mas eficiente

create or replace trigger tr_dept_control_barcelona
before INSERT
on dept
for each row
   when (upper(new.loc)='BARCELONA')
declare
Begin
    dbms_output.put_line('Trigger control Barcelona');
    dbms_output.put_line('No se admiten departamentos en Barcelona');
    raise_application_error (-20001,'En munich solo ganadores' );
end;
insert into dept values(70, 'Milan', 'Gloria');
select * from dept;

---Eliminamos el trigger

drop trigger tr_dept_control_barcelona;

--
create or replace trigger tr_dept_control_localidades
before INSERT
on dept
for each row
declare
      v_num number;
Begin
    dbms_output.put_line('Trigger control Localidades');
    Select count(dept_no) into v_num from Dept
    where upper(LOC)= UPPER(:new.loc);
    if (v_num >0 ) THEN
      raise_application_error (-20001,'Solo un departamento por ciudad' );  
    end if;  
end;

insert into dept values (6, 'MILANA', 'TERUEL');