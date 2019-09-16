Select
dw.IDLOG_FILE_CONTROL,
fp.IDLOG_FILE_CONTROL as processed_idlog_file_control,
case when dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL then 'Correct - IDLOG_FILE_CONTROL' else 'Incorrect - IDLOG_FILE_CONTROL' end as idlog_file_control_flag,	
dw.IDTRACK_LOG,
fp.IDSPOTSTATE_LOG as processed_idtrack_log,
case when dw.IDTRACK_LOG = fp.IDSPOTSTATE_LOG then 'Correct - IDTRACK_LOG' else 'Incorrect - IDTRACK_LOG' end as idtrack_log_flag,
dw.EVENT_DATE,
fp.EVENT_DATE as processed_event_Date,
case 
    when dw.EVENT_DATE is null and fp.EVENT_DATE is null then 'Correct - EVENT_DATE' 
    when dw.EVENT_DATE = fp.EVENT_DATE then 'Correct - EVENT_DATE' 
    else 'Incorrect - EVENT_DATE' 
end as event_date_flag,	
dw.EVENT_TIME,
fp.EVENT_TIME as processed_event_time,
case 
    when dw.EVENT_TIME is null and fp.EVENT_TIME is null then 'Correct - EVENT_TIME' 
    when dw.EVENT_TIME = fp.EVENT_TIME then 'Correct - EVENT_TIME' 
    else 'Incorrect - EVENT_TIME' 
end as event_time_flag,	
dw.IDEVENT_TYPE,
fp.IDEVENT_TYPE as processed_idevent_type,
case 
    when dw.IDEVENT_TYPE is null and fp.IDEVENT_TYPE is null then 'Correct - IDEVENT_TYPE' 
    when dw.IDEVENT_TYPE = fp.IDEVENT_TYPE then 'Correct - IDEVENT_TYPE' 
    else 'Incorrect - IDEVENT_TYPE' 
end as idevent_type_flag,
dw.IDSPOTLIGHT,
fp.IDSPOTLIGHT as processed_idspotlight,
case 
    when dw.IDSPOTLIGHT is null and fp.IDSPOTLIGHT is null then 'Correct - IDSPOTLIGHT'
    when dw.IDSPOTLIGHT = fp.IDSPOTLIGHT then 'Correct - IDSPOTLIGHT' 
    else 'Incorrect - IDSPOTLIGHT' 
end as idspotlight_flag,	
dw.IDSPOTLIGHT_GROUP,
fp.IDSPOTLIGHT_GROUP as processed_idspotlight_group,
case 
    when dw.IDSPOTLIGHT_GROUP is null and fp.IDSPOTLIGHT_GROUP is null then 'Correct - IDSPOTLIGHT_GROUP' 
    when dw.IDSPOTLIGHT_GROUP = fp.IDSPOTLIGHT_GROUP then 'Correct - IDSPOTLIGHT_GROUP' 
    else 'Incorrect - IDSPOTLIGHT_GROUP' 
end as idspotlight_group_flag,	
//dw.SPOTLIGHT_REQUEST_ID,		
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
    when dw.IDBUSINESS_ENTITY is null and fp.IDBUSINESS_ENTITY is null then 'Correct - IDBUSINESS_ENTITY' 
    when dw.IDBUSINESS_ENTITY = fp.IDBUSINESS_ENTITY then 'Correct - IDBUSINESS_ENTITY' 
    else 'Incorrect - IDBUSINESS_ENTITY' 
end as idbusiness_entity_flag,			
dw.SPOTLIGHT_REQUEST_GUID,
fp.SPOTLIGHT_REQUEST_GUID as processed_spotlight_request_guid,
case 
    when dw.SPOTLIGHT_REQUEST_GUID is null and fp.SPOTLIGHT_REQUEST_GUID is null then 'Correct - SPOTLIGHT_REQUEST_GUID' 
    when dw.SPOTLIGHT_REQUEST_GUID = fp.SPOTLIGHT_REQUEST_GUID then 'Correct - SPOTLIGHT_REQUEST_GUID' 
    else 'Incorrect - SPOTLIGHT_REQUEST_GUID' 
end as spotlight_request_guid_flag,			
dw.FILE_SOURCE,
dw.LOAD_TIMESTAMP,
dw.RUN_DATEHOUR				
From
    "FT_DB_DEV"."DATA_WAREHOUSE"."TRACK" as dw
Full outer join 
    "FT_DB_DEV"."FT_PROCESSED"."TRACK" as fp
    On dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL 
    And dw.IDTRACK_LOG = fp.IDSPOTSTATE_LOG
    And dw.EVENT_DATE = fp.EVENT_DATE
Where dw.IDBUSINESS_ENTITY in (6061, 12345, 13642, 13657, 13658, 13659, 13660, 13661)
And dw.event_time >= '2019-08-12 18:00:00'
And dw.event_time <= '2019-08-13 22:00:00'
And (idlog_file_control_flag like 'Incorrect%'
Or idtrack_log_flag like 'Incorrect%'	
Or event_date_flag like 'Incorrect%'
Or event_time_flag like 'Incorrect%'		
Or idevent_type_flag like 'Incorrect%'	
Or idspotlight_flag like 'Incorrect%'	
Or idspotlight_group_flag like 'Incorrect%'	
Or ft_product_flag like 'Incorrect%'
Or ft_data_flag like 'Incorrect%'
Or idbusiness_entity_flag like 'Incorrect%'			
Or spotlight_request_guid_flag like 'Incorrect%'
)
