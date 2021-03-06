VARIABLE V_ID NUMBER

CREATE OR REPLACE PROCEDURE VISUALIZAR_DATOS_CENTRO(P_NOMBRE IN VARCHAR2, NUMERO OUT NUMBER, T_CURSOR OUT Sys_Refcursor) IS
BEGIN
  BUSCAR_CENTRO_POR_NOMBRE(P_NOMBRE, :V_ID);
  SELECT COUNT(*) INTO NUMERO FROM TRABAJADORES WHERE IDCENTRO = V_ID;
  OPEN T_CURSOR FOR 'SELECT * INTO T_CURSOR FROM CENTROS WHERE ID = V_ID';
END;