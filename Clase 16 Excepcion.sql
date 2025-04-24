--EXCEPTION
DECLARE
v_numero1 number:= &numero1;
v_numero2 number:= &numero2;
v_division number;

BEGIN
v_division:= v_numero1 / v_numero2;
dbms_output.put_line('La division es' || v_division);

EXCEPTION 
when ZERO_DIVIDE then   
      dbms_output.put_line('Error al divisir enntre 0');
END;

--Cuando los empleados tengan una comision con valor 0 ,
--lanzaremos una excepcion
--tendremos una tabla donde almacenaremos los empleados con comision mayor a cero

create table emp_comision (apeliido varchar(50), comision number(9));

declare 
     cursor cursor_emp IS
     select apellido, comision from emp order by comision DESC;
     exception_comision EXCEPTION; 

BEGIN
    for v_record in cursor_emp
    loop    
        if (v_record.comision = 0 ) then
             raise exception_comision; 
    END IF; 
    END LOOP;
EXCEPTION
      when exception_comision Then    
         dbms_output.put_line('Comisiones a Zero'); 

end;


declare 

exception_nulos exception;
pragma exception_init(exception_nulos, -1400);

BEGIN
insert into dept values (null,'Departamento','Pragma');

exception 
      when exception_nulos then     
        dbms_output.put_line( 'No me sirven los nulos....');
end;


DECLARE

v_id number;

begin 
    select dept_no into v_id
    from dept
    where dnombre= 'Bentas';
    dbms_output.put_line('Ventas es es numero ' || v_id);

Exception 
     when too_many_rows Then     
     dbms_output.put_line(' Demasiadas filas en cursor  ');
     when others then    
     dbms_output.put_line(' Algo esta pasando  ');

END;



  