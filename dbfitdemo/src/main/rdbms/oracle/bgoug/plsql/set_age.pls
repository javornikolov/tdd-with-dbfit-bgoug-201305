create or replace procedure set_age( p_age integer )
is
begin
	if ( p_age <= 0 )
	then
		raise_application_error( -20013, 'Invalid age argument' );
	end if;
end set_age;
/

