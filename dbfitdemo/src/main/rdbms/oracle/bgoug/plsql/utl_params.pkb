create or replace package body utl_params
is
	function get_parameters( p_num_params integer ) return T_REFC_PARAMETERS
	is
		v_crs_params T_REFC_PARAMETERS;
	begin
		for i in 1..p_num_params
		loop
			insert into parameters( id, name, value )
			values ( i, 'param ' || i, 'value' || i );
		end loop;

		open v_crs_params for select * from parameters order by id;

		return v_crs_params;
	end get_parameters;

end utl_params;
/

