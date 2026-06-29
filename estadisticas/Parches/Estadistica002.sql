/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 02-nov-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip : Noves camps pel generador d'estadistiques.                     */
/*============================================================================*/

execute procedure s_ajustes ('EST',2,'Estadistiques');
Commit Work;


/*============================================================================*/
/* Date: 02-nov-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
alter table EST_ESTADISTICAS add campo_aux_1 Z_DIC_NOMBRES_NULL;
alter table EST_ESTADISTICAS add tit_campo_aux_1 TITULOS_25;
alter table EST_ESTADISTICAS add campo_aux_2 Z_DIC_NOMBRES_NULL;
alter table EST_ESTADISTICAS add tit_campo_aux_2 TITULOS_25;
alter table EST_ESTADISTICAS add campo_aux_3 Z_DIC_NOMBRES_NULL;
alter table EST_ESTADISTICAS add tit_campo_aux_3 TITULOS_25;
alter table EST_ESTADISTICAS add campo_aux_4 Z_DIC_NOMBRES_NULL;
alter table EST_ESTADISTICAS add tit_campo_aux_4 TITULOS_25;
alter table EST_ESTADISTICAS add campo_aux_5 Z_DIC_NOMBRES_NULL;
alter table EST_ESTADISTICAS add tit_campo_aux_5 TITULOS_25;
commit work;

alter table EST_ESTADISTICAS_GRUPO add campo_aux_1 TEXTOS_LARGOS;
alter table EST_ESTADISTICAS_GRUPO add campo_aux_2 TEXTOS_LARGOS;
alter table EST_ESTADISTICAS_GRUPO add campo_aux_3 TEXTOS_LARGOS;
alter table EST_ESTADISTICAS_GRUPO add campo_aux_4 TEXTOS_LARGOS;
alter table EST_ESTADISTICAS_GRUPO add campo_aux_5 TEXTOS_LARGOS;
commit work;

/*============================================================================*/


/*============================================================================*/
/* Date: 03-nov-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
set term ^;

alter procedure est_duplica_estadistica (GRUPO smallint, ESTADISTICA smallint)
as
declare variable titulo        varchar(60);
declare variable claves        blob;
declare variable acumulados    blob;
declare variable tablas        blob;
declare variable reglas        blob;
declare variable clave_1       varchar(31);
declare variable clave_2       varchar(31);
declare variable clave_3       varchar(31);
declare variable titulo_1      varchar(25);
declare variable titulo_2      varchar(25);
declare variable titulo_3      varchar(25);
declare variable desc_clave_1  varchar(31);
declare variable desc_clave_2  varchar(31);
declare variable desc_clave_3  varchar(31);
declare variable titulo_desc_1 varchar(25);
declare variable titulo_desc_2 varchar(25);
declare variable titulo_desc_3 varchar(25);
declare variable campo_aux_1   varchar(25);
declare variable campo_aux_2   varchar(25);
declare variable campo_aux_3   varchar(25);
declare variable campo_aux_4   varchar(25);
declare variable campo_aux_5   varchar(25);
declare variable tit_campo_aux_1 varchar(31);
declare variable tit_campo_aux_2 varchar(31);
declare variable tit_campo_aux_3 varchar(31);
declare variable tit_campo_aux_4 varchar(31);
declare variable tit_campo_aux_5 varchar(31);
declare variable num_claves    smallint;
declare variable contador      smallint;
declare variable empresa       smallint;
declare variable ejercicio     smallint;
declare variable canal         smallint;
declare variable serie         varchar(10);
declare variable orden_total   smallint;
begin
  select titulo, claves, acumulados, tablas, reglas,
         clave_1, titulo_1, desc_clave_1, titulo_desc_1,
         clave_2, titulo_2, desc_clave_2, titulo_desc_2,
         clave_3, titulo_3, desc_clave_3, titulo_desc_3,
         campo_aux_1, campo_aux_2, campo_aux_3, campo_aux_4, campo_aux_5,
         tit_campo_aux_1, tit_campo_aux_2, tit_campo_aux_3, tit_campo_aux_4, tit_campo_aux_5,
         num_claves, empresa, ejercicio, canal, serie, orden_total
    from est_estadisticas
    where estadistica=:estadistica and grupo=:grupo
    into :titulo, :claves, :acumulados, :tablas, :reglas,
       :clave_1, :titulo_1, :desc_clave_1, :titulo_desc_1,
       :clave_2, :titulo_2, :desc_clave_2, :titulo_desc_2,
       :clave_3, :titulo_3, :desc_clave_3, :titulo_desc_3,
       :campo_aux_1, :campo_aux_2, :campo_aux_3, :campo_aux_4, :campo_aux_5,
       :tit_campo_aux_1, :tit_campo_aux_2, :tit_campo_aux_3, :tit_campo_aux_4, :tit_campo_aux_5,       
       :num_claves, :empresa, :ejercicio, :canal, :serie, :orden_total;

  select max(estadistica) from est_estadisticas
    into :contador;

  contador=contador+1;

  insert into est_estadisticas (estadistica, grupo, titulo, num_claves,
          claves, acumulados, tablas, reglas,
          clave_1, clave_2, clave_3, titulo_1, titulo_2, titulo_3,
          desc_clave_1, desc_clave_2, desc_clave_3,
          titulo_desc_1, titulo_desc_2, titulo_desc_3,
          empresa, ejercicio, canal, serie, orden_total,
          campo_aux_1, campo_aux_2, campo_aux_3, campo_aux_4, campo_aux_5,
          tit_campo_aux_1, tit_campo_aux_2, tit_campo_aux_3, tit_campo_aux_4, tit_campo_aux_5)
  values (:contador, :grupo, :titulo, :num_claves,
          :claves, :acumulados, :tablas, :reglas,
          :clave_1, :clave_2, :clave_3, :titulo_1, :titulo_2, :titulo_3,
          :desc_clave_1, :desc_clave_2, :desc_clave_3,
          :titulo_desc_1, :titulo_desc_2, :titulo_desc_3,
          :empresa, :ejercicio, :canal, :serie, :orden_total,
          :campo_aux_1, :campo_aux_2, :campo_aux_3, :campo_aux_4, :campo_aux_5,
          :tit_campo_aux_1, :tit_campo_aux_2, :tit_campo_aux_3, :tit_campo_aux_4, :tit_campo_aux_5);
end
^

set term ;^

commit work;

/*============================================================================*/
