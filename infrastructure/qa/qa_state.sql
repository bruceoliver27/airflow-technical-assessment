Select
dw.IDLOG_FILE_CONTROL,
fp.IDLOG_FILE_CONTROL as processed_idlog_file_control,
case when dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL then 'Correct - IDLOG_FILE_CONTROL' else 'Incorrect - IDLOG_FILE_CONTROL' end as idlog_file_control_flag,
dw.IDSTATE_LOG,
fp.IDSTATE_LOG as processed_idistate_log,
case when dw.IDSTATE_LOG = fp.IDSTATE_LOG then 'Correct - IDSTATE_LOG' else 'Incorrect - IDSTATE_LOG' end as idstate_log_flag,
dw.EVENT_DATE,
fp.EVENT_DATE as processed_event_date,
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
dw.IDPLACEMENT,
fp.IDPLACEMENT as processed_idplacement,
case 
    when dw.IDPLACEMENT is null and fp.IDPLACEMENT is null then 'Correct - IDPLACEMENT' 
    when dw.IDPLACEMENT = fp.IDPLACEMENT then 'Correct - IDPLACEMENT' 
    else 'Incorrect - IDPLACEMENT' 
end as idplacement_flag,	
//dw.IMPRESSION_ID,
dw.IDCREATIVE,
fp.IDCREATIVE as processed_idcreative,
case 
    when dw.IDCREATIVE is null and fp.IDCREATIVE is null then 'Correct - IDCREATIVE' 
    when dw.IDCREATIVE = fp.IDCREATIVE then 'Correct - IDCREATIVE' 
    else 'Incorrect - IDCREATIVE' 
end as idcreative_flag,	
dw.IDCREATIVE_CONFIG,
fp.IDCREATIVE_CONFIG as processed_idcreative_config,
case 
    when dw.IDCREATIVE_CONFIG is null and fp.IDCREATIVE_CONFIG is null then 'Correct - IDCREATIVE_CONFIG' 
    when dw.IDCREATIVE_CONFIG = fp.IDCREATIVE_CONFIG then 'Correct - IDCREATIVE_CONFIG' 
    else 'Incorrect - IDCREATIVE_CONFIG' 
end as idcreative_config_flag,
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
    "FT_DB_DEV"."DATA_WAREHOUSE"."STATE" as dw
Full outer join 
    "FT_DB_DEV"."FT_PROCESSED"."STATE" as fp
    On dw.IDLOG_FILE_CONTROL = fp.IDLOG_FILE_CONTROL
    And dw.IDSTATE_LOG = fp.IDSTATE_LOG
    And dw.EVENT_DATE = fp.EVENT_DATE
Where dw.IDBUSINESS_ENTITY in (6061, 12345, 13642, 13657, 13658, 13659, 13660, 13661)
And dw.event_time >= '2019-08-12 18:00:00'
And dw.event_time <= '2019-08-13 22:00:00'
And (idlog_file_control_flag like 'Incorrect%'
Or idstate_log_flag like 'Incorrect%'
Or event_date_flag like 'Incorrect%'
Or event_time_flag like 'Incorrect%'
Or idevent_type_flag like 'Incorrect%'
Or idplacement_flag like 'Incorrect%'
Or idcreative_flag like 'Incorrect%'
Or idcreative_config_flag like 'Incorrect%'	
Or ft_product_flag like 'Incorrect%'
Or ft_data_flag like 'Incorrect%'
Or idbusiness_entity_flag like 'Incorrect%'			
Or ft_data_flag like 'Incorrect%'
)
