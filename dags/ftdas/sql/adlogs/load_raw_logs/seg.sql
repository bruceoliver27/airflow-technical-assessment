create table if not exists ft_db_{{ params.env }}.raw_stage.seg (
  record_type string,
  date string,
  time string,
  segment_data string,
  referrer string,
  ip_address string,
  GUID string,
  query_string string,
  privacy string,
  file_source string,
  load_timestamp timestamp,
  run_datehour bigint
)
;

---

begin name load_rl_seg_{{ execution_date.strftime("%Y%m%d%H") }};

---

delete from ft_db_{{ params.env }}.raw_stage.seg
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

copy into ft_db_{{ params.env }}.raw_stage.seg from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as segment_data,
    nullif(t.$5, '-') as referrer,
    nullif(t.$6, '-') as ip_address,
    nullif(t.$7, '-') as GUID,
    nullif(t.$8, '-') as query_string,
    nullif(t.$9, '-') as privacy,
    metadata$filename as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.ft_stage_seg_logs_{{ params.env }}/{{ execution_date.strftime("%Y%m%d/%H") }}/log/ t
)
file_format = raw_stage.ft_log_csv_format
force = true
on_error = continue
;

---

delete from ft_db_dev.raw_stage.seg
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}
and record_type like '#Version: %'
or record_type like '#Date: %'
or record_type like '#Start-Date: %'
or record_type like '#Fields: %'
;

---

copy into @raw_stage.tmp_restage/seg/{{ execution_date.strftime("%Y%m%d%H") }}/ from
(
  select
      concat(
          replace(rejected_record,'\n',''),
          '\t',
          file
      ) as src
  from table(validate(ft_db_dev.raw_stage.seg, job_id => '_last'))
  where rejected_record not like '#Version: %'
  and rejected_record not like '#Date: %'
  and rejected_record not like '#Start-Date: %'
  and rejected_record not like '#Fields: %'
)
overwrite = true
;

---

copy into ft_db_{{ params.env }}.raw_stage.seg from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as segment_data,
    nullif(t.$5, '-') as referrer,
    nullif(t.$6, '-') as ip_address,
    nullif(t.$7, '-') as GUID,
    nullif(t.$8, '-') as query_string,
    nullif(t.$9, '-') as privacy,
    nullif(t.$10, '-') as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.tmp_restage/seg/{{ execution_date.strftime("%Y%m%d%H") }}/ t
)
file_format = raw_stage.ft_log_csv_nh_format
;

---

remove @raw_stage.tmp_restage/seg/{{ execution_date.strftime("%Y%m%d%H") }}/ pattern='.*';

---

commit;
