create table PEDIDOS (
	ITEMS INT,
	CAJAS_GRANDES INT,
	CAJAS_PEQUENAS INT,
	CANTIDAD_CAJAS INT
);

insert into PEDIDOS (CAJAS_GRANDES, CAJAS_PEQUENAS, CANTIDAD_CAJAS, ITEMS) values (1, 1, 1, 1);
insert into PEDIDOS (CAJAS_GRANDES, CAJAS_PEQUENAS, CANTIDAD_CAJAS, ITEMS) values (2, 2, 2, 2);
insert into PEDIDOS (CAJAS_GRANDES, CAJAS_PEQUENAS, CANTIDAD_CAJAS, ITEMS) values (3, 3, 3, 3);
insert into PEDIDOS (CAJAS_GRANDES, CAJAS_PEQUENAS, CANTIDAD_CAJAS, ITEMS) values (4, 4, 4, 4);
insert into PEDIDOS (CAJAS_GRANDES, CAJAS_PEQUENAS, CANTIDAD_CAJAS, ITEMS) values (5, 5, 5, 5);

FUNCTION CALCULAR_CAJAS_NECESARIAS (
        item      NUMBER,
        cantidadp    NUMBER,
        cantidadg    NUMBER
        )         
RETURN NUMBER IS
    value_item   NUMBER;
BEGIN    
    SELECT
        ROUND((item * cantidadg ),5)
    INTO value_item
    FROM
        pedidos
    WHERE
        cajas (name) = cantidadp(pedidos)
        AND ROWNUM < 5;    
    
    RETURN value_item;
END CALCULAR_CAJAS_NECESARIAS;



PROCEDURE calcular (
    pedidos IN INT
) AS

    item      NUMBER := 0;
    cantidadp   NUMBER := 0;
    cantidadg      NUMBER := 0;
BEGIN
    	SELECT DISTINCT
        PEDIDOS.ITEMS
        PEDIDOS.CAJAS_GRANDES
        PEDIDOS.CAJAS_PEQUENAS
        PEDIDOS.CANTIDAD_CAJAS
        COALESCE(SUM(tc.concept_value) OVER(PARTITION BY tc.trip_id), NULL, 0),
        c.name
    INTO
        items,
        cantidadp
        cantidadg
        
    FROM
        PEDIDOS
        INNER JOIN pedidos  ON items = cajas
        
    WHERE
        items = cajas;
        
    IF items = cantidadp
    THEN -- 
        items := 0;
        cantidadp := items +cantidadp ;
               
        
        SET
            cantidadp = items
       
        
    ELSE 
        dbms_output.put_line('No es posible calcular cantidad');
    END IF;
    
END;





CREATE TYPE number_array AS VARRAY(50) OF INTEGER
return number IS
Input : N = 10
Output : -2,-3,4,-1,-2,1,5,-3
Input : N = 7
Output :4,-1,-2,1,5 
  
BEGIN
 for (int i = 1; i <= N; i++) 
        product = a[i - 1] / 10;
     
        if (product == 0)
            product = 1;
        else
            product = a[i - 1] % 10;
     
        int val = a[i - 1] / 10;
     
        if (val == 0)
            val = a[i - 1];
     
        a[i] = a[i - 1] + (val * product);    
END;

BEGIN
    dbms_output.put_line('MIN 20 - 40: ' || number_array(20,40));
END;



