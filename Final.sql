create table PEDIDOS (
	ITEMS INT,
	CAJAS_GRANDES INT,
	CAJAS_PEQUENAS INT,
	CANTIDAD_CAJAS INT
);



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
