--browser
--click
insert into "FT_DB_DEV"."AGGREGATIONS"."AGENT_BROWSER_PLACEMENT_EVENT_M05"
  (
    activity_date,
    idbusiness_entity,
    idcampaign,
    idsite,
    idplacement,
    idcreative,
    idft_agents_browsers,
    device_type,
    idevent_type,
    idagent_env,
    iab_flag,
    total
  )
  select
    dateadd('hours', -5, event_time)::date as activity_date,
    l.idbusiness_entity,
    idcampaign,
    idsite,
    idplacement,
    idcreative,
    idft_agents_browsers,
    device_type,
    idevent_type,
    idagent_env,
    iab_flag,
    count(*) as total
from
  "FT_DB_DEV"."DATA_WAREHOUSE"."CLICK" l
    join  "FT_DB_DEV"."PS_XRE"."BUSINESS_ENTITY" be
        on be.idbusiness_entity = l.idbusiness_entity
  where be.ft_dept = 3
  and dateadd('hours', -5, l.event_time)::date = '2019-08-17'::date
 group by 1,2,3,4,5,6,7,8,9,10,11
 order by 1,2,3,4,5,6,7,8,9,10,11
 ;

---

--imp
insert into "FT_DB_DEV"."AGGREGATIONS"."AGENT_BROWSER_PLACEMENT_EVENT_M05"
  (
    activity_date,
    idbusiness_entity,
    idcampaign,
    idsite,
    idplacement,
    idcreative,
    idft_agents_browsers,
    device_type,
    idevent_type,
    idagent_env,
    iab_flag,
    total
  )
  select
    dateadd('hours', -5, event_time)::date as activity_date,
    l.idbusiness_entity,
    idcampaign,
    idsite,
    idplacement,
    idcreative,
    idft_agents_browsers,
    device_type,
    idevent_type,
    idagent_env,
    iab_flag,
    count(*) as total
from
"FT_DB_DEV"."DATA_WAREHOUSE"."IMP" l
    join "FT_DB_DEV"."PS_XRE"."BUSINESS_ENTITY" be
        on be.idbusiness_entity = l.idbusiness_entity
  where be.ft_dept = 3
  and dateadd('hours', -5, l.event_time)::date = '2019-08-17'::date
 group by 1,2,3,4,5,6,7,8,9,10,11
 order by 1,2,3,4,5,6,7,8,9,10,11
 ;

 ---

 --interaction
 insert into "FT_DB_DEV"."AGGREGATIONS"."AGENT_BROWSER_PLACEMENT_EVENT_M05"
   (
     activity_date,
     idbusiness_entity,
     idcampaign,
     idsite,
     idplacement,
     idcreative,
     idft_agents_browsers,
     device_type,
     idevent_type,
     idagent_env,
     iab_flag,
     total,
     total_time
   )
   select
     dateadd('hours', -5, event_time)::date as activity_date,
     l.idbusiness_entity,
     idcampaign,
     idsite,
     idplacement,
     idcreative,
     idft_agents_browsers,
     device_type,
     idevent_type,
     0 as idagent_env,
     'w' as iab_flag,
     count(*) as total,
     sum(sid) as total_time
 from
   "FT_DB_DEV"."DATA_WAREHOUSE"."INTERACTION" l
     join "FT_DB_DEV"."PS_XRE"."BUSINESS_ENTITY" be
         on be.idbusiness_entity = l.idbusiness_entity
  where be.ft_dept = 3
  and dateadd('hours', -5, l.event_time)::date = '2019-08-17'::date
  group by 1,2,3,4,5,6,7,8,9,10,11
  order by 1,2,3,4,5,6,7,8,9,10,11
  ;

---

Select
    a.ACTIVITY_DATE,
    a.IDBUSINESS_ENTITY,
    a.IDCAMPAIGN,
    a.IDSITE,
    a.IDPLACEMENT,
    a.IDCREATIVE,
    a.IDFT_AGENTS_BROWSERS,
    a.DEVICE_TYPE,
    a.IDEVENT_TYPE,
    a.IDAGENT_ENV,
    a.TOTAL,
    ma.TOTAL as master_total,
    case 
        when a.TOTAL is not null and ma.TOTAL is null then 'Incorrect - Total' 
        when a.TOTAL is null and ma.TOTAL is not null then 'Incorrect - Total' 
        when a.TOTAL is null and ma.TOTAL is null then 'Correct - Total'
        when a.TOTAL != ma.TOTAL then 'Incorrect - Total' 
        else 'Correct - Total' 
    end total_flag,
    a.TOTAL_TIME,
    ma.TOTAL_TIME as master_total_time,
    case 
        when a.TOTAL_TIME is not null and ma.TOTAL_TIME is null then 'Incorrect - Total Time' 
        when a.TOTAL_TIME is null and ma.TOTAL_TIME is not null then 'Incorrect - Total Time' 
        when a.TOTAL_TIME is null and ma.TOTAL_TIME is null then 'Correct - Total Time'
        when a.TOTAL_TIME != ma.TOTAL_TIME then 'Incorrect - Total Time' 
        else 'Correct - Total Time' 
    end total_time_flag,
    a.IAB_FLAG
From 
    "FT_DB_DEV"."AGGREGATIONS"."AGENT_BROWSER_PLACEMENT_EVENT_M05" as a 
Left join 
    "FT_DB_DEV"."MASTER_AGGREGATIONS"."AGENT_BROWSER_PLACEMENT_EVENT_M05" as ma 
    On  a.ACTIVITY_DATE = ma.ACTIVITY_DATE
    and a.IDBUSINESS_ENTITY = ma.CLIENT_BEID
    and a.IDCAMPAIGN = ma.IDCAMPAIGN
    and a.IDSITE = ma.IDSITE
    and a.IDPLACEMENT = ma.IDPLACEMENT
    and a.IDCREATIVE = ma.IDCREATIVE
    and a.IDFT_AGENTS_BROWSERS = ma.IDFT_AGENTS_BROWSERS
    and a.DEVICE_TYPE = ma.DEVICE_TYPE
    and a.IDEVENT_TYPE = ma.IDEVENT_TYPE
    and a.IDAGENT_ENV = ma.AGENT_ENV
    and a.IAB_FLAG = ma.IAB_FLAG
