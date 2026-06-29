/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 07-jul-2008                                                    */
/*   Creator : ALBERT                                                         */
/*  Descrip: Desenvolupament del CRM. Es crea la taula de seguiments i es dona mes funcions a la consulta de accions */ 
/*============================================================================*/
execute procedure s_ajustes ('CRM',007,'Modulo CRM');
commit Work;

/*============================================================================*/


/*============================================================================*/
/* Date: 07-jul-2008   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
alter table CRM_CONTACTOS add ruta_imagen TEXTOS_MAS_LARGOS;
commit work;

alter table CRM_CONTACTOS add origen_contacto TIPOS_MOVIMIENTOS;
commit work;
/*============================================================================*/

create table crm_sys_origen_contacto(
     TORIGEN TIPOS_MOVIMIENTOS,
     DESCRIPCION TEXTOS_LARGOS);
commit work;

alter table CRM_SYS_ORIGEN_CONTACTO add constraint PK_CRM_SYS_ORIGEN_CONTACTO primary key (TORIGEN);
commit work;
/*============================================================================*/

set term ^;

create trigger CRM_SYS_ORIGEN_CONTACTO_BU10 for CRM_SYS_ORIGEN_CONTACTO active before update position 10
as
begin
  if (old.torigen = 'DES') then exception ERR_INTEGRIDAD;
end
^

set term ;^

commit work;

/*============================================================================*/

set term ^;

create trigger CRM_SYS_ORIGEN_CONTACTO_BD10 for CRM_SYS_ORIGEN_CONTACTO active before delete position 10
as
begin
  if (old.torigen = 'DES') then exception ERR_INTEGRIDAD;
end
^

set term ;^

commit work;

/*============================================================================*/
insert into crm_sys_origen_contacto (torigen,descripcion)
values ('DES','DESCONOCIDO');
commit work;

update crm_contactos
set origen_contacto='DES';
commit work;


alter table CRM_CONTACTOS add constraint FK_CRM_CONTACTOS_ORIGEN foreign key (ORIGEN_CONTACTO) references CRM_SYS_ORIGEN_CONTACTO(TORIGEN);
commit work;

alter table CRM_CONTACTOS_ACCIONES_DET add fecha_seg_siguiente FECHA_VACIA;
commit work;

alter table CRM_CONTACTOS add link_google TEXTOS_MAS_LARGOS;
commit work;
/*============================================================================*/

set term ^;

create trigger CRM_CONTACTOS_ACCIONES_AU10 for CRM_CONTACTOS_ACCIONES active after update position 10
as
begin
  /*sfg.albert - Si es finalitza l'accio, es finalitzaran el corresponents seguiments*/
  if (old.fin_accion=0 and new.fin_accion=1) then
    begin
      update crm_contactos_acciones_det
       set fin_seg=1
      where id_accion=new.id_accion; 
    end
end
^

set term ;^

commit work;

/*============================================================================*/
create table crm_sys_tipo_seg(
     TSEGUIMIENTO CRM_TIPOS_ACCIONES,
     DESCRIPCION TITULOS_40);
commit work;


alter table CRM_SYS_TIPO_SEG add constraint PK_CRM_SYS_TIPO_SEG primary key (TSEGUIMIENTO);
commit work;

insert into crm_sys_tipo_seg (tseguimiento,descripcion) values ('DES','Tipo Desconocido');
insert into crm_sys_tipo_seg (tseguimiento,descripcion) values ('CEL','Correo Electronico');
insert into crm_sys_tipo_seg (tseguimiento,descripcion) values ('FAX','Fax');
insert into crm_sys_tipo_seg (tseguimiento,descripcion) values ('TEL','Llamada telefonica');
commit work;

/*============================================================================*/
alter table CRM_SYS_ACCIONES drop TIPO_ACCION;
commit work;
alter table CRM_SYS_ACCIONES add tipo_seg CRM_TIPOS_ACCIONES;
commit work;
alter table CRM_SYS_ACCIONES add constraint FK_CRM_SYS_ACCIONES_tseg foreign key (TIPO_SEG) references CRM_SYS_TIPO_SEG(TSEGUIMIENTO);
commit work;
/*============================================================================*/

alter table CRM_CONTACTOS_ACCIONES_DET add tipo_seg CRM_TIPOS_ACCIONES;
commit work;
alter table CRM_CONTACTOS_ACCIONES_DET drop TIPO_ACCION;
commit work;
alter table CRM_CONTACTOS_ACCIONES_DET add constraint FK_CRM_CONTACTOS_ACC_DET_tseg foreign key (TIPO_SEG) references CRM_SYS_TIPO_SEG(TSEGUIMIENTO);
commit work;
