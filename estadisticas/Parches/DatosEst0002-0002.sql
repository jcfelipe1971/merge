/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip.: Consulta de la estadistica 2: Movimientos contables.           */
/*============================================================================*/

/*============================================================================*/
/* Date: 06-may-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
insert into est_grupos (GRUPO, TITULO) values (2, 'Movimientos contables');
commit work;

insert into est_estadisticas (ESTADISTICA, GRUPO, TITULO, NUM_CLAVES, CLAVES, ACUMULADOS,
  TABLAS, CLAVE_1, TITULO_1, DESC_CLAVE_1, TITULO_DESC_1,
  EMPRESA, EJERCICIO, CANAL, SERIE, ORDEN_TOTAL) 
values (2, 2, 'Movimientos contables', 1, 'asi.fecha', 'sum(ap.importe)',
'con_cuentas_apuntes ap
join con_cuentas cu on 
  (ap.empresa=cu.empresa and ap.ejercicio=cu.ejercicio and
   ap.canal=cu.canal and ap.cuenta=cu.cuenta)', 
  'ap.cuenta', 'Cuenta', 'cu.titulo', 'Descripcion',
  0,0,0,'TODAS',0);
commit work;

/*============================================================================*/


