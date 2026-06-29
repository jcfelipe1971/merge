/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 05-des-2011                                                  */
/*   Creator : Albert                                                         */
/*  Desc.: Es posa el pais_c2 enlloc del pais a localidades */
/*============================================================================*/
execute procedure s_ajustes ('CRM',019,'Modulo CRM');
Commit Work;

ALTER TABLE CRM_TMP_IMPORTAR_LOCALIDADES ADD PAIS_C2 CHAR_2CM^
commit work^

CREATE trigger crm_tmp_importar_localidad_bi0 for crm_tmp_importar_localidades
active before insert position 0
AS
begin
  select pais_c2 from sys_paises
  where pais=new.pais
  into new.pais_c2;

end^
commit work^