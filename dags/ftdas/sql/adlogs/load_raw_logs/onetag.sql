create table if not exists ft_db_{{ params.env }}.raw_stage.onetag (
  record_type string,
  tag_date date,
  tag_time time,
  seg_data string,
  referrer string,
  ipa string,
  guid string,
  idspotlight_group string,
  domain string,
  path string,
  query_string string,
  file_source string,
  load_timestamp timestamp,
  run_datehour bigint
)
;

---

begin name load_rl_onetag_{{ execution_date.strftime("%Y%m%d%H") }};

---

delete from ft_db_{{ params.env }}.raw_stage.onetag
where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

insert into ft_db_{{ params.env }}.raw_stage.onetag
  select
      'o' as record_type,
      date as tag_date,
      time as tag_time,
      segment_data as seg_data,
      referrer,
      ip_address as ipa,
      guid,
      case when get(split(query_string,'&'),0) not like 's=%' then null
          else get(split(get(split(query_string,'&'),0),'s='),1)::string
      end as idspotlight_group,
      case when get(split(query_string,'&'),1) not like 'd=%' then null
          else get(split(get(split(query_string,'&'),1),'d='),1)::string
      end as domain,
      case when get(split(query_string,'&'),2) not like 'r=%' then null
          else get(split(get(split(query_string,'&'),2),'r='),1)::string
      end as path,
      query_string,
      file_source,
      load_timestamp,
      run_datehour
  from ft_db_dev.raw_stage.seg
  where run_datehour = {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

commit;
