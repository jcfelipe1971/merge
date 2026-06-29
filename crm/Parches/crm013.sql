/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 03-feb-2009                                                    */
/*   Creator : Ruben                                                          */
/*   Descrip.: Relacion de documentos por clave primaria	              */
/*             Cuando se borra una oferta borrar la relacion	              */
/*============================================================================*/
execute procedure s_ajustes ('CRM',013,'Modulo CRM');
commit Work;

alter table CRM_CONTACTOS_ACCIONES add doc_empresas EMPRESAS;
commit work;
/*============================================================================*/

alter table CRM_CONTACTOS_ACCIONES add doc_canal CANALES;
commit work;
/*============================================================================*/


alter table CRM_CONTACTOS_ACCIONES add doc_series SERIES;
commit work;
/*============================================================================*/


alter table CRM_CONTACTOS_ACCIONES add doc_ejercicio EJERCICIOS;
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 03-feb-2009   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_VER_CABECERAS_OFERTA_C_BD0 for VER_CABECERAS_OFERTA_C active after delete position 0
as
begin
   update crm_contactos_acciones
      set doc_accion = 0      
    where doc_empresas=old.empresa and
          doc_ejercicio=old.ejercicio and
          doc_series=old.serie and
          doc_accion=old.rig; 
end
^

set term ;^

commit work;

/*============================================================================*/
