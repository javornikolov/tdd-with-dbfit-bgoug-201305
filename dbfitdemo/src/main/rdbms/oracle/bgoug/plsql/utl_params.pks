create or replace package utl_params
is
	type T_REFC_PARAMETERS is ref cursor return parameters%rowtype;

	function get_parameters( p_num_params integer ) return T_REFC_PARAMETERS;

end utl_params;
/

