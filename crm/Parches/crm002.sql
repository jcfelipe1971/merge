/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 17-may-2007                                                    */
/*   Creator : SYSDBA                                                         */
/*============================================================================*/

execute procedure s_ajustes ('CRM',002,'Modulo CRM');
Commit Work;

/*============================================================================*/
/* Date: 17-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create generator crm_id_contactos;
commit work;

create table crm_contactos(id_contacto ID);
alter table CRM_CONTACTOS add num_contacto CONTADORES;
alter table CRM_CONTACTOS add fecha_alta FECHA_AHORA;
alter table CRM_CONTACTOS add tercero CONTADORES;
alter table CRM_CONTACTOS add nombre_r_social TITULOS_LARGOS_IND;
alter table CRM_CONTACTOS add nombre_comercial TITULOS_LARGOS_IND;
alter table CRM_CONTACTOS add nombre_corto TITULOS_CORTOS_IND;
alter table CRM_CONTACTOS add tipo_razon TIPOS_RS;
alter table CRM_CONTACTOS add nif CIFS;
alter table CRM_CONTACTOS add telefono01 TELEFONOS;
alter table CRM_CONTACTOS add telefono02 TELEFONOS;
alter table CRM_CONTACTOS add telefax TELEFONOS;
alter table CRM_CONTACTOS add dir_nombre TITULOS_LARGOS_IND;
alter table CRM_CONTACTOS add dir_localidad LOCALIDADES;
alter table CRM_CONTACTOS add id_local ID;
alter table CRM_CONTACTOS add email EMAILS;
alter table CRM_CONTACTOS add web TITULOS_LARGOS_IND;
alter table CRM_CONTACTOS add notas NOTAS;
commit work;

alter table CRM_CONTACTOS add constraint PK_CRM_CONTACTOS primary key (ID_CONTACTO);
commit work;

alter table CRM_CONTACTOS add constraint FK_CRM_CONTACTOS_TER foreign key (TERCERO) references SYS_TERCEROS(TERCERO);
commit work;

insert into crm_contactos (id_contacto, num_contacto, tercero, nombre_r_social, 
 nombre_comercial, tipo_razon, nif, telefono01, telefono02, telefax, dir_nombre, 
 dir_localidad, id_local, email, web)
 select -1, -1, tercero, nombre_r_social, nombre_comercial, tipo_razon, nif,
   telefono01, telefono02, telefax, '', '99999999', 1, email, web
   from sys_terceros where tercero=-1;
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 30-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_BI0 for CRM_CONTACTOS active before insert position 0
as
begin
  if ((new.id_contacto=0) or (new.id_contacto is null)) then
    new.id_contacto = gen_id(CRM_ID_CONTACTOS,1);
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 30-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_BU0 for CRM_CONTACTOS active before update position 0
as
begin
  new.id_contacto = old.id_contacto;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 17-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_contactos_agrupaciones(id_contacto ID);
alter table CRM_CONTACTOS_AGRUPACIONES add agrupacion SYS_AGRUPACIONES;
commit work;

alter table CRM_CONTACTOS_AGRUPACIONES add constraint PK_CRM_CONTACTOS_AGRUPACIONES primary key (ID_CONTACTO, AGRUPACION);
commit work;

alter table CRM_CONTACTOS_AGRUPACIONES add constraint FK_CRM_CONTACTOS_AGRUP_CON foreign key (ID_CONTACTO) references CRM_CONTACTOS(ID_CONTACTO);
alter table CRM_CONTACTOS_AGRUPACIONES add constraint FK_CRM_CONTACTOS_AGRUP_AGR foreign key (AGRUPACION) references SYS_AGRUPACIONES(AGRUPACION);
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 17-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_AGRUP_BU0 for CRM_CONTACTOS_AGRUPACIONES active before update position 0
as
begin
  new.id_contacto = old.id_contacto;
  new.agrupacion  = old.agrupacion ;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 17-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_contactos_personas(id_contacto ID);
alter table CRM_CONTACTOS_PERSONAS add num_persona CONTADORES;
alter table CRM_CONTACTOS_PERSONAS add nombre TITULOS_40;
alter table CRM_CONTACTOS_PERSONAS add apellidos TITULOS_40;
alter table CRM_CONTACTOS_PERSONAS add telefono TELEFONOS;
alter table CRM_CONTACTOS_PERSONAS add movil TELEFONOS;
alter table CRM_CONTACTOS_PERSONAS add fax TELEFONOS;
alter table CRM_CONTACTOS_PERSONAS add extension EXTENSIONES;
alter table CRM_CONTACTOS_PERSONAS add email EMAILS;
alter table CRM_CONTACTOS_PERSONAS add notas NOTAS;
commit work;

alter table CRM_CONTACTOS_PERSONAS add constraint PK_CRM_CONTACTOS_PERSONAS primary key (ID_CONTACTO, NUM_PERSONA);
commit work;

alter table CRM_CONTACTOS_PERSONAS add constraint FK_CRM_CONTACTOS_PERS_CON foreign key (ID_CONTACTO) references CRM_CONTACTOS(ID_CONTACTO);
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_PERSONAS_BI0 for CRM_CONTACTOS_PERSONAS active before insert position 0
as
begin
  if ((new.num_persona is null) or (new.num_persona=0)) then
  begin
    select max(num_persona) 
      from crm_contactos_personas
      where id_contacto=new.id_contacto
      into new.num_persona;
    
    if (new.num_persona is null) then 
      new.num_persona=0;
    new.num_persona = new.num_persona + 1 ; 
  end 
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_PERSONAS_BU0 for CRM_CONTACTOS_PERSONAS active before update position 0
as
begin
  new.id_contacto = old.id_contacto;
  new.num_persona = old.num_persona;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_contactos_documentos(id_contacto ID);
alter table CRM_CONTACTOS_DOCUMENTOS add linea CONTADORES;
alter table CRM_CONTACTOS_DOCUMENTOS add descripcion TITULOS_LARGOS_IND;
alter table CRM_CONTACTOS_DOCUMENTOS add nombre_fichero TITULOS_LARGOS_IND;
alter table CRM_CONTACTOS_DOCUMENTOS add path_fichero TITULOS_LARGOS_IND;
alter table CRM_CONTACTOS_DOCUMENTOS add tipo_fichero CHAR_3VM;
alter table CRM_CONTACTOS_DOCUMENTOS add fecha_alta FECHA_AHORA;
alter table CRM_CONTACTOS_DOCUMENTOS add activo LOGICO;
commit work;

alter table CRM_CONTACTOS_DOCUMENTOS add constraint PK_CRM_CONTACTOS_DOCUMENTOS primary key (ID_CONTACTO, LINEA);
commit work;

alter table CRM_CONTACTOS_DOCUMENTOS add constraint FK_CRM_CONTACTOS_DOC_CON foreign key (ID_CONTACTO) references CRM_CONTACTOS(ID_CONTACTO);
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_DOCUMENTOS_BI0 for CRM_CONTACTOS_DOCUMENTOS active before insert position 0
as
begin
  if ((new.linea is null) or (new.linea=0)) then
  begin
    select max(linea) 
      from crm_contactos_documentos
      where id_contacto=new.id_contacto
      into new.linea;
    
    if (new.linea is null) then 
      new.linea=0;
    new.linea = new.linea + 1; 
  end 
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_DOCUMENTOS_BU0 for CRM_CONTACTOS_DOCUMENTOS active before update position 0
as
begin
  new.id_contacto = old.id_contacto;
  new.linea       = old.linea;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_contactos_clientes_emp(id_contacto ID);
alter table CRM_CONTACTOS_CLIENTES_EMP add empresa EMPRESAS;
alter table CRM_CONTACTOS_CLIENTES_EMP add cliente CONTADORES;
commit work;

alter table CRM_CONTACTOS_CLIENTES_EMP add constraint PK_CRM_CONTACTOS_CLIENTES_EMP primary key (ID_CONTACTO, EMPRESA);
commit work;

alter table CRM_CONTACTOS_CLIENTES_EMP add constraint FK_CRM_CONTACTOS_CLI_EMP_CON foreign key (ID_CONTACTO) references CRM_CONTACTOS(ID_CONTACTO);
alter table CRM_CONTACTOS_CLIENTES_EMP add constraint FK_CRM_CONTACTOS_CLI_EMP_CLI foreign key (EMPRESA, CLIENTE) references EMP_CLIENTES(EMPRESA, CLIENTE);
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_CLIENTES_EMP_BU0 for CRM_CONTACTOS_CLIENTES_EMP active before update position 0
as
begin
  new.id_contacto = old.id_contacto;
  new.empresa     = old.empresa;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_contactos_agentes_emp(id_contacto ID);
alter table CRM_CONTACTOS_AGENTES_EMP add empresa EMPRESAS;
alter table CRM_CONTACTOS_AGENTES_EMP add agente CONTADORES;
commit work;

alter table CRM_CONTACTOS_AGENTES_EMP add constraint PK_CRM_CONTACTOS_AGENTES_EMP primary key (ID_CONTACTO, EMPRESA);
commit work;

alter table CRM_CONTACTOS_AGENTES_EMP add constraint FK_CRM_CONTACTOS_AGE_EMP_CON foreign key (ID_CONTACTO) references CRM_CONTACTOS(ID_CONTACTO);
alter table CRM_CONTACTOS_AGENTES_EMP add constraint FK_CRM_CONTACTOS_AGE_EMP_AGE foreign key (EMPRESA, AGENTE) references EMP_AGENTES(EMPRESA, AGENTE);
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_AGENTES_EMP_BU0 for CRM_CONTACTOS_AGENTES_EMP active before update position 0
as
begin
  new.id_contacto = old.id_contacto;
  new.empresa     = old.empresa;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create table crm_contactos_acciones(id_contacto ID);
alter table CRM_CONTACTOS_ACCIONES add linea CONTADORES;
alter table CRM_CONTACTOS_ACCIONES add empresa_agente EMPRESAS;
alter table CRM_CONTACTOS_ACCIONES add agente CONTADORES;
alter table CRM_CONTACTOS_ACCIONES add fecha_accion FECHA_HOY;
alter table CRM_CONTACTOS_ACCIONES add tipo_accion CRM_TIPOS_ACCIONES;
alter table CRM_CONTACTOS_ACCIONES add descripcion_accion TITULOS_LARGOS_IND;
alter table CRM_CONTACTOS_ACCIONES add notas NOTAS;
alter table CRM_CONTACTOS_ACCIONES add fin_accion LOGICO;
alter table CRM_CONTACTOS_ACCIONES add fecha_prox_accion FECHA_VACIA;
alter table CRM_CONTACTOS_ACCIONES add tipo_prox_accion CRM_TIPOS_ACCIONES;
alter table CRM_CONTACTOS_ACCIONES add descripcion_prox_accion TITULOS_LARGOS_IND;
commit work;

alter table CRM_CONTACTOS_ACCIONES add constraint PK_CRM_CONTACTOS_ACCIONES primary key (ID_CONTACTO, LINEA);
commit work;

alter table CRM_CONTACTOS_ACCIONES add constraint FK_CRM_CONTACTOS_ACC_CON foreign key (ID_CONTACTO) references CRM_CONTACTOS(ID_CONTACTO);
alter table CRM_CONTACTOS_ACCIONES add constraint FK_CRM_CONTACTOS_ACC_AGE foreign key (EMPRESA_AGENTE, AGENTE) references EMP_AGENTES(EMPRESA, AGENTE);
commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_ACCIONES_BI0 for CRM_CONTACTOS_ACCIONES active before insert position 0
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
  end 
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 23-may-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_ACCIONES_BU0 for CRM_CONTACTOS_ACCIONES active before update position 0
as
begin
  new.id_contacto = old.id_contacto;
  new.linea       = old.linea;
end
^

set term ;^

commit work;

/*============================================================================*


/*============================================================================*/
/* Date: 12-jun-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create view crm_ver_agrupaciones_con(
  AGRUPACION,
  TITULO,
  ID_CONTACTO)
as 
select c.agrupacion,a.titulo,c.id_contacto
from crm_contactos_agrupaciones c
join sys_agrupaciones a
on(c.agrupacion=a.agrupacion) 
where a.tipo = 'C';
commit work;
/*============================================================================*/


/*============================================================================*/
/* Date: 10-jul-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create procedure crm_importa_terceros
as
declare variable tercero          integer;
declare variable nombre_r_social  varchar(60);
declare variable nombre_comercial varchar(60);
declare variable tipo_razon       varchar(4);
declare variable nif              varchar(20);
declare variable telefono01       varchar(20);
declare variable telefono02       varchar(20);
declare variable telefax          varchar(20);
declare variable email            varchar(40);
declare variable web              varchar(40);
declare variable dir_nombre       varchar(60);
declare variable dir_localidad    char(8);
declare variable id_local         integer;
declare variable id_contacto      integer;
declare variable empresa          integer;
declare variable cliente          integer;
declare variable agente           integer;
begin
  for select tercero, nombre_r_social, nombre_comercial, tipo_razon, nif,
             telefono01, telefono02, telefax, email, web
    from sys_terceros
    where tercero not in (select tercero from crm_contactos)
    into :tercero, :nombre_r_social, :nombre_comercial, :tipo_razon, :nif, 
         :telefono01, :telefono02, :telefax, :email, :web
  do
  begin
    select SUBSTR(dir_completa_n,1,60), dir_localidad, id_local 
      from sys_terceros_direcciones
      where tercero=:tercero and dir_defecto=1
      into :dir_nombre, :dir_localidad, :id_local;

    id_contacto = gen_id(CRM_ID_CONTACTOS, 1);
    insert into crm_contactos (id_contacto, num_contacto, tercero, nombre_r_social,
        nombre_comercial, tipo_razon, nif, telefono01, telefono02,
        telefax, dir_nombre, dir_localidad, id_local, email, web)
      values (:id_contacto, :id_contacto, :tercero, :nombre_r_social, 
        :nombre_comercial, :tipo_razon, :nif, :telefono01, :telefono02, 
        :telefax, :dir_nombre, :dir_localidad, :id_local, :email, :web);
        
    insert into crm_contactos_personas (id_contacto, nombre, apellidos, telefono,
        movil, fax, extension, email, notas)
      select :id_contacto, nombre, apellidos, telefono, movil, fax, extension,
          correo, notas
        from sys_terceros_contactos 
        where tercero=:tercero
        order by contacto;
    
    for select empresa from sys_empresas where abierta=1 order by empresa
      into :empresa
    do
    begin
      select first(1) cliente, agente from emp_clientes
        where empresa=:empresa and tercero=:tercero
        order by cliente
        into :cliente, :agente;
        
      insert into crm_contactos_clientes_emp (id_contacto, empresa, cliente)
        values (:id_contacto, :empresa, :cliente);
        
      insert into crm_contactos_agentes_emp (id_contacto, empresa, agente)
        values (:id_contacto, :empresa, :agente);        
    end  
  end
end
^

set term ;^

commit work;

/*============================================================================*/
