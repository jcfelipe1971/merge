/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 03-feb-2009                                                    */
/*   Creator : Albert                                                          */
/*   Descrip.: Desenvolupament de ambito i de l'assistent d'importacio contactes del crm       */
/*============================================================================*/
execute procedure s_ajustes ('CRM',014,'Modulo CRM');
commit Work;


CREATE TABLE CRM_AMBITOS_CONTACTO (
    ID_CRM_CONTACTO CONTADORES,
    ID_CRM_AMBITO CONTADORES);
commit work;

alter table CRM_AMBITOS_CONTACTO
add constraint PK_CRM_AMBITOS_CONTACTO
primary key (ID_CRM_CONTACTO,ID_CRM_AMBITO);
commit work;


SET TERM ^ ;

ALTER TRIGGER crm_sys_ambitos_bu0
active before update position 0
as
begin
/*  if (old.ambito = 0) then exception ERR_INTEGRIDAD;*/
  if (new.descripcion <= '') then exception ERR_NO_NOMBRE;
  new.ambito = old.ambito;
end
^

SET TERM ; ^
commit work;

SET TERM ^ ;

ALTER TRIGGER crm_sys_ambitos_bd0
active before delete position 0
as
begin
 /* if (old.ambito = 0) then exception ERR_INTEGRIDAD;*/
end
^

SET TERM ; ^
commit work;

/*****************************************************/
CREATE TABLE CRM_TMP_IMPORTAR_CONTACTOS (
    ENTRADA           CONTADORES /* CONTADORES = INTEGER default 0 NOT NULL */,
    LINEA             CONTADORES /* CONTADORES = INTEGER default 0 NOT NULL */,
    EMPRESA           EMPRESAS /* EMPRESAS = SMALLINT default 0 NOT NULL check (value>=0) */,
    NOMBRE_CONTACTO   TITULOS_LARGOS_IND /* TITULOS_LARGOS_IND = VARCHAR(60) default '' NOT NULL */,
    CODIGO_POSTAL     LOCALIDADES /* LOCALIDADES = CHAR(8) default '99999999' NOT NULL check (Value not containing ' ') */,
    DIRECCION         TITULOS_LARGOS_IND /* TITULOS_LARGOS_IND = VARCHAR(60) default '' NOT NULL */,
    PERSONA_CONTACTO  TITULOS_40 /* TITULOS_40 = VARCHAR(40) default '' NOT NULL */,
    OBSERVACIONES     APUNTES /* APUNTES = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    TELEFONO1         TELEFONOS /* TELEFONOS = VARCHAR(15) default '' NOT NULL */,
    TELEFONO2         TELEFONOS /* TELEFONOS = VARCHAR(15) default '' NOT NULL */,
    EMAIL             EMAILS /* EMAILS = VARCHAR(40) default '' NOT NULL */,
    WEB               TITULOS_LARGOS_IND /* TITULOS_LARGOS_IND = VARCHAR(60) default '' NOT NULL */,
    IMPORTAR          LOGICO /* LOGICO = SMALLINT default 0 NOT NULL check (value in(0,1)) */
);
commit work;

alter table CRM_TMP_IMPORTAR_CONTACTOS
add constraint PK_CRM_TMP_IMPORTAR_CONTACTOS
primary key (ENTRADA,LINEA);
commit work;