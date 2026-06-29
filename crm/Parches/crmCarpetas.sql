/*======================================================================================*/
/*   Script File                                                              			*/
/*                                                                            			*/
/*   Date    : 01-Ago-2008                                                    			*/
/*   Creator : Victor                                                         			*/
/*   Desc:   parxe especial per treballar amb carpetes, tret del parxe pro201.sql		*/
/*======================================================================================*/

set term ^; 
commit work^

create domain TITULOS_LARGOS_NULL as varchar(100) default ''^
commit work^

create table pro_carpetas(
     ID CONTADORES,
     LINEA CONTADORES,
     TIPO TIPOS_MOVIMIENTOS,
     ID_REGISTRO CONTADORES,
     RUTA TEXTOS_MAS_LARGOS,
     DESCRIPCION TITULOS_LARGOS_NULL)^
commit work^

alter table PRO_CARPETAS add constraint PK_PRO_CARPETAS primary key (ID)^
commit work^

create generator pro_gen_id_carpetas^
commit work^

create trigger PRO_CARPETAS_BI0 for PRO_CARPETAS active before insert position 0
as
begin
  /*sfg.albert - Es genera el ID unic per la carpeta*/
     if (new.id=0 or new.id is null) then
        new.id=gen_id(pro_gen_id_carpetas,1);
end
^

commit work^


