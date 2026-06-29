/*============================================================================*/
/*   Script File                                                              */
/*                                                                            */
/*   Date    : 09-set-2008                                                    */
/*   Creator : Victor                                                         */
/*   Desc: Ampliacio del tamany de caracters en el e-mail */
/*============================================================================*/


execute procedure s_ajustes ('CRM',009,'Modulo CRM');
commit Work;


set term ^; 
commit work^

/* SFG_VICTOR INICI ampliacio sutil del tamany (dels caracters) dels emails */
update rdb$fields set rdb$null_flag = 1 where rdb$field_name = 'EMAILS'^
commit work^

update rdb$fields set rdb$field_type = 37, rdb$field_length = 50, rdb$field_scale = 0 where rdb$field_name = 'EMAILS'^
commit work^
/* SFG_VICTOR FINAL ampliacio sutil del tamany (dels caracters) dels emails */
