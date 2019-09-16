create table if not exists ft_db_{{ params.env }}.raw_stage.int (
  ipa string,
  date date,
  time time,
  agent_string string,
  idad_index int,
  idcreative_config int,
  idplacement int,
  idcreative int,
  idevent_type int,
  sid int,
  guid string,
  randomnum int,
  options string,
  file_source string,
  load_timestamp timestamp,
  run_datehour bigint
)
;

---

begin name load_rl_int_{{ execution_date.strftime("%Y%m%d%H") }};

---

delete from ft_db_{{ params.env }}.raw_stage.int
where run_datehour between {{ (execution_date - macros.timedelta(hours=2)).strftime("%Y%m%d%H") }}::bigint and {{ execution_date.strftime("%Y%m%d%H") }}::bigint
;

---

insert into ft_db_{{ params.env }}.raw_stage.int
with aco_base as (
    select
        case
            when file_source rlike '.*Inter_(s|x)_http.*'
                then '27.0.0.1'
            else host
        end as ipa,
        to_date(regexp_replace(upper(date),'\\[([0-9]{1,2}\/[A-Z]{3}\/[0-9]{4}).*','\\1'), 'dd/mon/yyyy') as date,
        to_time(regexp_replace(upper(date),'.*:([0-9]{2}:[0-9]{2}:[0-9]{2}).*','\\1'), 'h/m/s') as time,
        case
            when file_source rlike '.*Inter_(s|x)_http.*'
                then null
            else agent
        end as agent_string,
        case
            when get(split(get(split(replace(replace(request,',-,','-'),'=&','&'),'?'),1),' '),0) = ''
                then null
            else get(split(get(split(replace(replace(request,',-,','-'),'=&','&'),'?'),1),' '),0)::varchar
        end as request,
        file_source,
        load_timestamp,
        run_datehour
    from ft_db_{{ params.env }}.raw_stage.aco
    where run_datehour between {{ (execution_date - macros.timedelta(hours=2)).strftime("%Y%m%d%H") }}::bigint and {{ execution_date.strftime("%Y%m%d%H") }}::bigint
),
aco as (
    select
        ipa,
        date,
        time,
        agent_string,
        case
            when length(get(split(request,'-'),0)) > 10
                then null
            else get(split(request,'-'),0)
        end as idad_index,
        case
            when array_size(split(get(split(request,'-'),1),';')) = 3
                then get(split(get(split(request,'-'),1),';'),2)
            when array_size(split(get(split(request,'-'),1),'%3B')) = 3
                then get(split(get(split(request,'-'),1),'%3B'),2)
            when array_size(split(get(split(request,'-'),1),'&')) = 3
                then get(split(get(split(request,'-'),1),'&'),2)
            else get(split(request,'-'),1)
        end as idcreative_config,
        case
            when array_size(split(get(split(request,'-'),1),';')) = 3
                then get(split(get(split(request,'-'),1),';'),0)
            when array_size(split(get(split(request,'-'),1),'%3B')) = 3
                then get(split(get(split(request,'-'),1),'%3B'),0)
            when array_size(split(get(split(request,'-'),1),'&')) = 3
                then get(split(get(split(request,'-'),1),'&'),0)
            else 0
        end as idplacement,
        case
            when array_size(split(get(split(request,'-'),1),';')) = 3
                then get(split(get(split(request,'-'),1),';'),1)
            when array_size(split(get(split(request,'-'),1),'%3B')) = 3
                then get(split(get(split(request,'-'),1),'%3B'),1)
            when array_size(split(get(split(request,'-'),1),'&')) = 3
                then get(split(get(split(request,'-'),1),'&'),1)
            else 0
        end as idcreative,
        get(split(request,'-'),2) as idevent_type,
        case when get(split(request,'-'),3) not rlike '[0-9]+.*[0-9]*' then null else
        get(split(request,'-'),3) end as sid,
        get(split(request,'-'),4) as guid,
        regexp_replace(get(split(request,'-'),5),'([0-9]*)[^0-9]*?.*','\\1') as randomnum,
        case
            when get(split(request,'-'),5) not rlike '[0-9]*'
                then regexp_replace(get(split(request,'-'),5),'[0-9]*([^0-9]{1}.*)','\\1')
            else get(split(request,'-'),6)
        end as options,
        file_source,
        load_timestamp,
        run_datehour
    from aco_base
)
select
    ipa,
    date,
    time,
    agent_string,
    case
        when idad_index not rlike '[0-9]+' then null
        else idad_index::int
    end as idad_index,
    case
        when idcreative_config not rlike '[0-9]+' then null
        else idcreative_config::int
    end as idcreative_config,
    case
        when idplacement not rlike '[0-9]+' then null
        else idplacement::int
    end as idplacement,
    case
        when idcreative not rlike '[0-9]+' then null
        else idcreative::int
    end as idcreative,
    case
        when idevent_type not rlike '[0-9]+' then null
        else idevent_type::int
    end as idevent_type,
    case
        when sid not rlike '[0-9]+' then null
        else sid::int
    end as sid,
    guid,
    case
        when randomnum not rlike '[0-9]+' then null
        else randomnum::int
    end as randomnum,
    options,
    file_source,
    load_timestamp,
    run_datehour
from aco
where idad_index is not null
;

---

insert into ft_db_{{ params.env }}.raw_stage.int
with hw as (
    select
        s_ip as ipa,
        date,
        time,
        cs_user_agent as agent_string,
        case
            when length(get(split(cs_uri_query,'-'),0)) >= 20
                then null
            else get(split(cs_uri_query,'-'),0)::int
        end as idad_index,
        case
            when array_size(split(get(split(cs_uri_query,'-'),1),';')) = 1
                then get(split(cs_uri_query,'-'),1)::varchar
            else get(split(get(split(cs_uri_query,'-'),1),';'),2)::varchar
        end as idcreative_config,
        case
            when array_size(split(get(split(cs_uri_query,'-'),1),';')) = 1
                then 0
            else get(split(get(split(cs_uri_query,'-'),1),';'),0)::int
        end as idplacement,
        case
            when array_size(split(get(split(cs_uri_query,'-'),1),';')) = 1
                then 0
            else get(split(get(split(cs_uri_query,'-'),1),';'),1)::int
        end as idcreative,
        get(split(cs_uri_query,'-'),2)::int as idevent_type,
        get(split(cs_uri_query,'-'),3)::int as sid,
        get(split(cs_uri_query,'-'),4)::varchar as guid,
        get(split(cs_uri_query,'-'),5)::varchar as randomnum,
        get(split(cs_uri_query,'-'),6)::varchar as options,
        file_source,
        load_timestamp,
        run_datehour
    from ft_db_{{ params.env }}.raw_stage.highwinds_int
    where run_datehour between {{ (execution_date - macros.timedelta(hours=2)).strftime("%Y%m%d%H") }}::bigint and {{ execution_date.strftime("%Y%m%d%H") }}::bigint
)
select
    ipa,
    date,
    time,
    agent_string,
    case
        when idad_index not rlike '[0-9]+' then null
        else idad_index::int
    end as idad_index,
    case
        when idcreative_config not rlike '[0-9]+' then null
        else idcreative_config::int
    end as idcreative_config,
    case
        when idplacement not rlike '[0-9]+' then null
        else idplacement::int
    end as idplacement,
    case
        when idcreative not rlike '[0-9]+' then null
        else idcreative::int
    end as idcreative,
    case
        when idevent_type not rlike '[0-9]+' then null
        else idevent_type::int
    end as idevent_type,
    case
        when sid not rlike '[0-9]+' then null
        else sid::int
    end as sid,
    guid,
    case
        when randomnum not rlike '[0-9]+' then null
        else randomnum::int
    end as randomnum,
    options,
    file_source,
    load_timestamp,
    run_datehour
from hw
;

---

commit;
