/*======================================================================================*/
/*   Script File                                                              			*/
/*                                                                            			*/
/*   Date    : 24-feb-2009                                                    			*/
/*   Creator : Albert                                                         			*/
/*   Desc:   Parxe especial que crea, executa i borra un procediment per omplir la taula crm_contactos_acciones		*/
/*                amb l'empresa,canal, serie i exercici que els hi falta en funcio de la data de l'accio                */
/*======================================================================================*/

SET TERM ^ ;

CREATE PROCEDURE TMP_MODIFICAR_CRM_ACCIONES 
as
declare variable ejercicio smallint;
declare variable id_contacto integer;
declare variable fecha date;
declare variable linea integer;
begin
  for select fecha_accion,id_contacto,linea from CRM_CONTACTOS_ACCIONES
  into :fecha,:id_contacto,:linea
  do
   begin
     if (:fecha>='01/01/2008 00:00:00' and :fecha <='12/31/2008 23:59:59') then
       begin
         ejercicio=2008;
       end

     else if (:fecha>='01/01/2009 00:00:00' and :fecha <='12/31/2009 23:59:59') then
       begin
         ejercicio=2009;
       end

     update crm_contactos_acciones
      set doc_empresas=1,
          doc_canal=1,
          doc_series='A',
          doc_ejercicio=:ejercicio
     where id_contacto=:id_contacto and linea=:linea;


   end
end
^

SET TERM ; ^

commit work;
execute procedure TMP_MODIFICAR_CRM_ACCIONES;
commit work;

drop procedure TMP_MODIFICAR_CRM_ACCIONES;
commit work;