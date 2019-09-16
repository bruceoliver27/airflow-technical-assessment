create table if not exists ft_db_{{ params.env }}.raw_stage.highwinds_int (
  date string,
  time string,
  cs_method string,
  c_ip string,
  cs_version string,
  cs_referrer string,
  cs_user_agent string,
  filesize string,
  cs_bytes string,
  sc_bytes string,
  s_ip string,
  time_taken string,
  sc_status string,
  cs_uri_query string,
  cs_uri_stem string,
  x_byte_range string,
  comment string,
  cs_host string,
  file_source string,
  load_timestamp timestamp,
  run_datehour bigint
)
;

---

begin name load_rl_highwinds_int_{{ execution_date.strftime("%Y%m%d%H") }};

---

delete from ft_db_{{ params.env }}.raw_stage.highwinds_int
where run_datehour between {{ (execution_date - macros.timedelta(hours=1)).strftime("%Y%m%d%H") }}::bigint and {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

copy into ft_db_{{ params.env }}.raw_stage.highwinds_int from (
  select distinct
    t.$1 as date,
    t.$2 as time,
    t.$3 as cs_method,
    t.$4 as c_ip,
    t.$5 as cs_version,
    t.$6 as cs_referrer,
    t.$7 as cs_user_agent,
    t.$8 as filesize,
    t.$9 as cs_bytes,
    t.$10 as sc_bytes,
    t.$11 as s_ip,
    t.$12 as time_taken,
    t.$13 as sc_status,
    t.$14 as cs_uri_query,
    t.$15 as cs_uri_stem,
    t.$16 as x_byte_range,
    t.$17 as comment,
    t.$18 as cs_host,
    metadata$filename as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    regexp_replace(metadata$filename,'.*highwinds\/int\/([0-9]{8})\/([0-9]{2})\/log.*','\\1\\2') as run_datehour
  from @raw_stage.ft_stage_adserve_logs_{{ params.env }}/highwinds/int/{{ (execution_date - macros.timedelta(hours=1)).strftime("%Y%m%d/%H") }}/log/ t
)
file_format = raw_stage.ft_log_csv_highwinds_format
force = true
on_error = skip_file_2
;

---

copy into ft_db_{{ params.env }}.raw_stage.highwinds_int from (
  select distinct
    t.$1 as date,
    t.$2 as time,
    t.$3 as cs_method,
    t.$4 as c_ip,
    t.$5 as cs_version,
    t.$6 as cs_referrer,
    t.$7 as cs_user_agent,
    t.$8 as filesize,
    t.$9 as cs_bytes,
    t.$10 as sc_bytes,
    t.$11 as s_ip,
    t.$12 as time_taken,
    t.$13 as sc_status,
    t.$14 as cs_uri_query,
    t.$15 as cs_uri_stem,
    t.$16 as x_byte_range,
    t.$17 as comment,
    t.$18 as cs_host,
    metadata$filename as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    regexp_replace(metadata$filename,'.*highwinds\/int\/([0-9]{8})\/([0-9]{2})\/log.*','\\1\\2') as run_datehour
  from @raw_stage.ft_stage_adserve_logs_{{ params.env }}/highwinds/int/{{ execution_date.strftime("%Y%m%d/%H") }}/log/ t
)
file_format = raw_stage.ft_log_csv_highwinds_format
force = true
on_error = skip_file_2
;

---

commit;
