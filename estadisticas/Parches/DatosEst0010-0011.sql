/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip.: Consulta de la estadistica 11: Ventas por Cliente y Agente.    */
/*============================================================================*/

/*============================================================================*/
/* Date: 06-may-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
insert into est_estadisticas (ESTADISTICA, GRUPO, TITULO, NUM_CLAVES, CLAVES, ACUMULADOS,
  TABLAS, CLAVE_1, TITULO_1, DESC_CLAVE_1, TITULO_DESC_1, 
  CLAVE_2, TITULO_2, DESC_CLAVE_2, TITULO_DESC_2,
  EMPRESA, EJERCICIO, CANAL, SERIE, ORDEN_TOTAL) 
values (11, 10, 'Ventas por Cliente/Agente', 2, 'cab.fecha', 'sum(cab.s_bases)',
  'ver_cabeceras_factura cab join ver_agentes age on (cab.empresa=age.empresa and cab.agente=age.agente)', 
  'cab.cliente', 'Cliente', 'cab.titulo', 'Nombre Cliente',
  'cab.agente', 'Agente', 'age.titulo', 'Nombre Agente',
  0,0,0,'TODAS',2);
commit work;

/*============================================================================*/


