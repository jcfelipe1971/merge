/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 22-mar-2007                                                    */
/*   Creator : SYSDBA                                                         */
/*============================================================================*/

execute procedure s_ajustes ('CRM',001,'Modulo CRM');
Commit Work;

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create domain CRM_TIPOS_ACCIONES as char(3) default "DES" check(value=upper(value) and value not containing " ") not null;
commit work;

create generator crm_conta_ambitos;
create generator crm_conta_emails;
commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_sys_acciones(
     ACCION CRM_TIPOS_ACCIONES,
     DESCRIPCION TITULOS_25);
commit work;

alter table crm_sys_acciones add constraint PK_CRM_SYS_ACCIONES primary key (ACCION);
commit work;

insert into crm_sys_acciones (accion, descripcion) values ('DES', 'DESCONOCIDA');
commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_ACCIONES_BI0 for CRM_SYS_ACCIONES active before insert position 0
as
begin
  if (new.descripcion <= '') then exception ERR_NO_NOMBRE;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_ACCIONES_BU0 for CRM_SYS_ACCIONES active before update position 0
as
begin
  if (old.accion = 'DES') then exception ERR_INTEGRIDAD;
  if (new.descripcion <= '') then exception ERR_NO_NOMBRE;
  new.accion = old.accion;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_ACCIONES_BD0 for CRM_SYS_ACCIONES active before delete position 0
as
begin
  if (old.accion = 'DES') then exception ERR_INTEGRIDAD;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_sys_ambitos(
  AMBITO CONTADORES,
  DESCRIPCION TITULOS_40);
commit work;

alter table crm_sys_ambitos add constraint PK_CRM_SYS_AMBITOS primary key (AMBITO);
commit work;

insert into crm_sys_ambitos(ambito, descripcion) values (0, 'DESCONOCIDO');
commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_AMBITOS_BI0 for CRM_SYS_AMBITOS active before insert position 0
as
begin
  if (new.descripcion <= '') then exception ERR_NO_NOMBRE;
  if ((new.ambito=0) or (new.ambito is null)) then
    new.ambito = gen_id(CRM_CONTA_AMBITOS,1);
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_AMBITOS_BU0 for CRM_SYS_AMBITOS active before update position 0
as
begin
  if (old.ambito = 0) then exception ERR_INTEGRIDAD;
  if (new.descripcion <= '') then exception ERR_NO_NOMBRE;
  new.ambito = old.ambito;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_AMBITOS_BD0 for CRM_SYS_AMBITOS active before delete position 0
as
begin
  if (old.ambito = 0) then exception ERR_INTEGRIDAD;
end
^

set term ;^

commit work;

/*============================================================================*/


/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_sys_emails(
     ID_EMAIL CONTADORES,
     DIRECCION_EMAIL TEXTOS_LARGOS,
     ACTIVO LOGICO_CIERTO not null);
commit work;

alter table crm_sys_emails add constraint PK_CRM_SYS_EMAILS primary key (ID_EMAIL);
commit work;

create unique index CRM_SYS_EMAILS_IDX1 on crm_sys_emails(DIRECCION_EMAIL);
commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_EMAILS_BI0 for CRM_SYS_EMAILS active before insert position 0
as
begin
  if (new.direccion_email <= '') then exception ERR_NO_NOMBRE;
  if ((new.id_email=0) or (new.id_email is null)) then
    new.id_email = gen_id(CRM_CONTA_EMAILS,1);
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_EMAILS_BU0 for CRM_SYS_EMAILS active before update position 0
as
begin
  if (new.direccion_email <= '') then exception ERR_NO_NOMBRE;
  new.id_email = old.id_email;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 22-mar-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_sys_emails_ambitos(
  ID_EMAIL CONTADORES,
  AMBITO CONTADORES);
commit work;

alter table crm_sys_emails_ambitos add constraint PK_SYS_EMAILS_AMBITOS primary key (ID_EMAIL, AMBITO);
commit work;

alter table crm_sys_emails_ambitos add constraint FK_CRM_SYS_EMAILS_AMBITOS_ID foreign key (ID_EMAIL) references CRM_SYS_EMAILS(ID_EMAIL);
alter table crm_sys_emails_ambitos add constraint FK_CRM_SYS_EMAILS_AMBITOS_AMB foreign key (AMBITO) references CRM_SYS_AMBITOS(AMBITO) on delete CASCADE;
commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 26-abr-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_EMAILS_AMBITOS_AI0 for CRM_SYS_EMAILS_AMBITOS active after insert position 0
as
begin
  /*Si se anade un ambito a un email, eliminamos el enlace al ambito 0-DESCONOCIDO*/
  if (new.ambito<>0) then
    delete from crm_sys_emails_ambitos
      where id_email=new.id_email and ambito=0;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 26-abr-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_EMAILS_AMBITOS_AD0 for CRM_SYS_EMAILS_AMBITOS active after delete position 0
as
declare variable num integer;
begin
  select count(*) from crm_sys_emails_ambitos 
    where id_email=old.id_email
    into :num;

  /*Si se borran todos los ambitos de un email, anadimos el enlace al ambito 0-DESCONOCIDO*/
  if ((num=0) or (num is null)) then
    insert into crm_sys_emails_ambitos (id_email, ambito) values (old.id_email, 0);
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 27-abr-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_SYS_EMAILS_AI0 for CRM_SYS_EMAILS active after insert position 0
as
begin
  /*Anadimos el enlace al ambito 0-DESCONOCIDO*/
  insert into crm_sys_emails_ambitos (id_email, ambito) values (new.id_email, 0);
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 08-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create procedure crm_importa_ambito(DESC_AMBITO varchar(40))
returns (ID_AMBITO integer)
as
begin
  id_ambito = null;
  select first(1) ambito from crm_sys_ambitos
    where UPPER(descripcion)=UPPER(:desc_ambito)
    order by ambito
    into :id_ambito;
    
  if (:id_ambito is null) then
  begin /*Si no existe el ambito, lo creamos*/
    id_ambito = gen_id(CRM_CONTA_AMBITOS,1);
    insert into crm_sys_ambitos (ambito, descripcion)
      values (:id_ambito, :desc_ambito);
  end

  suspend;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 08-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create procedure crm_importa_email(ID_AMBITO integer, DIRECCION_EMAIL varchar(100))
as
declare variable id_email integer;
declare variable existe   integer;
begin
  id_email = null;
  select first(1) id_email from crm_sys_emails
    where UPPER(direccion_email)=UPPER(:direccion_email)
    order by id_email
    into :id_email;
    
  if (:id_email is null) then
  begin /*Si no existe el email, lo creamos*/
    id_email = gen_id(CRM_CONTA_EMAILS,1);
    insert into crm_sys_emails (id_email, direccion_email, activo)
      values (:id_email, :direccion_email, 1);
  end
  
  existe = null;
  select first(1) id_email from crm_sys_emails_ambitos
    where id_email=:id_email and ambito=:id_ambito
    into :existe;
    
  if (:existe is null) then
    insert into crm_sys_emails_ambitos (id_email, ambito)
      values (:id_email, :id_ambito);
end
^

set term ;^

commit work;

/*============================================================================*/
