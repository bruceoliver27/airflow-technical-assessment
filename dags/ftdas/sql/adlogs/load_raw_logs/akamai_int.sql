create table if not exists ft_db_{{ params.env }}.raw_stage.aco (
  host string,
  ident string,
  authuser string,
  date string,
  request string,
  status string,
  bytes string,
  unknown_1 string,
  agent string,
  unknown_2 string,
  file_source string,
  load_timestamp timestamp,
  run_datehour bigint
)
;

---

begin name load_rl_akamai_int_{{ execution_date.strftime("%Y%m%d%H") }};

---

delete from ft_db_{{ params.env }}.raw_stage.aco
where run_datehour between {{ (execution_date - macros.timedelta(hours=2)).strftime("%Y%m%d%H") }}::bigint and {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

copy into ft_db_dev.raw_stage.aco from (
select distinct
  t.$1 as host,
  t.$2 as ident,
  t.$3 as authuser,
  concat(t.$4,' ',t.$5) as date,
  t.$6 as request,
  t.$7 as status,
  t.$8 as bytes,
  t.$9 as unknown_1,
  t.$10 as agent,
  t.$11 as unknown_2,
  metadata$filename as file_source,
  convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
  regexp_substr(metadata$filename,'.*([0-9]{10})[0-9]{2}-[0-9]{4}-[0-9]{1,2}\.gz',1,1,'e') as run_datehour
  from @raw_stage.ft_stage_adserve_logs_{{ params.env }}/akamai/int/{{ (execution_date - macros.timedelta(hours=2)).strftime("%Y%m%d/%H") }}/log/ t
)
pattern = '.*[0-9]{12}-[0-9]{4}-[0-9]{1,2}\.gz'
file_format = raw_stage.ft_log_csv_aco_format
force = true
;

---

copy into ft_db_dev.raw_stage.aco from (
select distinct
  t.$1 as host,
  t.$2 as ident,
  t.$3 as authuser,
  concat(t.$4,' ',t.$5) as date,
  t.$6 as request,
  t.$7 as status,
  t.$8 as bytes,
  t.$9 as unknown_1,
  t.$10 as agent,
  t.$11 as unknown_2,
  metadata$filename as file_source,
  convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
  regexp_substr(metadata$filename,'.*([0-9]{10})[0-9]{2}-[0-9]{4}-[0-9]{1,2}\.gz',1,1,'e') as run_datehour
  from @raw_stage.ft_stage_adserve_logs_{{ params.env }}/akamai/int/{{ (execution_date - macros.timedelta(hours=1)).strftime("%Y%m%d/%H") }}/log/ t
)
pattern = '.*[0-9]{12}-[0-9]{4}-[0-9]{1,2}\.gz'
file_format = raw_stage.ft_log_csv_aco_format
force = true
;

---

copy into ft_db_dev.raw_stage.aco from (
select distinct
  t.$1 as host,
  t.$2 as ident,
  t.$3 as authuser,
  concat(t.$4,' ',t.$5) as date,
  t.$6 as request,
  t.$7 as status,
  t.$8 as bytes,
  t.$9 as unknown_1,
  t.$10 as agent,
  t.$11 as unknown_2,
  metadata$filename as file_source,
  convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
  regexp_substr(metadata$filename,'.*([0-9]{10})[0-9]{2}-[0-9]{4}-[0-9]{1,2}\.gz',1,1,'e') as run_datehour
  from @raw_stage.ft_stage_adserve_logs_{{ params.env }}/akamai/int/{{ execution_date.strftime("%Y%m%d/%H") }}/log/ t
)
pattern = '.*[0-9]{12}-[0-9]{4}-[0-9]{1,2}\.gz'
file_format = raw_stage.ft_log_csv_aco_format
force = true
;

---

commit;
