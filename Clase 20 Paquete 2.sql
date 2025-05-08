--Necesitamos un paquete con procedimiento para modificar el salario de cada 
--Doctor de forma individual.
--La modificación de los datos de cada doctor será de forma aleatoria.
--Debemos comprobar el Salario de cada Doctor para ajustar el número aleatorio 
--del incremento.
--1) Doctor con menos de 200.000: Incremento aleatorio de 500
--2) Doctor entre de 200.000 y 300.000: Incremento aleatorio de 300
--3) Doctor mayor a 300.000: Incremento aleatorio de 50
--El incremento Random lo haremos con una función dentro del paquete.

--bloque pl/sql

create or replace package pk_doctores
as
    procedure incremento_random_doctores;
    function function_random_doctores(p_iddoctor DOCTOR.DOCTOR_NO%TYPE)
    return NUMBER;
end pk_doctores;
--body
create or replace package body pk_doctores
as
    procedure incremento_random_doctores
    as
        cursor c_doctores is
        select DOCTOR_NO, APELLIDO, SALARIO from DOCTOR;
        v_random number;
    begin
        for v_doc in c_doctores
        loop
            v_random := function_random_doctores(v_doc.DOCTOR_NO);
            update DOCTOR set SALARIO = SALARIO + v_random
            where DOCTOR_NO=v_doc.DOCTOR_NO;
            dbms_output.put_line('Doctor ' || v_doc.APELLIDO 
            || ' tiene un incremento de ' || v_random);
        end loop;
    end;
    function function_random_doctores(p_iddoctor DOCTOR.DOCTOR_NO%TYPE)
    return NUMBER
    as
        v_salario DOCTOR.SALARIO%TYPE;  
        v_random NUMBER;
    begin
        select SALARIO into v_salario from DOCTOR
        where DOCTOR_NO=p_iddoctor;
        if (v_salario < 200000) then
            v_random := trunc(dbms_random.value(1,500));
        elsif (v_salario > 300000) then
            v_random := trunc(dbms_random.value(1, 50));
        else 
            v_random := trunc(dbms_random.value(1, 300));
        end if;
        return v_random;    
    end;
end pk_doctores;



declare
    cursor c_doctores is
    select DOCTOR_NO, APELLIDO, SALARIO from DOCTOR;
    v_random number;
begin
    for v_doc in c_doctores
    loop
        v_random := random_doctor(v_doc.DOCTOR_NO);
        update DOCTOR set SALARIO = SALARIO + v_random
        where DOCTOR_NO=v_doc.DOCTOR_NO;
        dbms_output.put_line('Doctor ' || v_doc.APELLIDO 
        || ' tiene un incremento de ' || v_random);
    end loop;
end;






create or replace function random_doctor
(p_iddoctor DOCTOR.DOCTOR_NO%TYPE)
return number
as
    v_salario DOCTOR.SALARIO%TYPE;  
    v_random NUMBER;
begin
    select SALARIO into v_salario from DOCTOR
    where DOCTOR_NO=p_iddoctor;
    if (v_salario < 200000) then
        v_random := trunc(dbms_random.value(1,500));
    elsif (v_salario > 300000) then
        v_random := trunc(dbms_random.value(1, 50));
    else 
        v_random := trunc(dbms_random.value(1, 300));
    end if;
    return v_random;
end;
--386 -> 500
--522 -> 50
select PK_DOCTORES.FUNCTION_RANDOM_DOCTORES(386) as incremento from DUAL;
select random_doctor(522) as incremento from DUAL;
select * from DOCTOR;
update doctor set salario = salario + dbms_random.value(1,50);
select trunc(dbms_random.value(1,50)) as aleatorio from DUAL;
select * from DOCTOR;