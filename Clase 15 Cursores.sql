--Realizamos la declaración con departamentos
describe dept;

declare
v_fila dept%rowtype;
cursor cursor_dept is    
select * from dept;

begin 
    open cursor_dept;
    loop 
        fetch cursor_dept into v_fila;
        exit when cursor_dept%notfound;
        dbms_output.put_line(' Id' || v_fila.dept_no || ', Nombre:'
        || v_fila.dnombre || ', Localidad' || v_fila.Loc);
    end loop;    
    close cursor_dept;

end;

rollback;

--Realizar un cursor para mostrar el apellido, salario y oficio
--de empleados

DECLARE
cursor cursor_emp is     
select apellido, salario, oficio, (salario + comision) as total
from emp;

BEGIN
     for v_registro in cursor_emp
     loop    
        dbms_output.put_line('Apellido: '|| v_registro.apellido
        || ', Salario: '|| v_registro.salario
        || ', Oficio: ' || v_registro.oficio ||' Total: '|| v_registro.total);
     end loop;
END;