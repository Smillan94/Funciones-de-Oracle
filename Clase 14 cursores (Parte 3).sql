--- OTRA MANERA MAS SENCILLA
declare 
    v_id DEPT.DEPT_NO%TYPE;
    v_nombre DEPT.DNOMBRE%TYPE;
    v_localidad DEPT.LOC%TYPE;
    v_existe DEPT.DEPT_NO%TYPE;
begin
    v_id := &iddepartamento;
    v_nombre := '&nombre';
    v_localidad := '&localidad';
    select COUNT(DEPT_NO) into v_existe from DEPT
    where DEPT_NO=v_id;
    if (v_existe = 0) then
        dbms_output.put_line('Insert');
    else
        dbms_output.put_line('Update');
    end if;
end;
undefine iddepartamento;
undefine nombre;
undefine localidad;

select * from emp;

--

declare 

v_valor emp.salario%TYPE;
v_idemp emp.EMP_NO%TYPE;

begin

select emp_no, salario into v_idemp, v_valor from EMP
where UPPER(apellido)='ARROYO';

if (v_valor >= 250000) then
        dbms_output.put_line('Se le baja el sueldo por un valor de '|| '10 mil');
        v_valor := v_valor - 10000; 
else
        dbms_output.put_line('Se incrementa el sueldo por un valor de '|| '10 mil');
        v_valor := v_valor + 10000; 
end if;
update emp set salario=v_valor
where emp_no = v_idemp;
END;

--Necesitamos modificar el salario de los doctores de la paz.
--si la suma salarial supera 1.000.000 bajamos salarios en 10.000 a todos
-- si la suma salarial no supera el millon, subimos salarios en 10.000
--mostrar el numero de filas que hemos modificado (subir o bajar)
--Doctores con suerte, Doctores mas pobres:6 

select * from hospital;
select * from DOCTOR;

declare 

v_valor doctor.SALARIO%TYPE;

begin

select SUM(salario) into v_valor from doctor;

if (v_valor >= 1000000) then
        dbms_output.put_line('Se le baja el sueldo por un valor de '|| '10 mil');
        UPDATE doctor
        SET salario = salario - 10000
        WHERE hospital_cod = 22;
    
else
        dbms_output.put_line('Se incrementa el sueldo por un valor de '|| '10 mil');
        UPDATE doctor
        SET salario = salario + 10000
        WHERE hospital_cod = 22;
end if;

dbms_output.put_line( 'Salarios incrementados '|| SQL%ROWCOUNT || ' doctores');

END;
rollback;

--Otra forma de realizarlo

DECLARE v_suma_salarial Number;

BEGIN

select sum(doctor.salario) into v_suma_salarial
from DOCTOR
inner join hospital
on doctor.hospital_cod = hospital.HOSPITAL_COD
where lower(hospital.nombre)='La paz';

if v_suma_salarial > 1000000 THEN

update doctor set salario = salario - 10000
where hospital_cod=
(select hospital_cod from hospital where upper(nombre)='LA PAZ');
dbms_output.put_line('Bajando Salarios '|| SQL%ROWCOUNT);

else 
update doctor set salario = salario + 10000
where hospital_cod=
(select hospital_cod from hospital where upper(nombre)='LA PAZ');
dbms_output.put_line('Doctores ricos '||SQL%ROWCOUNT);

END if;

END;

--3 forma de hacerlo

select * from hospital;
select * from DOCTOR;



