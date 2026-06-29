/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 22-jul-2008                                                    */
/*   Creator : Albert                                                         */
/*   Descrip.: Es modifiquen triggers per error i es posa la millora de poder veure a l'adreça el tipus de carrer*/
/*============================================================================*/

execute procedure s_ajustes ('CRM',008,'Modulo CRM');
commit Work;


/*============================================================================*/


/*============================================================================*/
/* Date: 22-jul-2008   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

alter trigger CRM_CONTACTOS_ACCIONES_BI0 active before insert position 0
as
begin
  /*sfg.albert - Es crea un id_acciones */
    if ((new.id_accion=0) or (new.id_accion is null)) then
    new.id_accion = gen_id(CRM_ID_ACCIONES,1);

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
/* Date: 23-jul-2008   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
alter table CRM_CONTACTOS add activitat_economica TEXTOS_MAS_LARGOS;
alter table CRM_CONTACTOS add ambito CONTADORES;
commit work;

alter table CRM_CONTACTOS_ACCIONES add doc_accion CONTADORES;
commit work;

/*============================================================================*/

set term ^;

alter procedure crm_importa_clientes (EMPRESA_CLI integer)
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
declare variable direc_tipo       char(3); /*sfg.albert*/
declare variable titulo_direccio    char(20); /*sfg.albert*/
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
/*    select SUBSTR(dir_completa_n,1,60), dir_localidad, id_local*/
    select SUBSTR(dir_nombre,1,40), dir_localidad, id_local, dir_tipo
      from sys_terceros_direcciones
      where tercero=:tercero and dir_defecto=1
      into :dir_nombre, :dir_localidad, :id_local, :direc_tipo;
      
   /*sfg.albert*/   
   select SUBSTR(titulo,1,20) from sys_tipo_direccion
   where tipo=:direc_tipo
   into :titulo_direccio;    
   
   dir_nombre=titulo_direccio||' '||dir_nombre;  /*sfg.albert*/
      

    id_contacto = gen_id(CRM_ID_CONTACTOS, 1);
    insert into crm_contactos (id_contacto, num_contacto, tercero, nombre_r_social,
        nombre_comercial, tipo_razon, nif, telefono01, telefono02,
        telefax, dir_nombre, dir_localidad, id_local, email, web,cliente,origen_contacto) /*sfg.albert*/
      values (:id_contacto, :id_contacto, :tercero, :nombre_r_social,
        :nombre_comercial, :tipo_razon, :nif, :telefono01, :telefono02,
        :telefax, :dir_nombre, :dir_localidad, :id_local, :email, :web,:cliente,'DES');

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
/* Date: 03-sep-2008   User: SYSDBA                                           */
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
declare variable direc_tipo       char(3); /*sfg.albert*/
declare variable titulo_direccio    char(20); /*sfg.albert*/
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
    /*select SUBSTR(dir_completa_n,1,60), dir_localidad, id_local, dir_tipo*/
      select SUBSTR(dir_nombre,1,40), dir_localidad, id_local, dir_tipo
      from sys_terceros_direcciones
      where tercero=:tercero and dir_defecto=1
      into :dir_nombre, :dir_localidad, :id_local, :direc_tipo;
   /*sfg.albert*/   
   select SUBSTR(titulo,1,20) from sys_tipo_direccion
   where tipo=:direc_tipo
   into :titulo_direccio;    
   
   dir_nombre=titulo_direccio||' '||dir_nombre;  /*sfg.albert*/

    id_contacto = gen_id(CRM_ID_CONTACTOS, 1);
    insert into crm_contactos (id_contacto, num_contacto, tercero, nombre_r_social,
        nombre_comercial, tipo_razon, nif, telefono01, telefono02,
        telefax, dir_nombre, dir_localidad, id_local, email, web,origen_contacto)
      values (:id_contacto, :id_contacto, :tercero, :nombre_r_social,
        :nombre_comercial, :tipo_razon, :nif, :telefono01, :telefono02,
        :telefax, :dir_nombre, :dir_localidad, :id_local, :email, :web,'DES');

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
