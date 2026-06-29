/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip.: Consulta de la estadistica 13: Ventas por Cliente y Familias.  */
/*============================================================================*/

/*============================================================================*/
/* Date: 06-may-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
insert into est_estadisticas (ESTADISTICA, GRUPO, TITULO, NUM_CLAVES, CLAVES, ACUMULADOS,
  TABLAS, CLAVE_1, TITULO_1, DESC_CLAVE_1, TITULO_DESC_1, 
  CLAVE_2, TITULO_2, DESC_CLAVE_2, TITULO_DESC_2,
  EMPRESA, EJERCICIO, CANAL, SERIE, ORDEN_TOTAL) 
values (13, 10, 'Ventas por Cliente/Familia', 2, 'cab.fecha', 'sum(cab.s_bases)',
  'ver_cabeceras_factura cab
  join ver_detalle_factura det on (det.id_s=cab.id_s)
  join art_articulos art on (det.id_a=art.id_a)
  join art_familias fam on (art.empresa=fam.empresa and art.familia=fam.familia) ', 
  'cab.cliente', 'Cliente', 'cab.titulo', 'Nombre Cliente',
  'fam.familia', 'Familia', 'fam.titulo', 'Descripcion Familia',
  0,0,0,'TODAS',2);
commit work;

/*============================================================================*/


