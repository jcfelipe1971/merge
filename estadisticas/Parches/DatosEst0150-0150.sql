/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip.: Consulta de la estadistica 150: Compras por Familia.           */
/*============================================================================*/

/*============================================================================*/
/* Date: 06-may-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
insert into est_grupos(GRUPO, TITULO) values (150, 'Compras por Familia');
commit work;

insert into est_estadisticas (ESTADISTICA, GRUPO, TITULO, NUM_CLAVES, CLAVES, ACUMULADOS,
  TABLAS, CLAVE_1, TITULO_1, DESC_CLAVE_1, TITULO_DESC_1,
  EMPRESA, EJERCICIO, CANAL, SERIE, ORDEN_TOTAL) 
values (150, 150, 'compras por Familia', 1, 'cab.fecha', 'sum(det.b_imponible)',
  'ver_cabeceras_factura_prov cab
  join ver_detalle_factura_prov det on (det.id_e=cab.id_e)
  join art_articulos art on (det.id_a=art.id_a)
  join art_familias fam on (art.empresa=fam.empresa and art.familia=fam.familia)', 
  'art.familia', 'Familia', 'fam.titulo', 'Descripcion',
  0,0,0,'TODAS',2);
commit work;

/*============================================================================*/
