SET SERVEROUTPUT ON


create or replace Procedure visualizar_lista_centro(pcursor out Sys_Refcursor) Is

BEGIN

  OPEN pcursor for 'select * from centros';
  
END;

execute visualizar_lista_centro;