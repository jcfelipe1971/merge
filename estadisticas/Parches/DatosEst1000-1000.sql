/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 06-may-2005                                                    */
/*   Creator : JLA                                                            */
/*   Descrip.: Estadistica 1000: Estadistiques especials a partir del 1000.   */
/*============================================================================*/

/*============================================================================*/
/* Date: 06-may-2005   User: SYSDBA                                           */
/*----------------------------------------------------------------------------*/
insert into est_grupos (GRUPO, TITULO) values (1000, 'Estadisticas Especiales');
commit work;

insert into est_estadisticas (ESTADISTICA, GRUPO, TITULO, CLAVE_1) 
values (1000, 1000, 'Estadisticas Especiales', '');
commit work;
/*============================================================================*/