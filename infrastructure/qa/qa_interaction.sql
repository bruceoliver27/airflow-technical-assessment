Select
dw.IDLOG_FILE_CONTROL,
fp.IDLOG_FILE_CONTROL as processed_idlog_file_control,
case when dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL then 'Correct - IDLOG_FILE_CONTROL' else 'Incorrect - IDLOG_FILE_CONTROL' end as idlog_file_control_flag,
dw.IDINTERACTION_LOG,
fp.IDINTERACTION_LOG as processed_idinteraction_log,
case when dw.IDINTERACTION_LOG = fp.IDINTERACTION_LOG then 'Correct - IDINTERACTION_LOG' else 'Incorrect - IDINTERACTION_LOG' end as idinteraction_log_flag,
dw.EVENT_DATE,
fp.EVENT_DATE as processed_event_Date,
case 
    when dw.EVENT_DATE is null and fp.EVENT_DATE is null then 'Correct - EVENT_DATE' 
    when dw.EVENT_DATE = fp.EVENT_DATE then 'Correct - EVENT_DATE' 
    else 'Incorrect - EVENT_DATE' 
end as event_date_flag,
dw.IDEVENT_TYPE,
fp.IDEVENT_TYPE as processed_idevent_type,
case 
    when dw.IDEVENT_TYPE is null and fp.IDEVENT_TYPE is null then 'Correct - IDEVENT_TYPE' 
    when dw.IDEVENT_TYPE = fp.IDEVENT_TYPE then 'Correct - IDEVENT_TYPE' 
    else 'Incorrect - IDEVENT_TYPE' 
end as idevent_type_flag,
dw.IDCREATIVE,
fp.IDCREATIVE as processed_idcreative,
case 
    when dw.IDCREATIVE is null and fp.IDCREATIVE is null then 'Correct - IDCREATIVE' 
    when dw.IDCREATIVE = fp.IDCREATIVE then 'Correct - IDCREATIVE' 
    else 'Incorrect - IDCREATIVE' 
end as idcreative_flag,
dw.IDPLACEMENT,
fp.IDPLACEMENT as processed_idplacement,
case 
    when dw.IDPLACEMENT is null and fp.IDPLACEMENT is null then 'Correct - IDPLACEMENT'
    when dw.IDPLACEMENT = fp.IDPLACEMENT then 'Correct - IDPLACEMENT' 
    else 'Incorrect - IDPLACEMENT' 
end as idplacement_flag,
dw.IDCAMPAIGN,
fp.IDCAMPAIGN as processed_idcampaign,
case 
    when dw.IDCAMPAIGN is null and fp.IDCAMPAIGN is null then 'Correct - IDCAMPAIGN'
    when dw.IDCAMPAIGN = fp.IDCAMPAIGN then 'Correct - IDCAMPAIGN' 
    else 'Incorrect - IDCAMPAIGN' 
end as idcampaign_flag,
dw.IDCREATIVE_CONFIG,
fp.IDCREATIVE_CONFIG as processed_idcreative_config,
case 
    when dw.IDCREATIVE_CONFIG is null and fp.IDCREATIVE_CONFIG is null then 'Correct - IDCREATIVE_CONFIG' 
    when dw.IDCREATIVE_CONFIG = fp.IDCREATIVE_CONFIG then 'Correct - IDCREATIVE_CONFIG' 
    else 'Incorrect - IDCREATIVE_CONFIG' 
end as idcreative_config_flag,
dw.EVENT_TIME,
fp.EVENT_TIME as processed_event_time,
case 
    when dw.EVENT_TIME is null and fp.EVENT_TIME is null then 'Correct - EVENT_TIME'
    when dw.EVENT_TIME = fp.EVENT_TIME then 'Correct - EVENT_TIME' 
    else 'Incorrect - EVENT_TIME' 
end as event_time_flag,
dw.GUIDN,
fp.GUIDN as processed_GUIDN,
case 
    when dw.GUIDN is null and fp.GUIDN is null then 'Correct - GUIDN' 
    when dw.GUIDN = fp.GUIDN then 'Correct - GUIDN' 
    else 'Incorrect - GUIDN' 
end as guidn_flag,
dw.SID,
fp.SID as processed_sid,
case 
    when dw.SID is null and fp.SID is null then 'Correct - SID' 
    when dw.SID = fp.SID then 'Correct - SID' 
    else 'Incorrect - SID' 
end as sid_flag,
dw.IDAD_INDEX,
fp.IDAD_INDEX as processed_idad_index,
case 
    when dw.IDAD_INDEX is null and fp.IDAD_INDEX is null then 'Correct - IDAD_INDEX' 
    when dw.IDAD_INDEX = fp.IDAD_INDEX then 'Correct - IDAD_INDEX' 
    else 'Incorrect - IDAD_INDEX' 
end as idad_index_flag,
dw.IDSITE,
fp.IDSITE as processed_idsite,
case 
    when dw.IDSITE is null and fp.IDSITE is null then 'Correct - IDSITE' 
    when dw.IDSITE = fp.IDSITE then 'Correct - IDSITE' 
    else 'Incorrect - IDSITE' 
end as idsite_flag,
dw.IDFT_AGENTS_OS,
fp.IDFT_AGENTS_OS as processed_idft_agent_os,
case 
    when dw.IDFT_AGENTS_OS is null and fp.IDFT_AGENTS_OS is null then 'Correct - IDFT_AGENTS_OS' 
    when dw.IDFT_AGENTS_OS = fp.IDFT_AGENTS_OS then 'Correct - IDFT_AGENTS_OS' 
    else 'Incorrect - IDFT_AGENTS_OS' 
end as idft_agent_os_flag,
dw.IDFT_AGENTS_BROWSERS,
fp.IDFT_AGENTS_BROWSERS as processed_idft_agents_browsers,
case 
    when dw.IDFT_AGENTS_BROWSERS is null and fp.IDFT_AGENTS_BROWSERS is null then 'Correct - IDFT_AGENTS_BROWSERS' 
    when dw.IDFT_AGENTS_BROWSERS = fp.IDFT_AGENTS_BROWSERS then 'Correct - IDFT_AGENTS_BROWSERS' 
    else 'Incorrect - IDFT_AGENTS_BROWSERS' 
end as idft_agents_browsers_flag,
dw.IDFT_AGENTS_DEVICES,
fp.IDFT_AGENTS_DEVICES as processed_idft_agents_devices,
case 
    when dw.IDFT_AGENTS_DEVICES is null and fp.IDFT_AGENTS_DEVICES is null then 'Correct - IDFT_AGENTS_DEVICES' 
    when dw.IDFT_AGENTS_DEVICES = fp.IDFT_AGENTS_DEVICES then 'Correct - IDFT_AGENTS_DEVICES' 
    else 'Incorrect - IDFT_AGENTS_DEVICES' 
end as idft_agents_devices_flag,
dw.DEVICE_TYPE,
fp.DEVICE_TYPE as processed_device_type,
case 
    when dw.DEVICE_TYPE is null and fp.DEVICE_TYPE is null then 'Correct - DEVICE_TYPE' 
    when dw.DEVICE_TYPE = fp.DEVICE_TYPE then 'Correct - DEVICE_TYPE' 
    else 'Incorrect - DEVICE_TYPE' 
end as device_type_flag,
dw.COUNTRY_CODE,
fp.COUNTRY_CODE as processed_country_code,
case 
    when dw.COUNTRY_CODE is null and fp.COUNTRY_CODE is null then 'Correct - COUNTRY_CODE' 
    when dw.COUNTRY_CODE = fp.COUNTRY_CODE then 'Correct - COUNTRY_CODE' 
    else 'Incorrect - COUNTRY_CODE' 
end as country_code_flag,
dw.METRO_CODE,
fp.METRO_CODE as processed_METRO_CODE,
case 
    when dw.METRO_CODE is null and fp.METRO_CODE is null then 'Correct - METRO_CODE' 
    when dw.METRO_CODE = fp.METRO_CODE then 'Correct - METRO_CODE' 
    else 'Incorrect - METRO_CODE' 
end as metro_code_flag,
dw.REGION_CODE,
fp.REGION_CODE as processed_REGION_CODE,
case 
    when dw.REGION_CODE is null and fp.REGION_CODE is null then 'Correct - REGION_CODE' 
    when dw.REGION_CODE = fp.REGION_CODE then 'Correct - REGION_CODE' 
    else 'Incorrect - REGION_CODE' 
end as region_code_flag,
dw.CITY_CODE,
fp.CITY_CODE as processed_city_code,
case 
    when dw.CITY_CODE is null and fp.CITY_CODE is null then 'Correct - CITY_CODE' 
    when dw.CITY_CODE = fp.CITY_CODE then 'Correct - CITY_CODE' 
    else 'Incorrect - CITY_CODE' 
end as city_code_flag,
dw.POSTAL_CODE,
fp.POSTAL_CODE as processed_postal_code,
case 
    when dw.POSTAL_CODE is null and fp.POSTAL_CODE is null then 'Correct - POSTAL_CODE' 
    when dw.POSTAL_CODE = fp.POSTAL_CODE then 'Correct - POSTAL_CODE' 
    else 'Incorrect - POSTAL_CODE' 
end as postal_code_flag,
dw.IDFT_ISP,
fp.IDFT_ISP as processed_idft_isp,
case 
    when dw.IDFT_ISP is null and fp.IDFT_ISP is null then 'Correct - IDFT_ISP' 
    when dw.IDFT_ISP = fp.IDFT_ISP then 'Correct - IDFT_ISP' 
    else 'Incorrect - IDFT_ISP' 
end as idft_isp_flag,
dw.IDFT_CONNECTION_SPEED,
fp.IDFT_CONNECTION_SPEED as processed_idft_connection_speed,
case 
    when dw.IDFT_CONNECTION_SPEED is null and fp.IDFT_CONNECTION_SPEED is null then 'Correct - IDFT_CONNECTION_SPEED' 
    when dw.IDFT_CONNECTION_SPEED = fp.IDFT_CONNECTION_SPEED then 'Correct - IDFT_CONNECTION_SPEED' 
    else 'Incorrect - IDFT_CONNECTION_SPEED' 
end as idft_connection_speed_flag,
dw.IDBUSINESS_ENTITY,
fp.IDBUSINESS_ENTITY as processed_idbusiness_entity,
case 
    when dw.IDBUSINESS_ENTITY is null and fp.IDBUSINESS_ENTITY is null then 'Correct - IDBUSINESS_ENTITY' 
    when dw.IDBUSINESS_ENTITY = fp.IDBUSINESS_ENTITY then 'Correct - IDBUSINESS_ENTITY' 
    else 'Incorrect - IDBUSINESS_ENTITY' 
end as idbusiness_entity_flag,
dw.OPTIONS,
fp.OPTIONS as processed_options,
case 
    when dw.OPTIONS is null and fp.OPTIONS is null then 'Correct - OPTIONS' 
    when dw.OPTIONS = fp.OPTIONS then 'Correct - OPTIONS' 
    else 'Incorrect - OPTIONS' 
end as options_flag,
dw.ARRIVAL_TIME,
fp.ARRIVAL_TIME as processed_arrival_time,
case 
    when dw.ARRIVAL_TIME is null and fp.ARRIVAL_TIME is null then 'Correct - ARRIVAL_TIME' 
    when dw.ARRIVAL_TIME = fp.ARRIVAL_TIME then 'Correct - ARRIVAL_TIME' 
    else 'Incorrect - ARRIVAL_TIME' 
end as arrival_time_flag,
dw.FILE_SOURCE,
dw.LOAD_TIMESTAMP,
dw.RUN_DATEHOUR
From
    "FT_DB_DEV"."DATA_WAREHOUSE"."INTERACTION" as dw
Full outer join
    "FT_DB_DEV"."FT_PROCESSED"."INTERACTION" as fp
    On dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL
    And dw.IDINTERACTION_LOG = fp.IDINTERACTION_LOG
    And dw.EVENT_DATE = fp.EVENT_DATE
Where dw.IDBUSINESS_ENTITY in (6061, 12345, 13642, 13657, 13658, 13659, 13660, 13661)
And dw.event_time >= '2019-08-12 18:00:00'
And dw.event_time <= '2019-08-13 22:00:00'
And (idlog_file_control_flag like 'Incorrect%'
Or idinteraction_log_flag like 'Incorrect%'
Or event_date_flag like 'Incorrect%'
Or idevent_type_flag like 'Incorrect%'
Or idcreative_flag like 'Incorrect%'
Or idplacement_flag like 'Incorrect%'
Or idcampaign_flag like 'Incorrect%'
Or idcreative_config_flag like 'Incorrect%'
Or event_time_flag like 'Incorrect%'
Or guidn_flag like 'Incorrect%'
Or sid_flag like 'Incorrect%'
Or idad_index_flag like 'Incorrect%'
Or idsite_flag like 'Incorrect%'
Or idft_agent_os_flag like 'Incorrect%'
Or idft_agents_browsers_flag like 'Incorrect%'
Or idft_agents_devices_flag like 'Incorrect%'
Or device_type_flag like 'Incorrect%'
Or country_code_flag like 'Incorrect%'
Or metro_code_flag like 'Incorrect%'
Or region_code_flag like 'Incorrect%'
Or city_code_flag like 'Incorrect%'
Or postal_code_flag like 'Incorrect%'
Or idft_isp_flag like 'Incorrect%'
Or idft_connection_speed_flag like 'Incorrect%'
Or idbusiness_entity_flag like 'Incorrect%'
Or options_flag like 'Incorrect%'
Or arrival_time_flag like 'Incorrect%'
)

