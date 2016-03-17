SET SERVEROUTPUT ON


CREATE OR REPLACE PROCEDURE cambiar_provincia
(
  p_idcentro in CENTROS.ID%TYPE,
  p_provincia in CENTROS.PROVINCIA%TYPE
)
is
e_cambiar_provincia EXCEPTION;
BEGIN 
  
  UPDATE CENTROS SET PROVINCIA = P_PROVINCIA WHERE ID = P_IDCENTRO;
  COMMIT;

  EXCEPTION
  when no_data_found then
  raise_application_error(-200002,'No hay datos');
  
END;

