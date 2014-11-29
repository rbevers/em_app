do
$body$
begin
  if not exists(select * from pg_catalog.pg_user where usename='em_app') then
    create role em_app with createuser login;
  end if;
end
$body$
