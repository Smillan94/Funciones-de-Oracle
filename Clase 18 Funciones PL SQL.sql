--realizar una funcion para sumar dos numeros

create or replace function f_sumar_numeros
(p_numero1 number, p_numero2 number)    
return number
as 
    v_suma number;
begin 
     v_suma:= p_numero1 + p_numero2;
     return v_suma;
end; 

--llamada con codigo PL/SQL
DECLARE
    v_resultado number;

BEGIN
    v_resultado:= F_SUMAR_NUMEROS(22, 55);
   dbms_output.put_line('La suma es '|| v_resultado);

END; 

--llamada con select

select F_SUMAR_NUMEROS(22,55) as suma from dual;
select f_sumar_numeros(salario, comision) as total from emp;

create or replace function num_personas_oficio
(p_oficio emp.oficio%type)
return NUMBER
AS
  v_personas int;
BEGIN
  select count(emp_no) into v_personas from emp
  where lower(oficio)=lower(p_oficio);
  return v_personas;

END; 

select num_personas_oficio('analista') as personas from dual;

--realizar una funcion para devolver el mayor de dos números


create or replace function mayor_de_dos 
(num1 NUMBER, num2  NUMBER) 
RETURN NUMBER
as

BEGIN
    if num1 > num2 THEN
        RETURN num1;
    ELSE
        RETURN num2;
    end if;
END;


DECLARE
    v_resultado number;

BEGIN
    v_resultado:= MAYOR_DE_DOS(22, 55);
   dbms_output.put_line('El mayor es '|| v_resultado);

END; 

select MAYOR_DE_DOS(22,55) as El_mayor_es from dual;

--realizar una funcion para devolver el mayor de tres numeros
--no quiero utilizar if 
--buscar una funcion de oracle que nos devuelva el mayor

create or replace function mayor_de_tres 
(num1 NUMBER, num2 NUMBER, num3 NUMBER) 
RETURN NUMBER
as
BEGIN
    RETURN GREATEST(num1, num2, num3);
END;

/
BEGIN
     dbms_output.put_line('El mayor es: ' || mayor_de_tres(45, 8, 22));
END;
/

--tenemos los parametros por defecto dentro de las funciones.
/
 select 100*1.21 as iva from dual;
/
select 100*1.18 as iva from dual;
/

create or replace function calcular_iva
(p_precio number, p_iva number:= 1.18)
return number
as
begin
     return p_precio * p_iva;
end;

select calcular_iva(100,1.21) as iva from dual;

