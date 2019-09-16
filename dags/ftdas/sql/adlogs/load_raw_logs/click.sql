create table if not exists ft_db_{{ params.env }}.raw_stage.click (
  record_type string,
  date string,
  time string,
  event string,
  campaign_id string,
  placement_id string,
  creative_id string,
  configuration_id string,
  GUID string,
  iab_flag string,
  ip_address string,
  rule_match string,
  ft_custom string,
  ft_section string,
  keyword string,
  privacy string,
  parent_time string,
  device_id string,
  imp_id string,
  ft_agent_env string,
  user_agent string,
  impression_guid string,
  ft_tpplid string,
  ft_c1 string,
  ft_c2 string,
  ft_c3 string,
  file_source string,
  load_timestamp timestamp,
  run_datehour bigint
)
;

---

begin name load_rl_click_{{ execution_date.strftime("%Y%m%d%H") }};

---

delete from ft_db_{{ params.env }}.raw_stage.click
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

copy into ft_db_{{ params.env }}.raw_stage.click from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as event,
    nullif(t.$5, '-') as campaign_id,
    nullif(t.$6, '-') as placement_id,
    nullif(t.$7, '-') as creative_id,
    nullif(t.$8, '-') as configuration_id,
    nullif(t.$9, '-') as GUID,
    nullif(t.$10, '-') as iab_flag,
    nullif(t.$11, '-') as ip_address,
    nullif(t.$12, '-') as rule_match,
    nullif(t.$13, '-') as ft_custom,
    nullif(t.$14, '-') as ft_section,
    nullif(t.$15, '-') as keyword,
    nullif(t.$16, '-') as privacy,
    nullif(t.$17, '-') as parent_time,
    nullif(t.$18, '-') as device_id,
    nullif(t.$19, '-') as imp_id,
    nullif(t.$20, '-') as ft_agent_env,
    nullif(t.$21, '-') as user_agent,
    nullif(t.$22, '-') as impression_guid,
    nullif(t.$23, '-') as ft_tpplid,
    nullif(t.$24, '-') as ft_c1,
    nullif(t.$25, '-') as ft_c2,
    nullif(t.$26, '-') as ft_c3,
    metadata$filename as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.ft_stage_click_logs_{{ params.env }}/{{ execution_date.strftime("%Y%m%d/%H") }}/log/ t
)
file_format = raw_stage.ft_log_csv_format
force = true
on_error = continue
;

---

delete from ft_db_dev.raw_stage.click
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}
and record_type like '#Version: %'
or record_type like '#Date: %'
or record_type like '#Start-Date: %'
or record_type like '#Fields: %'
;

---

copy into @raw_stage.tmp_restage/click/{{ execution_date.strftime("%Y%m%d%H") }}/ from
(
  select
      concat(
          replace(rejected_record,'\n',''),
          '\t',
          file
      ) as src
  from table(validate(ft_db_dev.raw_stage.click, job_id => '_last'))
  where rejected_record not like '#Version: %'
  and rejected_record not like '#Date: %'
  and rejected_record not like '#Start-Date: %'
  and rejected_record not like '#Fields: %'
)
overwrite = true;

---

copy into ft_db_dev.raw_stage.click from (
  select distinct
    nullif(t.$1, '-') as record_type,
    nullif(t.$2, '-') as date,
    nullif(t.$3, '-') as time,
    nullif(t.$4, '-') as event,
    nullif(t.$5, '-') as campaign_id,
    nullif(t.$6, '-') as placement_id,
    nullif(t.$7, '-') as creative_id,
    nullif(t.$8, '-') as configuration_id,
    nullif(t.$9, '-') as GUID,
    nullif(t.$10, '-') as iab_flag,
    nullif(t.$11, '-') as ip_address,
    nullif(t.$12, '-') as rule_match,
    nullif(t.$13, '-') as ft_custom,
    nullif(t.$14, '-') as ft_section,
    nullif(t.$15, '-') as keyword,
    nullif(t.$16, '-') as privacy,
    nullif(t.$17, '-') as parent_time,
    nullif(t.$18, '-') as device_id,
    nullif(t.$19, '-') as imp_id,
    nullif(t.$20, '-') as ft_agent_env,
    nullif(t.$21, '-') as user_agent,
    nullif(t.$22, '-') as impression_guid,
    nullif(t.$23, '-') as ft_tpplid,
    nullif(t.$24, '-') as ft_c1,
    nullif(t.$25, '-') as ft_c2,
    nullif(t.$26, '-') as ft_c3,
    nullif(t.$27, '-') as file_source,
    convert_timezone('UTC',current_timestamp())::timestamp_ntz as load_timestamp,
    {{ execution_date.strftime("%Y%m%d%H") }} as run_datehour
  from @raw_stage.tmp_restage/click/{{ execution_date.strftime("%Y%m%d%H") }}/ t
)
file_format = raw_stage.ft_log_csv_nh_format
;

---

remove @raw_stage.tmp_restage/click/{{ execution_date.strftime("%Y%m%d%H") }}/ pattern='.*';

---

commit;
