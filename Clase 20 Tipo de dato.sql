
---Bloque anonimo para recuperar el apellido, oficio y salario de empleados

DECLARE
      --primero declaramos el tipo
      type type_empleado is record(
      v_apellido varchar2(50),
      v_oficio varchar2(50),
      v_salario number
      );
      --uso del tipo en una 
      v_tipo_empleado type_empleado;
BEGIN

    select apellido, oficio, salario into v_tipo_empleado
    from emp where emp_no=7839;
    dbms_output.put_line('Apellido:  '||v_tipo_empleado.v_apellido
    || ', oficio: '|| v_tipo_empleado.v_oficio 
    ||', Salario:  '|| v_tipo_empleado.v_salario);

END; 
     

--ARRAY EN PL/SQL TABLE OF(Dinamico) y IS VARRAY(tiene que definir la longitud)

--Por un lado tenemos la declaracion del tipo
--Por otro lado, tenemos la variablede dicho tipo


DECLARE
      --un tipo array para numeros
      type table_numeros is table of number   
      index by binary_integer;
      --objeto para almacenar varios numeros
      lista_numeros table_numeros;

BEGIN
     --almacenamos datos en su interior
    lista_numeros(1):= 88;
    lista_numeros(2):= 99;
    lista_numeros(3):=222;
dbms_output.put_line('Numero elementos'|| lista_numeros.count);
--podemos recorrer todos los registros (numeros) que tengamos
for i in 1..lista_numeros.count loop    
    dbms_output.put_line('Numero: '|| lista_numeros(i));
ENd lOOP;

END;

--almacenamos a la vez
--guardamos un tipo fila de departamento

declare 
   type table_dept is table of dept%rowtype index BY binary_integer;
   --declaramos el objeto para almacenar filas 
   lista_dept table_dept;

BEGIN
    select * into lista_dept(1) from dept where dept_no=10;
    select * into lista_dept(2) from dept where dept_no=30;
    for i in 1..lista_dept.count
    loop
       dbms_output.put_line(lista_dept(i).dnombre || ', '|| lista_dept(i).LOC);
    End loop;
end; 

select * from dept;


declare 
       cursor cursorempleados IS
       select apellido from emp;
       type c_lista is varray (20) of emp.apellido%type;
       lista_empleados c_lista:=c_lista();
       contador integer:=0;
Begin 
     for n in cursorempleados LOOP
     contador:= contador + 1;
     lista_empleados.extend;
     lista_empleados(contador):= n.apellido;
     dbms_output.put_line('Empleado '|| contador|| ' : '|| 
     lista_empleados (contador));
     END LOOP;
END; 







