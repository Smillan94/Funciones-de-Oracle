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

begin

select salario into v_valor from EMP
where UPPER(apellido)='ARROYO';

if (v_valor >= 250000) then
        dbms_output.put_line('Se le baja el sueldo por un valor de '|| '10 mil');
        update 
else
        dbms_output.put_line('Se incremenenta el sueldo por un valor de '|| '10 mil');
end if;
END;



