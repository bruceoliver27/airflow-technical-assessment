create table if not exists ft_db_{{ params.env }}.raw_stage.info (
  record_type string,
  date string,
  time string,
  error_severity string,
  error_number string,
  placement_id string,
  error_message string,
  ip_address string,
  referrer string,
  iab_flag string,
  user_agent string,
  file_source string,
  load_timestamp timestamp,
  run_datehour bigint
)
;

---

begin name load_rl_info_{{ execution_date.strftime("%Y%m%d%H") }};

---

delete from ft_db_{{ params.env }}.raw_stage.info
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

copy into ft_db_{{ params.env }}.raw_stage.info from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as error_severity,
    nullif(t.$5, '-') as error_number,
    nullif(t.$6, '-') as placement_id,
    nullif(t.$7, '-') as error_message,
    nullif(t.$8, '-') as ip_address,
    nullif(t.$9, '-') as referrer,
    nullif(t.$10, '-') as iab_flag,
    nullif(t.$11, '-') as user_agent,
    metadata$filename as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.ft_stage_info_logs_{{ params.env }}/{{ execution_date.strftime("%Y%m%d/%H") }}/log/ t
)
file_format = raw_stage.ft_log_csv_format
force = true
on_error = continue
;

---

delete from ft_db_dev.raw_stage.info
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}
and record_type like '#Version: %'
or record_type like '#Date: %'
or record_type like '#Start-Date: %'
or record_type like '#Fields: %'
;

---

copy into @raw_stage.tmp_restage/info/{{ execution_date.strftime("%Y%m%d%H") }}/ from
(
  select
      concat(
          replace(rejected_record,'\n',''),
          '\t',
          file
      ) as src
  from table(validate(ft_db_dev.raw_stage.info, job_id => '_last'))
  where rejected_record not like '#Version: %'
  and rejected_record not like '#Date: %'
  and rejected_record not like '#Start-Date: %'
  and rejected_record not like '#Fields: %'
)
overwrite = true
;

---

copy into ft_db_{{ params.env }}.raw_stage.info from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as error_severity,
    nullif(t.$5, '-') as error_number,
    nullif(t.$6, '-') as placement_id,
    nullif(t.$7, '-') as error_message,
    nullif(t.$8, '-') as ip_address,
    nullif(t.$9, '-') as referrer,
    nullif(t.$10, '-') as iab_flag,
    nullif(t.$11, '-') as user_agent,
    nullif(t.$12, '-') as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.tmp_restage/info/{{ execution_date.strftime("%Y%m%d%H") }}/ t
)
file_format = raw_stage.ft_log_csv_nh_format
on_error = continue
;

---

remove @raw_stage.tmp_restage/info/{{ execution_date.strftime("%Y%m%d%H") }}/ pattern='.*';

---

commit;
