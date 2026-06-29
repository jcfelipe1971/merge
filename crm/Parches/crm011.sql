/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 30-set-2008                                                    */
/*   Creator : Albert                                                         */
/*   Descrip.: Es modifiquen els procediments per crear clients i tercers. Problema de  cadenes*/
/*============================================================================*/
execute procedure s_ajustes ('CRM',011,'Modulo CRM');
commit Work;


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
declare variable email            varchar(60);
declare variable web              varchar(60);
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
   select SUBSTR(titulo,1,19) from sys_tipo_direccion
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
declare variable email            varchar(60);
declare variable web              varchar(60);
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
   select SUBSTR(titulo,1,19) from sys_tipo_direccion
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

/*============================================================================*/
/* Date: 30-set-2008   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

alter procedure crm_importa_clientes (EMPRESA_CLI integer)
returns (NUM integer)
as
declare variable tercero integer;
declare variable nombre_r_social varchar(60);
declare variable nombre_comercial varchar(60);
declare variable tipo_razon varchar(4);
declare variable nif varchar(20);
declare variable telefono01 varchar(20);
declare variable telefono02 varchar(20);
declare variable telefax varchar(20);
declare variable email varchar(50);
declare variable web varchar(60);
declare variable dir_nombre varchar(60);
declare variable dir_localidad char(8);
declare variable id_local integer;
declare variable id_contacto integer;
declare variable empresa integer;
declare variable agente integer;
declare variable cliente integer;
declare variable direc_tipo char(3); /* sfg.albert */
declare variable titulo_direccio varchar(20); /* sfg.albert */
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

      execute procedure ut_trim(:dir_nombre) returning_values :dir_nombre;
      
   /*sfg.albert*/
   if (direc_tipo is not NULL) then
     begin
       select SUBSTR(titulo,1,19) from sys_tipo_direccion
       where tipo=:direc_tipo
       into :titulo_direccio;
     end
   else 
     titulo_direccio='';

   execute procedure ut_trim(:titulo_direccio) returning_values :titulo_direccio;

   dir_nombre=titulo_direccio||' '||dir_nombre;  /*sfg.albert*/


    id_contacto = gen_id(CRM_ID_CONTACTOS, 1);
    insert into crm_contactos (id_contacto, num_contacto, tercero, nombre_r_social,
        nombre_comercial, tipo_razon, nif, telefono01, telefono02,
        telefax, dir_nombre, dir_localidad, id_local, email,web,cliente,origen_contacto) /*sfg.albert*/
      values (:id_contacto, :id_contacto, :tercero, :nombre_r_social,
        :nombre_comercial, :tipo_razon, :nif, :telefono01, :telefono02,
        :telefax, :dir_nombre, :dir_localidad, :id_local, :email,:web, :cliente,'DES');

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
/* Date: 30-set-2008   User: SYSDBA                                           */
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
declare variable email            varchar(50);
declare variable web              varchar(60);
declare variable dir_nombre       varchar(60);
declare variable dir_localidad    char(8);
declare variable id_local         integer;
declare variable id_contacto      integer;
declare variable empresa          integer;
declare variable agente           integer;
declare variable direc_tipo       char(3); /*sfg.albert*/
declare variable titulo_direccio varchar(20); /* sfg.albert */
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
   if (direc_tipo is not NULL) then
     begin
       select SUBSTR(titulo,1,19) from sys_tipo_direccion
       where tipo=:direc_tipo
       into :titulo_direccio;
     end
   else 
     titulo_direccio='';

   execute procedure ut_trim(:titulo_direccio) returning_values :titulo_direccio;

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

