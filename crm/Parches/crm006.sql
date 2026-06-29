/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2008                                                    */
/*   Creator : Albert                                                         */
/*   Desc.:    Desenvolupament del CRM. Es millora l formulari de consulta d'acciones i es creen accions */
/*============================================================================*/
execute procedure s_ajustes ('CRM',006,'Modulo CRM');
commit Work;


/*============================================================================*/

DROP TABLE crm_contactos_acciones_det;

create table crm_contactos_acciones_det(
     ID_CONTACTO ID,
     LINEA_CAB CONTADORES,
     ORDEN CONTADORES,
     ID_ACCION_DET ID,
     ID_ACCION ID,
     FECHA FECHA_VACIA,
     TIPO_ACCION CRM_TIPOS_ACCIONES,
     DESCRIPCION_ACCION TITULOS_LARGOS_IND,
     HORA_ACCION TITULOS_CORTOS_IND,
     NOTAS NOTAS,
     FIN_SEG LOGICO,
     ID_SEG_SIGUIENTE ID);
commit work;


alter table CRM_CONTACTOS_ACCIONES_DET add constraint PK_CRM_CONTACTOS_ACCIONES_DET primary key (ID_CONTACTO, LINEA_CAB, ORDEN);
commit work;
alter table CRM_CONTACTOS_ACCIONES_DET add constraint FK_CRM_CONTACTOS_ACC_DET_CAB foreign key (ID_CONTACTO, LINEA_CAB) references CRM_CONTACTOS_ACCIONES(ID_CONTACTO, LINEA);
commit work;

/*============================================================================*/

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

set term ^;

create trigger CRM_CONTACTOS_ACCIONES_BD10 for CRM_CONTACTOS_ACCIONES active before delete position 10
as
begin
  delete from crm_contactos_acciones_det
  where id_accion=old.id_accion;
end
^

set term ;^

commit work;


/*============================================================================*/
create table crm_sys_tipo_acciones(
     TACCION CRM_TIPOS_ACCIONES,
     DESCRIPCION TITULOS_25,
     IMAGEN CONTADORES_NULL);
commit work;

/*============================================================================*/

alter table CRM_SYS_TIPO_ACCIONES add constraint PK_CRM_SYS_TIPO_ACCIONES primary key (TACCION);
commit work;

insert into crm_sys_tipo_acciones (taccion,descripcion)
values ('DES','Tipo Desconocido');
commit work;

insert into crm_sys_tipo_acciones (taccion,descripcion)
values ('CEL','Correo Electronico');
commit work;

insert into crm_sys_tipo_acciones (taccion,descripcion)
values ('FAX','Fax');
commit work;

insert into crm_sys_tipo_acciones (taccion,descripcion)
values ('TEL','Llamada telefonica');
commit work;

/*============================================================================*/

alter table CRM_SYS_ACCIONES add tipo_accion CRM_TIPOS_ACCIONES;
commit work;

alter table CRM_SYS_ACCIONES add constraint FK_CRM_SYS_ACCIONES_TAccion foreign key (TIPO_ACCION) references CRM_SYS_TIPO_ACCIONES(TACCION);
commit work;
/*============================================================================*/
