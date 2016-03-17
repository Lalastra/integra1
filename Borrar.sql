SET SERVEROUTPUT ON


CREATE OR REPLACE PROCEDURE borrado_centro
  (p_idcentro in CENTROS.ID%TYPE,
  p_centro_alterno in CENTROS.ID%TYPE
  )
IS
  V_ID CENTROS.ID%TYPE;
BEGIN

  SELECT ID  INTO V_ID FROM CENTROS WHERE ID=p_idcentro;

  IF SQL%FOUND THEN
   SELECT ID  INTO V_ID FROM CENTROS WHERE ID=p_centro_alterno;
    IF SQL%FOUND THEN
    UPDATE TRABAJADORES SET IDCENTRO=p_centro_alterno where IDCENTRO=p_idcentro;
    DELETE  from centros WHERE ID = p_idcentro;
    commit;
    END IF;
  END IF;
   
EXCEPTION
WHEN NO_DATA_FOUND THEN
raise_application_error(-20001,'no se han encontrado datos');

END;

