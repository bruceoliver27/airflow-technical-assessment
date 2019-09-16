create table if not exists ft_db_{{ params.env }}.raw_stage.spot (
  record_type string,
  date string,
  time string,
  spotlight_id string,
  advertiser_id string,
  spotlightgroup_id string,
  GUID string,
  queryArgs string,
  browser string,
  ip_address string,
  privacy string,
  track_id string,
  user_agent string,
  spotlight_request_guid string,
  file_source string,
  load_timestamp timestamp,
  run_datehour bigint
)
;

---

begin name load_rl_spot_{{ execution_date.strftime("%Y%m%d%H") }};

---

delete from ft_db_{{ params.env }}.raw_stage.spot
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

copy into ft_db_{{ params.env }}.raw_stage.spot from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as spotlight_id,
    nullif(t.$5, '-') as advertiser_id,
    nullif(t.$6, '-') as spotlightgroup_id,
    nullif(t.$7, '-') as GUID,
    nullif(t.$8, '-') as queryArgs,
    nullif(t.$9, '-') as browser,
    nullif(t.$10, '-') as ip_address,
    nullif(t.$11, '-') as privacy,
    nullif(t.$12, '-') as track_id,
    nullif(t.$13, '-') as user_agent,
    nullif(t.$14, '-') as spotlight_request_guid,
    metadata$filename as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.ft_stage_spot_logs_{{ params.env }}/{{ execution_date.strftime("%Y%m%d/%H") }}/log/ t
)
file_format = raw_stage.ft_log_csv_format
force = true
on_error = continue
;

---

delete from ft_db_dev.raw_stage.spot
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}
and record_type like '#Version: %'
or record_type like '#Date: %'
or record_type like '#Start-Date: %'
or record_type like '#Fields: %'
;

---

copy into @raw_stage.tmp_restage/spot/{{ execution_date.strftime("%Y%m%d%H") }}/ from
(
  select
      concat(
          replace(rejected_record,'\n',''),
          '\t',
          file
      ) as src
  from table(validate(ft_db_dev.raw_stage.spot, job_id => '_last'))
  where rejected_record not like '#Version: %'
  and rejected_record not like '#Date: %'
  and rejected_record not like '#Start-Date: %'
  and rejected_record not like '#Fields: %'
)
overwrite = true
;

---

copy into ft_db_{{ params.env }}.raw_stage.spot from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as spotlight_id,
    nullif(t.$5, '-') as advertiser_id,
    nullif(t.$6, '-') as spotlightgroup_id,
    nullif(t.$7, '-') as GUID,
    nullif(t.$8, '-') as queryArgs,
    nullif(t.$9, '-') as browser,
    nullif(t.$10, '-') as ip_address,
    nullif(t.$11, '-') as privacy,
    nullif(t.$12, '-') as track_id,
    nullif(t.$13, '-') as user_agent,
    nullif(t.$14, '-') as spotlight_request_guid,
    nullif(t.$15, '-') as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.tmp_restage/spot/{{ execution_date.strftime("%Y%m%d%H") }}/ t
)
file_format = raw_stage.ft_log_csv_nh_format
;

---

remove @raw_stage.tmp_restage/spot/{{ execution_date.strftime("%Y%m%d%H") }}/ pattern='.*';

---

commit;
