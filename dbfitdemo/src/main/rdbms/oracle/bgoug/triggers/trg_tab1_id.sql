create or replace trigger trg_tab1_id
before insert on tab1
for each row
begin
	:new.id := tab1_seq.nextval;
end trg_tab1_id;
/

