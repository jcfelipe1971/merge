/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip.: Consulta de la estadistica 1: Clientes ordenados por ventas.   */
/*============================================================================*/

/*============================================================================*/
/* Date: 06-may-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
insert into est_grupos (GRUPO, TITULO) values (1, 'Ventas por Clientes');
commit work;

insert into est_estadisticas (ESTADISTICA, GRUPO, TITULO, NUM_CLAVES, CLAVES, ACUMULADOS,
  TABLAS, CLAVE_1, TITULO_1, DESC_CLAVE_1, TITULO_DESC_1,
  EMPRESA, EJERCICIO, CANAL, SERIE, ORDEN_TOTAL) 
values (1, 1, 'Clientes ordenados por ventas', 1, 'cab.fecha', 'sum(cab.total_a_cobrar)',
  'ver_cabeceras_factura cab', 'cab.cliente', 'Cliente', 'cab.titulo', 'Nombre Fiscal',
  0,0,0,'TODAS',2);
commit work;

/*============================================================================*/
