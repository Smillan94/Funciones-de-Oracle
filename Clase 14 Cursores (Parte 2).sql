DECLARE
v_id dept.dept_no%type;
v_nombre dept.dnombre%type;
v_localidad dept.loc%type;
v_existe  dept.dept_no%type;

cursor cursordept IS
select dept_no, dnombre, loc from emp where dept_no= v_id;

BEGIN
    v_id:=&iddepartamento;
    v_nombre:= '&nombre';
    v_localidad:= '&localidad';

open cursordept;
LOOP
fetch cursordept into v_id, v_nombre, v_localidad;
END LOOP;

close cursordept;
exit when cursoremp%notfound;

if (v_existe is null) THEN
dbms_output.put_line('Update');

else
dbms_output.put_line('insert');

END if;

END;