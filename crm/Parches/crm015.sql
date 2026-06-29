/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 05-mar-2009                                                    */
/*   Creator : Albert                                                          */
/*   Descrip.: Es creen dos camps mes a la taula temporal per l'assistents de contactes     */
/*============================================================================*/
execute procedure s_ajustes ('CRM',015,'Modulo CRM');
commit Work;

ALTER TABLE CRM_TMP_IMPORTAR_CONTACTOS
ADD FAX TELEFONOS;
commit work;

ALTER TABLE CRM_TMP_IMPORTAR_CONTACTOS
ADD NIF CIFS;
commit work;
