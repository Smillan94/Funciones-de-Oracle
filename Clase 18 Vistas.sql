--vamos a crear una vista para tener todos los datos de los empleados sin el
--salario ni comision, ni dir.

create or replace view v_empleados
AS
  select emp_no, apellido, oficio, fecha_alt, dept_no from emp;

select * from v_empleados;

--una vista simplifica las consultas 
-- mostrar el apellido, oficio, salario, nombre departamento, localidad de todos
--los empleados

create or replace view v_emp_dept
as
select emp.apellido, emp.oficio, emp.salario, dept.dnombre, dept.loc
from emp    
inner join DEPT
on emp.dept_no = dept.dept_no;

select * from v_emp_dept where loc= UPPER('Madrid');

--eliminamos al empleado con id 7917

delete from v_empleados where emp_no=7917;

--insertamos en la vista

insert into v_empleados values (1111, 'Lunes', 'LUNES', sysdate, 40);

--modificar el salario de los empleados de Madrid
update V_EMP_DEPT set salario= salario +1 where loc ='Madrid';

--Eliminar los empleados de barcelona

delete from v_emp_dept where loc= 'BARCELONA';

rollback;

--no se puede insertar o modificar a dos tablas con una consulta view, solo
--permite eliminar
--para haccer la modificacion en ambas tablas se utiliza trigger.   


--Vistas que pueden llegar a ser inutiles
create or replace view v_vendedores
AS
  select emp_no, apellido, oficio, salario, dept_no from emp
  where oficio='VENDEDOR'
  with check option;

--modificamos el salario de los vendedores
update v_vendedores set salario= salario + 1;
update v_vendedores set oficio = 'VENDIDOS';
select * from v_vendedores;
rollback;

