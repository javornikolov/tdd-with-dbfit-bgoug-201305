create or replace package time_machine
is
	-- Set current time
	procedure set_time( p_date date );

	procedure reset_time;

end time_machine;
/

