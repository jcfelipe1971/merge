/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 16-des-2009                                                   */
/*   Creator : Ruth                                                         */
/*  Desc.: Es fa un llistat on surten totes les dades detallades del client,contacte */
/*============================================================================*/
execute procedure s_ajustes ('CRM',018,'Modulo CRM');
Commit Work;



/*============================================================================*/

insert into dic_listados_grupos(GRUPO,TITULO,LISTADODEF,COPIAS,PIJAMA,LISTADODEFMAIL)
values (8205,'Listado Contacto Detalle',8205,1,0,0);
commit work;

insert into dic_listados(LISTADO, GRUPO, TITULO, EDITABLE, CABECERA, TIPO)
values (8205, 8205, 'Listado Contacto Detalle', 1, 1000, 'FRF');
commit work;



