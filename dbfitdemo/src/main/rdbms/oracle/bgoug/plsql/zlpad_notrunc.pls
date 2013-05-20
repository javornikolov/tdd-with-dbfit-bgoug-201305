create or replace function zlpad_notrunc( p_str varchar2, p_padded_len integer )
return varchar2
is
begin
	if ( p_str is null and p_padded_len > 0 )
	then
		return lpad( '0', p_padded_len, '0' );
	elsif ( length( p_str ) >= p_padded_len )
	then
		return p_str;
	else
		return lpad( p_str, p_padded_len, '0' );
	end if;
end zlpad_notrunc;
/

