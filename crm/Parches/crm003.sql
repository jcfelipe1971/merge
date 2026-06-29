/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 10-jul-2007                                                    */
/*   Creator : SYSDBA                                                         */
/*============================================================================*/

execute procedure s_ajustes ('CRM',003,'Modulo CRM');
Commit Work;


/*============================================================================*/
/* Date: 13-dic-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create procedure crm_crea_tercero (ID_CONTACTO integer, FECHA date, 
  DIR_CLASE smallint, DIR_TIPO char(3), DIR_NOMBRE varchar(40), DIR_NOMBRE_2 varchar(40),
  DIR_NUMERO varchar(15), DIR_BLOQUE_ESCALERA varchar(4), DIR_PISO varchar(2),
  DIR_PUERTA varchar(6))
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
    
  update crm_contactos set tercero=:tercero
    where id_contacto=:id_contacto;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 13-dic-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

alter procedure crm_importa_terceros 
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
begin
  num = 0;

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
/* Date: 13-dic-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_CONTACTOS_BD0 for CRM_CONTACTOS active before delete position 0
as
begin
  delete from crm_contactos_acciones where id_contacto=old.id_contacto;
  delete from crm_contactos_agentes_emp where id_contacto=old.id_contacto;
  delete from crm_contactos_agrupaciones where id_contacto=old.id_contacto;
  delete from crm_contactos_documentos where id_contacto=old.id_contacto;
  delete from crm_contactos_personas where id_contacto=old.id_contacto;
end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 13-dic-2007   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
drop table CRM_CONTACTOS_CLIENTES_EMP;
commit work;

alter table CRM_SYS_ACCIONES add fin_accion LOGICO;
commit work;
/*============================================================================*/
