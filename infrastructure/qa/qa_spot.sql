Select 
dw.IDLOG_FILE_CONTROL,
fp.IDLOG_FILE_CONTROL as processed_idlog_file_control,
case when dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL then 'Correct - IDLOG_FILE_CONTROL' else 'Incorrect - IDLOG_FILE_CONTROL' end as idlog_file_control_flag,	
dw.IDSPOTLIGHT_LOG,
fp.IDSPOTLIGHT_LOG as processed_idspotlight_log,
case when dw.IDSPOTLIGHT_LOG = fp.IDSPOTLIGHT_LOG then 'Correct - IDSPOTLIGHT_LOG' else 'Incorrect - IDSPOTLIGHT_LOG' end as idspotlight_log_flag,
dw.EVENT_DATE,
fp.EVENT_DATE as processed_event_Date,
case 
    when dw.EVENT_DATE is null and fp.EVENT_DATE is null then 'Correct - EVENT_DATE' 
    when dw.EVENT_DATE = fp.EVENT_DATE then 'Correct - EVENT_DATE' 
    else 'Incorrect - EVENT_DATE' 
end as event_date_flag,			
dw.IDBUSINESS_ENTITY,
fp.IDBUSINESS_ENTITY as processed_idbusiness_entity,
case 
    when dw.IDBUSINESS_ENTITY is null and fp.IDBUSINESS_ENTITY is null then 'Correct - IDBUSINESS_ENTITY' 
    when dw.IDBUSINESS_ENTITY = fp.IDBUSINESS_ENTITY then 'Correct - IDBUSINESS_ENTITY' 
    else 'Incorrect - IDBUSINESS_ENTITY' 
end as idbusiness_entity_flag,		
dw.IDSPOTLIGHT,
fp.IDSPOTLIGHT as processed_idspotlight,
case 
    when dw.IDSPOTLIGHT is null and fp.IDSPOTLIGHT is null then 'Correct - IDSPOTLIGHT' 
    when dw.IDSPOTLIGHT = fp.IDSPOTLIGHT then 'Correct - IDSPOTLIGHT' 
    else 'Incorrect - IDSPOTLIGHT' 
end as idspotlight_flag,	
dw.GUIDN,
fp.GUIDN as processed_guidn,
case 
    when dw.GUIDN is null and fp.GUIDN is null then 'Correct - GUIDN' 
    when dw.GUIDN = fp.GUIDN then 'Correct - GUIDN' 
    else 'Incorrect - GUIDN' 
end as guidn_flag,
dw.GUIDN_CREATED,
fp.GUIDN_CREATED as processed_guidn_created,
case 
    when dw.GUIDN_CREATED is null and fp.GUIDN_CREATED is null then 'Correct - GUIDN_CREATED' 
    when dw.GUIDN_CREATED = fp.GUIDN_CREATED then 'Correct - GUIDN_CREATED' 
    else 'Incorrect - GUIDN_CREATED' 
end as guidn_created_flag,
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
dw.IDFT_CONNECTION_SPEED,
fp.IDFT_CONNECTION_SPEED as processed_idft_connection_speed,
case 
    when dw.IDFT_CONNECTION_SPEED is null and fp.IDFT_CONNECTION_SPEED is null then 'Correct - IDFT_CONNECTION_SPEED' 
    when dw.IDFT_CONNECTION_SPEED = fp.IDFT_CONNECTION_SPEED then 'Correct - IDFT_CONNECTION_SPEED' 
    else 'Incorrect - IDFT_CONNECTION_SPEED' 
end as idft_connection_speed_flag,		
dw.IDSPOTLIGHT_GROUP,
fp.IDSPOTLIGHT_GROUP as processed_idspotlight_group,
case 
    when dw.IDSPOTLIGHT_GROUP is null and fp.IDSPOTLIGHT_GROUP is null then 'Correct - IDSPOTLIGHT_GROUP'
    when dw.IDSPOTLIGHT_GROUP = fp.IDSPOTLIGHT_GROUP then 'Correct - IDSPOTLIGHT_GROUP' 
    else 'Incorrect - IDSPOTLIGHT_GROUP' 
end as idspotlight_group_flag,
//dw.ORIGINAL_SPOT_GROUP,
dw.QVAL,
fp.QVAL as processed_qval,
case 
    when dw.QVAL is null and fp.QVAL is null then 'Correct - QVAL' 
    when dw.QVAL = fp.QVAL then 'Correct - QVAL' 
    else 'Incorrect - QVAL' 
end as qval_flag,
dw.QREF,
fp.QREF as processed_qref,
case 
    when dw.QREF is null and fp.QREF is null then 'Correct - QREF' 
    when dw.QREF = fp.QREF then 'Correct - QREF' 
    else 'Incorrect - QREF' 
end as qref_flag,
dw.IAB_FLAG,
fp.IAB_FLAG as processed_iab_flag,
case 
    when dw.IAB_FLAG = fp.IAB_FLAG then 'Correct - IAB_FLAG' 
    when dw.IAB_FLAG = fp.IAB_FLAG then 'Correct - IAB_FLAG' 
    else 'Incorrect - IAB_FLAG' 
end as iab_flag_flag,
dw.IPN,
fp.IPN as processed_ipn,
case 
    when dw.IPN is null and fp.IPN is null then 'Correct - IPN' 
    when dw.IPN = fp.IPN then 'Correct - IPN' 
    else 'Incorrect - IPN' 
end as ipn_flag,
dw.IDFT_AGENTS_CONS,
fp.IDFT_AGENTS_CONS as processed_idft_agents_cons,
case 
    when dw.IDFT_AGENTS_CONS is null and fp.IDFT_AGENTS_CONS is null then 'Correct - IDFT_AGENTS_CONS' 
    when dw.IDFT_AGENTS_CONS = fp.IDFT_AGENTS_CONS then 'Correct - IDFT_AGENTS_CONS' 
    else 'Incorrect - IDFT_AGENTS_CONS' 
end as idft_agents_cons_flag,		
dw.IDFT_GEO,
fp.IDFT_GEO as processed_idft_geo,
case 
    when dw.IDFT_GEO is null and fp.IDFT_GEO is null then 'Correct - IDFT_GEO' 
    when dw.IDFT_GEO = fp.IDFT_GEO then 'Correct - IDFT_GEO' 
    else 'Incorrect - IDFT_GEO' 
end as idft_geo_flag,	
dw.PRIVACY_FLAG,
fp.PRIVACY_FLAG as processed_privacy_flag,
case 
    when dw.PRIVACY_FLAG is null and fp.PRIVACY_FLAG is null then 'Correct - PRIVACY_FLAG' 
    when dw.PRIVACY_FLAG = fp.PRIVACY_FLAG then 'Correct - PRIVACY_FLAG' 
    else 'Incorrect - PRIVACY_FLAG' 
end as privacy_flag_flag,
dw.IDFT_ISP,
fp.IDFT_ISP as processed_idft_isp,
case 
    when dw.IDFT_ISP is null and fp.IDFT_ISP is null then 'Correct - IDFT_ISP' 
    when dw.IDFT_ISP = fp.IDFT_ISP then 'Correct - IDFT_ISP' 
    else 'Incorrect - IDFT_ISP' 
end as idft_isp_flag,
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
dw.EVENT_TIME,
fp.EVENT_TIME as processed_event_time,
case 
    when dw.EVENT_TIME is null and fp.EVENT_TIME is null then 'Correct - EVENT_TIME'
    when dw.EVENT_TIME = fp.EVENT_TIME then 'Correct - EVENT_TIME' 
    else 'Incorrect - EVENT_TIME' 
end as event_time_flag,
dw.DEVICE_ID,
fp.DEVICE_ID as processed_device_id,
case 
    when dw.DEVICE_ID is null and fp.DEVICE_ID is null then 'Correct - DEVICE_ID' 
    when dw.DEVICE_ID = fp.DEVICE_ID then 'Correct - DEVICE_ID' 
    else 'Incorrect - DEVICE_ID' 
end as device_id_flag,		
dw.USER_IDS,
fp.USER_IDS as processed_user_ids,
case 
    when dw.USER_IDS is null and fp.USER_IDS is null then 'Correct - USER_IDS' 
    when dw.USER_IDS = fp.USER_IDS then 'Correct - USER_IDS' 
    else 'Incorrect - USER_IDS' 
end as user_ids_flag,		
dw.IDAGENT_ENV,
fp.IDAGENT_ENV as processed_idagent_env,
case 
    when dw.IDAGENT_ENV is null and fp.IDAGENT_ENV is null then 'Correct - IDAGENT_ENV' 
    when dw.IDAGENT_ENV = fp.IDAGENT_ENV then 'Correct - IDAGENT_ENV' 
    else 'Incorrect - IDAGENT_ENV' 
end as idagent_env_flag,		
//dw.SPOTLIGHT_REQUEST_ID,
dw.AGENT_STRING,
fp.AGENT_STRING as processed_agent_string,
case 
    when dw.AGENT_STRING is null and fp.AGENT_STRING is null then 'Correct - AGENT_STRING' 
    when dw.AGENT_STRING = fp.AGENT_STRING then 'Correct - AGENT_STRING' 
    else 'Incorrect - AGENT_STRING' 
end as agent_string_flag,
dw.SPOTLIGHT_REQUEST_GUID,
fp.SPOTLIGHT_REQUEST_GUID as processed_spotlight_request_guid,
case 
    when dw.SPOTLIGHT_REQUEST_GUID is null and fp.SPOTLIGHT_REQUEST_GUID is null then 'Correct - SPOTLIGHT_REQUEST_GUID' 
    when dw.SPOTLIGHT_REQUEST_GUID = fp.SPOTLIGHT_REQUEST_GUID then 'Correct - SPOTLIGHT_REQUEST_GUID' 
    else 'Incorrect - SPOTLIGHT_REQUEST_GUID' 
end as spotlight_request_guid_flag,	
dw.QUERY_STRING,
fp.QUERY_STRING as processed_query_string,
case 
    when dw.QUERY_STRING is null and fp.QUERY_STRING is null then 'Correct - QUERY_STRING' 
    when dw.QUERY_STRING = fp.QUERY_STRING then 'Correct - QUERY_STRING' 
    else 'Incorrect - QUERY_STRING'
end as query_string_flag,	
dw.FILE_SOURCE,
dw.LOAD_TIMESTAMP,
dw.RUN_DATEHOUR	
From
    "FT_DB_DEV"."DATA_WAREHOUSE"."SPOT" as dw
Full outer join
     "FT_DB_DEV"."FT_PROCESSED"."SPOT" as fp
    On dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL
    And dw.IDSPOTLIGHT_LOG = fp.IDSPOTLIGHT_LOG
    And dw.EVENT_DATE = fp.EVENT_DATE
Where dw.IDBUSINESS_ENTITY in (6061, 12345, 13642, 13657, 13658, 13659, 13660, 13661)
And dw.event_time >= '2019-08-12 18:00:00'
And dw.event_time <= '2019-08-13 22:00:00'
And (idlog_file_control_flag like 'Incorrect%'
Or idspotlight_log_flag like 'Incorrect%'
Or event_date_flag like 'Incorrect%'
Or idbusiness_entity_flag like 'Incorrect%'
Or idspotlight_flag	like 'Incorrect%'
Or guidn_flag like 'Incorrect%'
Or guidn_created_flag like 'Incorrect%'
Or country_code_flag like 'Incorrect%'
Or metro_code_flag like 'Incorrect%'
Or region_code_flag like 'Incorrect%'
Or city_code_flag like 'Incorrect%'
Or postal_code_flag like 'Incorrect%'
Or idft_connection_speed_flag like 'Incorrect%'
Or idspotlight_group_flag like 'Incorrect%'
Or qval_flag like 'Incorrect%'
Or qref_flag like 'Incorrect%'
Or iab_flag_flag like 'Incorrect%'
Or ipn_flag like 'Incorrect%'
Or idft_agents_cons_flag like 'Incorrect%'	
Or idft_geo_flag like 'Incorrect%'
Or privacy_flag_flag like 'Incorrect%'
Or idft_isp_flag like 'Incorrect%'
Or idft_agent_os_flag like 'Incorrect%'
Or idft_agents_browsers_flag like 'Incorrect%'
Or idft_agents_devices_flag like 'Incorrect%'
Or device_type_flag like 'Incorrect%'	
Or event_time_flag like 'Incorrect%'
Or device_id_flag like 'Incorrect%'		
Or user_ids_flag like 'Incorrect%'	
Or idagent_env_flag like 'Incorrect%'		
Or agent_string_flag like 'Incorrect%'
Or spotlight_request_guid_flag like 'Incorrect%'
Or query_string_flag like 'Incorrect%'
)
