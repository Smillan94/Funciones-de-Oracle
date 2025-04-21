--Bucles SQL
--Loop, While y For

--Vamos a mostrar la suma de los primeros 100 numeros
--LOOP END LOOP

DECLARE
      --Variables contador suelen denominarse con una sola letra(i, j, k)
      i int;
      suma int;
BEGIN
      --debemos iniciar i, sino sera null
      i:= 1;
      --inicializamos suma
      suma:=0;
      LOOP
        suma:= suma + i;
        --incrementamos la variable i
        i:=i+1;
        --debemos indicar cuando queremos que el bucle finalice
        exit when i >100;
        END LOOP;
        dbms_output.put_line('La suma de los 100 primeros numeros es: '|| suma);

END;


--2) El mismo bucle pero con un While:
--While.. Loop
--La condicion se evalua antes de entrar

DECLARE
    i int;
    suma int;

BEGIN 
    i:= 1;
    suma:= 0;
    while i <= 100
    LOOP
        suma:= suma + i;
        i:= i+1;
    end loop;
    dbms_output.put_line('La suma de los 100 primeros numeros es: '|| suma);

END;

-- El mismo bucle pero con
--FOR.. LOOP

DECLARE
    
    suma int;

BEGIN 

    suma:= 0;
    for i in 1..100 loop
        suma:= suma + i;
    end loop;
    dbms_output.put_line('La suma de los 100 primeros numeros es: '|| suma);

END;

--GOTO

DECLARE
    
    suma int;

BEGIN 

    suma:= 0;
    dbms_output.put_line('Inicio');
    goto codigo;
    dbms_output.put_line('Antes del bucle');

    for i in 1..100 loop
        suma:= suma + i;
    end loop;
    <<codigo>>
    dbms_output.put_line('Despues del bucle');
    dbms_output.put_line('La suma de los 100 primeros numeros es: '|| suma);

END;

--RESTRICCIONES GOTO
--No puede haber etiquetas con el mismo nombre
--Tiene que ir al final, despues del goto



