/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 26-gen-2009                                                    */
/*   Creator : Ruben                                                          */
/*   Descrip.: Es crea una vista pq surti la localitat, cp , pais i prov a taula */
/*============================================================================*/
execute procedure s_ajustes ('CRM',012,'Modulo CRM');
commit Work;

/*============================================================================*/


/*============================================================================*/
/* Date: 26-gen-2009   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
create view crm_ver_contactos (
 ID_CONTACTO , 
 NUM_CONTACTO , 
 FECHA_ALTA , 
 TERCERO , 
 NOMBRE_R_SOCIAL , 
 NOMBRE_COMERCIAL ,
 NOMBRE_CORTO , 
 TIPO_RAZON ,
 NIF ,
 TELEFONO01 ,
 TELEFONO02 ,
 TELEFAX , 
 DIR_NOMBRE , 
 DIR_LOCALIDAD ,
 ID_LOCAL , 
 EMAIL , 
 WEB , 
 NOTAS , 
 COMENTARIO ,
 CLIENTE , 
 RUTA_IMAGEN ,
 ORIGEN_CONTACTO ,
 LINK_GOOGLE ,
 ACTIVITAT_ECONOMICA ,
 AMBITO,
 TITULO ,
 CODPOSTAL,
 PROVINCIA,
 PAIS ) as
SELECT
     CON.ID_CONTACTO , CON.NUM_CONTACTO , CON.FECHA_ALTA , CON.TERCERO , CON.NOMBRE_R_SOCIAL , CON.NOMBRE_COMERCIAL ,
     CON.NOMBRE_CORTO , TIPO_RAZON ,CON.NIF ,CON.TELEFONO01 ,CON.TELEFONO02 ,CON.TELEFAX , CON.DIR_NOMBRE , CON.DIR_LOCALIDAD ,
     CON.ID_LOCAL , CON.EMAIL , CON.WEB , CON.NOTAS , CON.COMENTARIO ,CON.CLIENTE , CON.RUTA_IMAGEN ,CON.ORIGEN_CONTACTO ,
     CON.LINK_GOOGLE ,CON.ACTIVITAT_ECONOMICA ,CON.AMBITO,LOC.TITULO AS LOCALIDAD,LOC.CODPOSTAL,LOC.PROVINCIA,LOC.PAIS
     FROM CRM_CONTACTOS CON
     left join VER_LOCALIDADES LOC 
     ON (CON.DIR_LOCALIDAD=LOC.LOCALIDAD);
commit work;
/*============================================================================*/

/*============================================================================*/
/* Date: 26-gen-2009   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_VER_CONTACTOS_BI0 for CRM_VER_CONTACTOS active before insert position 0
as
begin
   insert into crm_contactos(
     ID_CONTACTO , NUM_CONTACTO , FECHA_ALTA , TERCERO , NOMBRE_R_SOCIAL , NOMBRE_COMERCIAL ,
     NOMBRE_CORTO , TIPO_RAZON ,NIF ,TELEFONO01 ,TELEFONO02 ,TELEFAX , DIR_NOMBRE , DIR_LOCALIDAD ,
     ID_LOCAL , EMAIL , WEB , NOTAS , COMENTARIO ,CLIENTE , RUTA_IMAGEN ,ORIGEN_CONTACTO ,
     LINK_GOOGLE ,ACTIVITAT_ECONOMICA ,AMBITO)
    values(
     new.ID_CONTACTO , new.NUM_CONTACTO , new.FECHA_ALTA , new.TERCERO , new.NOMBRE_R_SOCIAL , new.NOMBRE_COMERCIAL ,
     new.NOMBRE_CORTO , new.TIPO_RAZON ,new.NIF ,new.TELEFONO01 ,new.TELEFONO02 ,new.TELEFAX , new.DIR_NOMBRE , new.DIR_LOCALIDAD ,
     new.ID_LOCAL , new.EMAIL , new.WEB , new.NOTAS , new.COMENTARIO ,new.CLIENTE , new.RUTA_IMAGEN ,new.ORIGEN_CONTACTO ,
     new.LINK_GOOGLE ,new.ACTIVITAT_ECONOMICA ,new.AMBITO    
    );

end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 26-gen-2009   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_VER_CONTACTOS_BU0 for CRM_VER_CONTACTOS active before update position 0
as
begin
UPDATE CRM_CONTACTOS
SET
  TELEFONO01=new.TELEFONO01 
  ,TELEFONO02=new.TELEFONO02 
  ,TELEFAX=new.TELEFAX 
  ,DIR_NOMBRE=new.DIR_NOMBRE 
  ,DIR_LOCALIDAD=new.DIR_LOCALIDAD 
  ,ID_LOCAL=new.ID_LOCAL 
  ,EMAIL=new.EMAIL 
  ,WEB=new.WEB 
  ,NOTAS=new.NOTAS 
  ,NUM_CONTACTO=new.NUM_CONTACTO 
  ,TERCERO=new.TERCERO 
  ,NOMBRE_R_SOCIAL=new.NOMBRE_R_SOCIAL 
  ,NOMBRE_COMERCIAL=new.NOMBRE_COMERCIAL 
  ,NOMBRE_CORTO=new.NOMBRE_CORTO 
  ,FECHA_ALTA=new.FECHA_ALTA 
  ,TIPO_RAZON=new.TIPO_RAZON 
  ,NIF=new.NIF 
  ,COMENTARIO=new.COMENTARIO
  ,CLIENTE=new.CLIENTE
  ,ORIGEN_CONTACTO=new.ORIGEN_CONTACTO
  ,LINK_GOOGLE=new.LINK_GOOGLE
  ,AMBITO=new.AMBITO
  ,ACTIVITAT_ECONOMICA=new.ACTIVITAT_ECONOMICA
WHERE
  ID_CONTACTO=new.ID_CONTACTO; 

end
^

set term ;^

commit work;

/*============================================================================*/

/*============================================================================*/
/* Date: 26-gen-2009   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

create trigger CRM_VER_CONTACTOS_BD0 for CRM_VER_CONTACTOS active before delete position 0
as
begin
DELETE FROM CRM_CONTACTOS
WHERE
  ID_CONTACTO=old.ID_CONTACTO; 

end
^

set term ;^

commit work;

/*============================================================================*/
