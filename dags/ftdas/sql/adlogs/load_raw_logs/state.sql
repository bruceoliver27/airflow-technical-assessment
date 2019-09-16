create table if not exists ft_db_{{ params.env }}.raw_stage.state (
  record_type string,
  date string,
  time string,
  event string,
  placement_id string,
  creative_id string,
  config_id string,
  impression_id string,
  ip_address string,
  ft_product string,
  ft_data string,
  impression_guid string,
  file_source string,
  load_timestamp timestamp,
  run_datehour bigint
)
;

---

begin name load_rl_state_{{ execution_date.strftime("%Y%m%d%H") }};

---

delete from ft_db_{{ params.env }}.raw_stage.state
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

copy into ft_db_{{ params.env }}.raw_stage.state from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as event,
    nullif(t.$5, '-') as placement_id,
    nullif(t.$6, '-') as creative_id,
    nullif(t.$7, '-') as config_id,
    nullif(t.$8, '-') as impression_id,
    nullif(t.$9, '-') as ip_address,
    nullif(t.$10, '-') as ft_product,
    nullif(t.$11, '-') as ft_data,
    nullif(t.$12, '-') as impression_guid,
    metadata$filename as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.ft_stage_state_logs_{{ params.env }}/{{ execution_date.strftime("%Y%m%d/%H") }}/log/ t
)
file_format = raw_stage.ft_log_csv_format
force = true
on_error = continue
;

---

delete from ft_db_dev.raw_stage.state
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}
and record_type like '#Version: %'
or record_type like '#Date: %'
or record_type like '#Start-Date: %'
or record_type like '#Fields: %'
;

---

copy into @raw_stage.tmp_restage/state/{{ execution_date.strftime("%Y%m%d%H") }}/ from
(
  select
      concat(
          replace(rejected_record,'\n',''),
          '\t',
          file
      ) as src
  from table(validate(ft_db_dev.raw_stage.state, job_id => '_last'))
  where rejected_record not like '#Version: %'
  and rejected_record not like '#Date: %'
  and rejected_record not like '#Start-Date: %'
  and rejected_record not like '#Fields: %'
)
overwrite = true
;

---

copy into ft_db_{{ params.env }}.raw_stage.state from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as event,
    nullif(t.$5, '-') as placement_id,
    nullif(t.$6, '-') as creative_id,
    nullif(t.$7, '-') as config_id,
    nullif(t.$8, '-') as impression_id,
    nullif(t.$9, '-') as ip_address,
    nullif(t.$10, '-') as ft_product,
    nullif(t.$11, '-') as ft_data,
    nullif(t.$12, '-') as impression_guid,
    nullif(t.$13, '-') as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.tmp_restage/state/{{ execution_date.strftime("%Y%m%d%H") }}/ t
)
file_format = raw_stage.ft_log_csv_nh_format
;

---

remove @raw_stage.tmp_restage/state/{{ execution_date.strftime("%Y%m%d%H") }}/ pattern='.*';

---

commit;
