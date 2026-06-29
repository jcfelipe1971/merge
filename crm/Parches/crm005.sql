/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 12-març-2008                                                    */
/*   Creator : Albert                                                         */
/*  Desc.: Es fa el desenvolupament del CRM de les accions detall de la principal i es solventen bugs */
/*============================================================================*/
execute procedure s_ajustes ('CRM',005,'Modulo CRM');
Commit Work;

/*============================================================================*/
/* Date: 12-març-2008   User: SYSDBA                                          */
/*----------------------------------------------------------------------------*/
alter table CRM_CONTACTOS_ACCIONES add id_accion ID;
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 12-març-2008   User: SYSDBA                                          */
/*----------------------------------------------------------------------------*/
create generator CRM_ID_ACCIONES;
create generator crm_acciones_det;
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 12-març-2008   User: SYSDBA                                          */
/*----------------------------------------------------------------------------*/
set term ^;

alter trigger CRM_CONTACTOS_ACCIONES_BI0 active before insert position 0
as
begin
  if ((new.linea is null) or (new.linea=0)) then
  begin
    select max(linea)
      from crm_contactos_acciones
      where id_contacto=new.id_contacto
      into new.linea;

    if (new.linea is null) then
      new.linea=0;
    new.linea = new.linea + 1;
    
  /*sfg.albert - Es crea un id_acciones */
    if ((new.id_accion=0) or (new.id_accion is null)) then
    new.id_accion = gen_id(CRM_ID_ACCIONES,1);  
    
  end
end
^

set term ;^

commit work;

/*============================================================================*/
create table crm_contactos_acciones_det(
     ID_ACCION_DET ID,
     ID_ACCION ID,
     ORDEN CONTADORES,
     FECHA FECHA_VACIA,
     TIPO_ACCION CRM_TIPOS_ACCIONES,
     DESCRIPCION_ACCION TITULOS_LARGOS_IND,
     HORA_ACCION TITULOS_CORTOS_IND,
     NOTAS NOTAS);
commit work;

/*============================================================================*/
/* Date: 12-març-2008   User: SYSDBA                                          */
/*----------------------------------------------------------------------------*/
alter table CRM_CONTACTOS_ACCIONES_DET add constraint PK_CRM_CONTACTOS_ACCIONES_DET primary key (ID_ACCION_DET);
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 12-març-2008   User: SYSDBA                                          */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_ACCIONES_DET_BI0 for CRM_CONTACTOS_ACCIONES_DET active before insert position 0
as
begin
  /*sfg.albert - Es crea un id_acciones_detall */
    if ((new.id_accion_det=0) or (new.id_accion_det is null)) then
    new.id_accion_det = gen_id(CRM_ACCIONES_DET,1); 
end
^

set term ;^

commit work;

/*============================================================================*/

insert into dic_listados_grupos(GRUPO,TITULO,LISTADODEF,COPIAS,PIJAMA,LISTADODEFMAIL)
values (8202,'Listado Acciones Contacto',8202,1,0,0);
commit work;

insert into dic_listados(LISTADO, GRUPO, TITULO, EDITABLE, CABECERA, TIPO)
values (8202, 8202, 'Listado Acciones Contacto', 1, 1000, 'FRF');
commit work;

insert into dic_listados_grupos(GRUPO,TITULO,LISTADODEF,COPIAS,PIJAMA,LISTADODEFMAIL)
values (8203,'Listado Seguimiento Acciones',8203,1,0,0);
commit work;

insert into dic_listados(LISTADO, GRUPO, TITULO, EDITABLE, CABECERA, TIPO)
values (8203, 8203, 'Listado Seguimiento Acciones', 1, 1000, 'FRF');
commit work;

