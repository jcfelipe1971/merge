/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip.: Consulta de la estadistica 30: Ventas por Provincia.           */
/*============================================================================*/

/*============================================================================*/
/* Date: 06-may-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
insert into est_grupos(GRUPO, TITULO) values (30, 'Ventas por Provincia');
commit work;

insert into est_estadisticas (ESTADISTICA, GRUPO, TITULO, NUM_CLAVES, CLAVES, ACUMULADOS,
  TABLAS, CLAVE_1, TITULO_1, DESC_CLAVE_1, TITULO_DESC_1,
  EMPRESA, EJERCICIO, CANAL, SERIE, ORDEN_TOTAL) 
values (30, 30, 'Ventas por Provincia', 1, 'cab.fecha', 'sum(cab.s_bases)',
  'ver_cabeceras_factura cab
  join sys_terceros_direcciones dir on (cab.tercero=dir.tercero) and (cab.direccion=dir.direccion)
  join sys_localidades loc on (dir.id_local=loc.id_local)', 
  'dir.id_local', 'Id', 'loc.titulo', 'Provincia',
  0,0,0,'TODAS',2);
commit work;

/*============================================================================*/


