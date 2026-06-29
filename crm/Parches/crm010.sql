/*======================================================================================*/
/*   Script File                                                              			*/
/*                                                                            			*/
/*   Date    : 25-Ago-2008                                                    			*/
/*   Creator : Victor                                                         			*/
/*   Desc    : Parxe per importar els contactes de tercers				        */
/*======================================================================================*/


execute procedure s_ajustes ('CRM',010,'Modulo CRM');
commit Work;

set term ^;
commit work^




ALTER PROCEDURE CRM_IMPORTA_TERCEROS 
returns (num integer)
as
declare variable tercero integer;
declare variable nombre_r_social varchar(60);
declare variable nombre_comercial varchar(60);
declare variable tipo_razon varchar(4);
declare variable nif varchar(20);
declare variable telefono01 varchar(20);
declare variable telefono02 varchar(20);
declare variable telefax varchar(20);
declare variable email varchar(40);
declare variable web varchar(40);
declare variable dir_nombre varchar(60);
declare variable dir_localidad char(8);
declare variable id_local integer;
declare variable id_contacto integer;
declare variable empresa integer;
declare variable agente integer;
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
        telefax, dir_nombre, dir_localidad, id_local, email, web, origen_contacto /*SFG_VICTOR*/)
      values (:id_contacto, :id_contacto, :tercero, :nombre_r_social,
        :nombre_comercial, :tipo_razon, :nif, :telefono01, :telefono02,
        :telefax, :dir_nombre, :dir_localidad, :id_local, :email, :web, 'DES' /*SFG_VICTOR*/);

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

commit work^


