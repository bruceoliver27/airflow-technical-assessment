Select 
dw.IDLOG_FILE_CONTROL,
fp.IDLOG_FILE_CONTROL as processed_idlog_file_control,
case when dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL then 'Correct - IDLOG_FILE_CONTROL' else 'Incorrect - IDLOG_FILE_CONTROL' end as idlog_file_control_flag,
dw.IDCLICK_LOG,
fp.IDCLICK_LOG as processed_idclick_log,
case when dw.IDCLICK_LOG = fp.IDCLICK_LOG then 'Correct - IDCLICK_LOG' else 'Incorrect - IDCLICK_LOG' end as idclick_log_flag,
dw.EVENT_DATE,
fp.EVENT_DATE as processed_event_Date,
case 
    when dw.EVENT_DATE is null and fp.EVENT_DATE is null then 'Correct - EVENT_DATE' 
    when dw.EVENT_DATE = fp.EVENT_DATE then 'Correct - EVENT_DATE' 
    else 'Incorrect - EVENT_DATE' 
end as event_date_flag,
dw.IDPLACEMENT,
fp.IDPLACEMENT as processed_idplacement,
case 
    when dw.IDPLACEMENT is null and fp.IDPLACEMENT is null then 'Correct - IDPLACEMENT' 
    when dw.IDPLACEMENT = fp.IDPLACEMENT then 'Correct - IDPLACEMENT' 
    else 'Incorrect - IDPLACEMENT' 
end as idplacement_flag,
dw.IDCREATIVE,
fp.IDCREATIVE as processed_idcreative,
case 
    when dw.IDCREATIVE is null and fp.IDCREATIVE is null then 'Correct - IDCREATIVE' 
    when dw.IDCREATIVE = fp.IDCREATIVE then 'Correct - IDCREATIVE' 
    else 'Incorrect - IDCREATIVE' 
end as idcreative_flag,
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
dw.GUIDN,
fp.GUIDN as processed_GUIDN,
case 
    when dw.GUIDN is null and fp.GUIDN is null then 'Correct - GUIDN' 
    when dw.GUIDN = fp.GUIDN then 'Correct - GUIDN' 
    else 'Incorrect - GUIDN' 
end as guidn_flag,
dw.IDEVENT_TYPE,
fp.IDEVENT_TYPE as processed_idevent_type,
case 
    when dw.IDEVENT_TYPE = fp.IDEVENT_TYPE then 'Correct - IDEVENT_TYPE' 
    when dw.IDEVENT_TYPE = fp.IDEVENT_TYPE then 'Correct - IDEVENT_TYPE' 
    else 'Incorrect - IDEVENT_TYPE' 
end as idevent_type_flag,
dw.IAB_FLAG,
fp.IAB_FLAG as processed_iab_flag,
case 
    when dw.IAB_FLAG is null and fp.IAB_FLAG is null then 'Correct - IAB_FLAG' 
    when dw.IAB_FLAG = fp.IAB_FLAG then 'Correct - IAB_FLAG' 
    else 'Incorrect - IAB_FLAG' 
end as iab_flag_flag,
dw.RULE_FLAGS,
fp.RULE_FLAGS as processed_rule_flag,
case 
    when dw.RULE_FLAGS is null and fp.RULE_FLAGS is null then 'Correct - RULE_FLAGS'
    when dw.RULE_FLAGS = fp.RULE_FLAGS then 'Correct - RULE_FLAGS' 
    else 'Incorrect - RULE_FLAGS' 
end as rule_flags_flag,
dw.IDAD_INDEX,
fp.IDAD_INDEX as processed_idad_index,
case 
    when dw.IDAD_INDEX is null and fp.IDAD_INDEX is null then 'Correct - IDAD_INDEX' 
    when dw.IDAD_INDEX = fp.IDAD_INDEX then 'Correct - IDAD_INDEX' 
    else 'Incorrect - IDAD_INDEX' 
end as idad_index_flag,
dw.IDFT_GEO,
fp.IDFT_GEO as processed_idft_geo,
case 
    when dw.IDFT_GEO is null and fp.IDFT_GEO is null then 'Correct - IDFT_GEO' 
    when dw.IDFT_GEO = fp.IDFT_GEO then 'Correct - IDFT_GEO' 
    else 'Incorrect - IDFT_GEO' 
end as idft_geo_flag,
dw.IPN,
fp.IPN as processed_ipn,
case 
    when dw.IPN is null and fp.IPN is null then 'Correct - IPN' 
    when dw.IPN = fp.IPN then 'Correct - IPN' 
    else 'Incorrect - IPN' 
end as ipn_flag,
dw.IDSITE,
fp.IDSITE as processed_idsite,
case 
    when dw.IDSITE is null and fp.IDSITE is null then 'Correct - IDSITE' 
    when dw.IDSITE = fp.IDSITE then 'Correct - IDSITE' 
    else 'Incorrect - IDSITE' 
end as idsite_flag,
dw.FT_CUSTOM,
fp.FT_CUSTOM as processed_ft_custom,
case 
    when dw.FT_CUSTOM is null and fp.FT_CUSTOM is null then 'Correct - FT_CUSTOM' 
    when dw.FT_CUSTOM = fp.FT_CUSTOM then 'Correct - FT_CUSTOM' 
    else 'Incorrect - FT_CUSTOM' 
end as ft_custom_flag,
dw.IDFT_AGENTS_CONS,
fp.IDFT_AGENTS_CONS as processed_idft_agents_cons,
case 
    when dw.IDFT_AGENTS_CONS is null and fp.IDFT_AGENTS_CONS is null then 'Correct - IDFT_AGENTS_CONS' 
    when dw.IDFT_AGENTS_CONS = fp.IDFT_AGENTS_CONS then 'Correct - IDFT_AGENTS_CONS' 
    else 'Incorrect - IDFT_AGENTS_CONS' 
end as idft_agents_cons_flag,
//dw.IDLOG_KEYWORD,
dw.FT_SECTION,
fp.FT_SECTION as processed_ft_section,
case 
    when dw.ft_section is null and fp.ft_section is null then 'Correct - FT_SECTION' 
    when dw.ft_section = fp.ft_section then 'Correct - FT_SECTION' 
    else 'Incorrect - FT_SECTION' 
end as ft_section_flag,
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
dw.EVENT_TIME,
fp.EVENT_TIME as processed_event_time,
case 
    when dw.EVENT_TIME is null and fp.EVENT_TIME is null then 'Correct - EVENT_TIME' 
    when dw.EVENT_TIME = fp.EVENT_TIME then 'Correct - EVENT_TIME' 
    else 'Incorrect - EVENT_TIME' 
end as event_time_flag,
//dw.DEVICE_ID_EXPIRE_TIME,
//dw.DEVICE_ID_MATCH_TYPE,
dw.IMPRESSION_ID,
fp.IMPRESSION_ID as processed_impression_id,
case 
    when dw.IMPRESSION_ID is null and fp.IMPRESSION_ID is null then 'Correct - IMPRESSION_ID' 
    when dw.IMPRESSION_ID = fp.IMPRESSION_ID then 'Correct - IMPRESSION_ID' 
    else 'Incorrect - IMPRESSION_ID' 
 end as impression_id_flag,
dw.IDAGENT_ENV,
fp.IDAGENT_ENV as processed_idagent_env,
case 
    when dw.IDAGENT_ENV is null and fp.IDAGENT_ENV is null then 'Correct - IDAGENT_ENV'
    when dw.IDAGENT_ENV = fp.IDAGENT_ENV then 'Correct - IDAGENT_ENV' 
    else 'Incorrect - IDAGENT_ENV' 
end as idagent_env_flag,
//dw.LOG_KEYWORDS,
dw.FT_PRODUCT,
fp.FT_PRODUCT as processed_ft_product,
case 
    when dw.FT_PRODUCT is null and fp.FT_PRODUCT is null then 'Correct - FT_PRODUCT' 
    when dw.FT_PRODUCT = fp.FT_PRODUCT then 'Correct - FT_PRODUCT' 
    else 'Incorrect - FT_PRODUCT' 
end as ft_product_flag,
dw.FT_DATA,
fp.FT_DATA as processed_ft_data,
case 
    when dw.FT_DATA is null and fp.FT_DATA is null then 'Correct - FT_DATA' 
    when dw.FT_DATA = fp.FT_DATA then 'Correct - FT_DATA' 
    else 'Incorrect - FT_DATA' 
end as ft_data_flag,
dw.IDBUSINESS_ENTITY,
fp.IDBUSINESS_ENTITY as processed_idbusiness_entity,
case 
    when dw.IDBUSINESS_ENTITY is null and  fp.IDBUSINESS_ENTITY is null then 'Correct - IDBUSINESS_ENTITY' 
    when dw.IDBUSINESS_ENTITY = fp.IDBUSINESS_ENTITY then 'Correct - IDBUSINESS_ENTITY' 
    else 'Incorrect - IDBUSINESS_ENTITY' 
end as idbusiness_entity_flag,
dw.FT_TPPLID,
fp.FT_TPPLID as processed_ft_tpplid,
case 
    when dw.FT_TPPLID is null and fp.FT_TPPLID is null then 'Correct - FT_TPPLID' 
    when dw.FT_TPPLID = fp.FT_TPPLID then 'Correct - FT_TPPLID' 
    else 'Incorrect - FT_TPPLID' 
end as ft_tpplid_flag,
dw.FT_C1,
fp.FT_C1 as processed_ft_c1,
case 
    when dw.FT_C1 is null and fp.FT_C1 is null then 'Correct - FT_C1' 
    when dw.FT_C1 = fp.FT_C1 then 'Correct - FT_C1' 
    else 'Incorrect - FT_C1' 
end as ft_c1_flag,
dw.FT_C2,
fp.FT_C2 as processed_ft_c2,
case 
    when dw.FT_C2 is null and fp.FT_C2 is null then 'Correct - FT_C2' 
    when dw.FT_C2 = fp.FT_C2 then 'Correct - FT_C2' 
    else 'Incorrect - FT_C2' 
end as ft_c2_flag,
dw.FT_C3,
fp.FT_C3 as processed_ft_c3,
case 
    when dw.FT_C3 is null and fp.FT_C3 is null then 'Correct - FT_C3' 
    when dw.FT_C3 = fp.FT_C3 then 'Correct - FT_C3' 
    else 'Incorrect - FT_C3' 
end as ft_c3_flag,
dw.AGENT_STRING,
fp.AGENT_STRING as processed_agent_string,
case 
    when dw.AGENT_STRING is null and fp.AGENT_STRING is null then 'Correct - AGENT_STRING' 
    when dw.AGENT_STRING = fp.AGENT_STRING then 'Correct - AGENT_STRING' 
    else 'Incorrect - AGENT_STRING' 
end as agent_string_flag,
dw.IMPRESSION_GUID,
fp.IMPRESSION_GUID as processed_impression_guid,
case 
    when dw.IMPRESSION_GUID is null and fp.IMPRESSION_GUID is null then 'Correct - IMPRESSION_GUID' 
    when dw.IMPRESSION_GUID = fp.IMPRESSION_GUID then 'Correct - IMPRESSION_GUID' 
    else 'Incorrect - IMPRESSION_GUID' 
end as impression_guid_flag,
dw.FILE_SOURCE,
dw.LOAD_TIMESTAMP,
dw.RUN_DATEHOUR
From
    "FT_DB_DEV"."DATA_WAREHOUSE"."CLICK" as dw
Full outer join
    "FT_DB_DEV"."FT_PROCESSED"."CLICK" as fp
    On dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL
    And dw.IDCLICK_LOG = fp.IDCLICK_LOG
    And dw.EVENT_DATE = fp.EVENT_DATE
Where dw.IDBUSINESS_ENTITY in (6061, 12345, 13642, 13657, 13658, 13659, 13660, 13661)
And dw.event_time >= '2019-08-12 18:00:00'
And dw.event_time <= '2019-08-13 22:00:00'
And (idlog_file_control_flag like 'Incorrect%'
Or idclick_log_flag like 'Incorrect%'
Or event_date_flag like 'Incorrect%'
Or idplacement_flag like 'Incorrect%'
Or idcreative_flag like 'Incorrect%'
Or idcampaign_flag like 'Incorrect%'
Or idcreative_config_flag like 'Incorrect%'
Or guidn_flag like 'Incorrect%'
Or idevent_type_flag like 'Incorrect%'
Or iab_flag_flag like 'Incorrect%'
Or rule_flags_flag like 'Incorrect%'
Or idad_index_flag like 'Incorrect%'
Or idft_geo_flag like 'Incorrect%'
Or ipn_flag like 'Incorrect%'
Or idsite_flag like 'Incorrect%'
Or ft_custom_flag like 'Incorrect%'
Or idft_agents_cons_flag like 'Incorrect%'
Or ft_section_flag like 'Incorrect%'
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
Or event_time_flag like 'Incorrect%'
Or idagent_env_flag like 'Incorrect%'
Or ft_product_flag like 'Incorrect%'
Or ft_data_flag like 'Incorrect%'
Or idbusiness_entity_flag like 'Incorrect%'
Or ft_tpplid_flag like 'Incorrect%'
Or ft_c1_flag like 'Incorrect%'
Or ft_c2_flag like 'Incorrect%'
Or ft_c3_flag like 'Incorrect%'
Or agent_string_flag like 'Incorrect%'
Or impression_guid_flag like 'Incorrect%'
)


