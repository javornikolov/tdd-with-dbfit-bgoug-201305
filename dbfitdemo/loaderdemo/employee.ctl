options
(
-- parallel = true,
readsize = 12000,
bindsize = 12000,
rows = 75000,
-- direct = true
)
load data
infile 'employee.txt'
append
into table employee
fields terminated by ","
( id, name, dept, salary )

