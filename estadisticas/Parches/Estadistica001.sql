/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip : Noves taules pel generador d'estadistiques.                    */
/*============================================================================*/

execute procedure s_ajustes ('EST',1,'Estadistiques');
Commit Work;


/*===========================================================================*/
/*Domain Definitions                                                         */
/*===========================================================================*/
create domain EST_CAMPOS as varchar(25) default '' not null;
create domain Z_DIC_NOMBRES_NULL as varchar(31);
create domain Z_NUM_CLAVES as integer Default 1 check (value < 4) not null;
commit work;


/*===========================================================================*/
/*Table Definitions                                                          */
/*===========================================================================*/

/*Table: EST_ESTADISTICAS*/
create table est_estadisticas(
     ESTADISTICA MINI_CONTADORES,
     GRUPO MINI_CONTADORES,
     TITULO TITULOS_LARGOS_IND,
     NUM_CLAVES Z_NUM_CLAVES,
     CLAVE_1 DIC_NOMBRES,
     TITULO_1 TITULOS_25,
     DESC_CLAVE_1 Z_DIC_NOMBRES_NULL,
     TITULO_DESC_1 TITULOS_25,
     CLAVE_2 Z_DIC_NOMBRES_NULL,
     TITULO_2 TITULOS_25,
     DESC_CLAVE_2 Z_DIC_NOMBRES_NULL,
     TITULO_DESC_2 TITULOS_25,
     CLAVE_3 Z_DIC_NOMBRES_NULL,
     TITULO_3 TITULOS_25,
     DESC_CLAVE_3 Z_DIC_NOMBRES_NULL,
     TITULO_DESC_3 TITULOS_25,
     ACUMULADOS NOTAS,
     TABLAS NOTAS,
     CLAVES NOTAS,
     REGLAS NOTAS,
     EMPRESA EMPRESAS,
     EJERCICIO EJERCICIOS,
     CANAL CANALES,
     SERIE SERIES,
     ORDEN_TOTAL MINI_CONTADORES);
commit work;



/*Table: EST_ESTADISTICAS_GRUPO*/
create table est_estadisticas_grupo(
     ESTADISTICA MINI_CONTADORES,
     GRUPO MINI_CONTADORES,
     EMPRESA EMPRESAS,
     EJERCICIO EJERCICIOS,
     CANAL CANALES,
     SERIE SERIES,
     CLAVE_1 EST_CAMPOS,
     DESC_CLAVE_1 TEXTOS_LARGOS,
     CLAVE_2 EST_CAMPOS,
     DESC_CLAVE_2 TEXTOS_LARGOS,
     CLAVE_3 EST_CAMPOS,
     DESC_CLAVE_3 TEXTOS_LARGOS,
     MES01 CANTIDADES,
     MES02 CANTIDADES,
     MES03 CANTIDADES,
     MES04 CANTIDADES,
     MES05 CANTIDADES,
     MES06 CANTIDADES,
     MES07 CANTIDADES,
     MES08 CANTIDADES,
     MES09 CANTIDADES,
     MES10 CANTIDADES,
     MES11 CANTIDADES,
     MES12 CANTIDADES);
commit work;




/*Table: EST_GRUPOS*/
create table est_grupos(
     GRUPO MINI_CONTADORES,
     TITULO TITULOS_40);
commit work;


/*===========================================================================*/
/*Stored Procedure Definitions                                               */
/*===========================================================================*/
commit work;
set term ^;

create procedure est_duplica_estadistica (GRUPO smallint, ESTADISTICA smallint)
as
begin
  exit;
end
^




commit work^
set term ;^


/*===========================================================================*/
/*Trigger Definitions                                                        */
/*===========================================================================*/
commit work;
set term ^;

create trigger est_estadisticas_bd0 for EST_ESTADISTICAS active before delete position 0 as
begin
  delete from est_estadisticas_grupo
    where estadistica=old.estadistica;
end^




create trigger est_estadisticas_bi0 for EST_ESTADISTICAS active before insert position 0 as
begin
  if ((new.estadistica is null) or (new.estadistica=0)) then
    select max(estadistica)+1 from est_estadisticas
      into new.estadistica;
      
  if ((new.serie is null) or (new.serie <= '')) then new.serie='TODAS';
end^




create trigger est_estadisticas_bu0 for EST_ESTADISTICAS active before update position 0 as
begin
  new.estadistica = old.estadistica;

  if ((new.serie is null) or (new.serie <= '')) then new.serie='TODAS';
end^




create trigger est_grupos_bd0 for EST_GRUPOS active before delete position 0 as
begin
  delete from est_estadisticas_grupo
    where grupo=old.grupo;
end^




create trigger est_grupos_bi0 for EST_GRUPOS active before insert position 0 as
begin
  if ((new.grupo is null) or (new.grupo=0)) then
    select max(grupo)+1 from est_grupos
      into new.grupo;
end^




create trigger est_grupos_bu0 for EST_GRUPOS active before update position 0 as
begin
  new.grupo=old.grupo;
end^





commit work^
set term ;^



/*===========================================================================*/
/*Stored Procedure Definitions                                               */
/*===========================================================================*/
commit work;
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
         num_claves, empresa, ejercicio, canal, serie, orden_total
    from est_estadisticas
    where estadistica=:estadistica and grupo=:grupo
    into :titulo, :claves, :acumulados, :tablas, :reglas,
       :clave_1, :titulo_1, :desc_clave_1, :titulo_desc_1, 
       :clave_2, :titulo_2, :desc_clave_2, :titulo_desc_2,
       :clave_3, :titulo_3, :desc_clave_3, :titulo_desc_3,
       :num_claves, :empresa, :ejercicio, :canal, :serie, :orden_total;
       
  select max(estadistica) from est_estadisticas
    into :contador;
    
  contador=contador+1;
  
  insert into est_estadisticas (estadistica, grupo, titulo, num_claves, 
          claves, acumulados, tablas, reglas, 
          clave_1, clave_2, clave_3, titulo_1, titulo_2, titulo_3, 
          desc_clave_1, desc_clave_2, desc_clave_3,
          titulo_desc_1, titulo_desc_2, titulo_desc_3,
          empresa, ejercicio, canal, serie, orden_total)
  values (:contador, :grupo, :titulo, :num_claves, 
          :claves, :acumulados, :tablas, :reglas,
          :clave_1, :clave_2, :clave_3, :titulo_1, :titulo_2, :titulo_3, 
          :desc_clave_1, :desc_clave_2, :desc_clave_3,
          :titulo_desc_1, :titulo_desc_2, :titulo_desc_3, 
          :empresa, :ejercicio, :canal, :serie, :orden_total);
end
^




commit work^
set term ;^


/*===========================================================================*/
/*Table Constraints                                                          */
/*===========================================================================*/
/*===========================================================================*/
/*Table Primary Key Definitions                                              */
/*===========================================================================*/
alter table est_estadisticas add constraint PK_EST_ESTADISTICAS primary key (ESTADISTICA);
alter table est_grupos add constraint PK_EST_GRUPOS primary key (GRUPO);
commit work;

/*===========================================================================*/
/*Table Foreign Key Definitions                                              */
/*===========================================================================*/
alter table est_estadisticas add constraint FK_EST_ESTADISTICAS_GRP foreign key (GRUPO) references EST_GRUPOS(GRUPO);
commit work;

alter table est_estadisticas_grupo add constraint FK_EST_ESTADISTICAS_GRUPO_EST foreign key (ESTADISTICA) references EST_ESTADISTICAS(ESTADISTICA);
alter table est_estadisticas_grupo add constraint FK_EST_ESTADISTICAS_GRUPO_GRP foreign key (GRUPO) references EST_GRUPOS(GRUPO);
commit work;



/*============================================================================*/
/* Date: 06-may-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
insert into dic_listados_grupos (GRUPO, TITULO, LISTADODEF, COPIAS) 
  values (7000, 'Listado de estadisticas por meses', 7000, 1);
insert into dic_listados_grupos (GRUPO, TITULO, LISTADODEF, COPIAS) 
  values (7001, 'Listado de estadisticas por periodo', 7001, 1);
insert into dic_listados_grupos (GRUPO, TITULO, LISTADODEF, COPIAS) 
  values (7002, 'Listado de comparacion de estadisticas', 7002, 1);
commit work;

insert into dic_listados (LISTADO, GRUPO, TITULO, EDITABLE, CABECERA, TIPO)
  values (7000, 7000, 'Listado de estadistica por meses', 1, 1000, 'FRF');
insert into dic_listados (LISTADO, GRUPO, TITULO, EDITABLE, CABECERA, TIPO)
  values (7001, 7001, 'Listado de estadistica por periodo', 1, 1000, 'FRF');
insert into dic_listados (LISTADO, GRUPO, TITULO, EDITABLE, CABECERA, TIPO)
  values (7002, 7002, 'Listado de comparacion de estadisticas', 1, 1000, 'FRF');    
commit work;
/*============================================================================*/

