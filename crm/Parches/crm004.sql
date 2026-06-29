/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 28-feb-2008                                                    */
/*   Creator : Albert                                                         */
/* Descrip.: Bugs CRM */
/*============================================================================*/

execute procedure s_ajustes ('CRM',004,'Modulo CRM');
Commit Work;



/*============================================================================*/

/*============================================================================*/
/* Date: 19-feb-2008   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
alter table CRM_CONTACTOS add comentario APUNTES;
alter table CRM_CONTACTOS add cliente CONTADORES;

commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 20-feb-2008   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create procedure crm_importa_clientes (EMPRESA_CLI integer)
returns (NUM integer)
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
declare variable agente           integer;
declare variable cliente          integer;
begin
  num = 0;

  for select cli.cliente,cli.tercero, ter.nombre_r_social, ter.nombre_comercial, ter.tipo_razon, ter.nif,
             ter.telefono01, ter.telefono02, ter.telefax, ter.email, ter.web
      from emp_clientes cli
      left join sys_terceros ter on (cli.tercero=ter.tercero)
      where cli.tercero not in (select tercero from crm_contactos) 
      and cli.empresa=:empresa_cli
      into :cliente,:tercero, :nombre_r_social, :nombre_comercial, :tipo_razon, :nif,
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
        telefax, dir_nombre, dir_localidad, id_local, email, web,cliente)
      values (:id_contacto, :id_contacto, :tercero, :nombre_r_social,
        :nombre_comercial, :tipo_razon, :nif, :telefono01, :telefono02,
        :telefax, :dir_nombre, :dir_localidad, :id_local, :email, :web,:cliente);

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
      agente = null;
      select first(1) agente from emp_clientes
        where empresa=:empresa and tercero=:tercero
        order by cliente
        into :agente;

      if (agente is not null) then
        insert into crm_contactos_agentes_emp (id_contacto, empresa, agente)
          values (:id_contacto, :empresa, :agente);
    end

    num = num + 1;
  end

  suspend;
end

^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 25-feb-2008   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
alter table CRM_CONTACTOS_ACCIONES add hora_prox_accion TITULOS_CORTOS_IND;
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 27-feb-2008   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

alter procedure crm_crea_tercero (ID_CONTACTO integer, FECHA date, DIR_CLASE smallint,
 DIR_TIPO char(3), DIR_NOMBRE varchar(40), DIR_NOMBRE_2 varchar(40), DIR_NUMERO varchar(15),
 DIR_BLOQUE_ESCALERA varchar(4), DIR_PISO varchar(2), DIR_PUERTA varchar(6))
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
declare variable web              varchar(60);
declare variable notas            blob;
declare variable dir_localidad    char(8);
declare variable id_local         integer;
declare variable nombre_persona           varchar(40);
declare variable apellidos_persona        varchar(40);
declare variable telefono_persona         varchar(20);
declare variable movil_persona            varchar(20);
declare variable fax_persona              varchar(20);
declare variable extension_persona        varchar(5);
declare variable email_persona            varchar(40);
declare variable notas_persona            blob;

begin
  select nombre_r_social, nombre_comercial, tipo_razon, nif,
         telefono01, telefono02, telefax, email, web, notas,
         dir_localidad, id_local
    from crm_contactos
    where id_contacto=:id_contacto
    into :nombre_r_social, :nombre_comercial, :tipo_razon, :nif,
         :telefono01, :telefono02, :telefax, :email, :web, :notas,
         :dir_localidad, :id_local;

  tercero = gen_id(conta_terceros, 1);

  insert into sys_terceros(tercero,nombre_r_social,nombre_comercial,tipo_razon,
    nif,fecha_alta,notas,email,web,telefono01,telefono02,telefax)
  values(:tercero,:nombre_r_social,:nombre_comercial,:tipo_razon,:nif,
    :fecha,:notas,:email,:web,:telefono01,:telefono02,:telefax);

  /* Se inserta en la tabla SYS_TERCEROS_DIRECCIONES */
  insert into sys_terceros_direcciones(tercero,direccion,dir_clase,dir_tipo,dir_nombre,
    dir_nombre_2,dir_numero,dir_bloque_escalera,dir_piso,dir_puerta,
    dir_localidad,dir_telefono01,dir_telefono02,dir_telefax,dir_defecto,id_local)
  values(:tercero,1,:dir_clase,:dir_tipo,:dir_nombre,:dir_nombre_2,
    :dir_numero,:dir_bloque_escalera,:dir_piso,:dir_puerta,:dir_localidad,
    :telefono01,:telefono02,:telefax,1,:id_local);
    
  /*sfg.albert - Es fa el traspas dels contactes del contacte al tercer*/
  for select nombre,apellidos,movil,telefono,fax,extension,email,notas 
   from crm_contactos_personas
   where id_contacto=:id_contacto
   into :nombre_persona,:apellidos_persona,:movil_persona,:telefono_persona,:fax_persona,
        :extension_persona,:email_persona,:notas_persona
  do
   begin
    insert into sys_terceros_contactos(tercero,nombre,apellidos,movil,telefono,fax,extension,
      correo,notas)
    values (:tercero,:nombre_persona,:apellidos_persona,:movil_persona,:telefono_persona,:fax_persona,
    :extension_persona,:email_persona,:notas_persona);
  end  
  
  update crm_contactos set tercero=:tercero
    where id_contacto=:id_contacto;
end
^

set term ;^

commit work;




create table crm_configuracion(
     ID ID,
     CRM_TIPO_LETRA TITULOS_40_NULL,
     CRM_TAMANO_LETRA CONTADORES);
commit work;	 
/*============================================================================*/
alter table CRM_CONFIGURACION add constraint PK_CRM_CONFIGURACION primary key (ID);
commit work;

create generator crm_id_configuracion;
commit work;

set term ^;

create trigger CRM_CONFIGURACION_BI0 for CRM_CONFIGURACION active before insert position 0
as
begin
    if (new.id = 0) then
        new.id  =  gen_id(crm_id_configuracion,1);
end
^

set term ;^

commit work;

/*============================================================================*/
insert into crm_configuracion (crm_tipo_letra,crm_tamano_letra)
values ('Verdana',10);
commit work;
