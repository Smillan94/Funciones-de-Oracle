--Realizar un codigo PL/SQL donde pediremos 
--el numero, nombre y localidad de un departamento
--si el departamento existe , modificamos su nombre y localidad
--si el departamento no existe, lo insertamos

--90, I+D, GIJON

DECLARE
 
v_id dept.dept_no%type;
v_nombre dept.dnombre%type;
v_localidad dept.loc%type;
v_existe dept.dept_no%type;
    
CURSOR cursordept IS
        SELECT dept_no from dept where dept_no= v_id;

BEGIN
    v_id:= &IDdepartamento;
    v_nombre:= '&nombre';
    v_localidad:= '&localidad';
    
    OPEN cursordept;

        FETCH cursordept INTO v_existe;
        IF (cursordept%found) THEN
        dbms_output.put_line('Update');
        update dept set dnombre=v_nombre, loc=v_localidad
        where dept_no= v_id;

        ELSE
        dbms_output.put_line('insert');
        insert into dept values (v_id, v_nombre, v_localidad);
        END IF;
        
        CLOSE cursordept;
END;

select * from dept;


