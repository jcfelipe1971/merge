/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip.: Consulta de la estadistica 10: Ventas por Cliente.             */
/*============================================================================*/

/*============================================================================*/
/* Date: 06-may-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
insert into est_grupos(GRUPO, TITULO) values (10, 'Ventas por Cliente');
commit work;

insert into est_estadisticas (ESTADISTICA, GRUPO, TITULO, NUM_CLAVES, CLAVES, ACUMULADOS,
  TABLAS, CLAVE_1, TITULO_1, DESC_CLAVE_1, TITULO_DESC_1,
  EMPRESA, EJERCICIO, CANAL, SERIE, ORDEN_TOTAL) 
values (10, 10, 'Ventas por Cliente', 1, 'cab.fecha', 'sum(cab.s_bases)',
  'ver_cabeceras_factura cab', 
  'cab.cliente', 'Cliente', 'cab.titulo', 'Nombre Fiscal',
  0,0,0,'TODAS',2);
commit work;

/*============================================================================*/


