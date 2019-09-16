Select
    a.ACTIVITY_DATE,
    a.IDBUSINESS_ENTITY,
    a.IDCAMPAIGN,
    a.IDSITE,
    a.COUNTRY_CODE,
    a.REGION_CODE,
    a.IDEVENT_TYPE,
    a.TOTAL,
    ma.TOTAL as master_total_time,
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
    end total_time_flag
From
    "FT_DB_DEV"."AGGREGATIONS"."GEO_REGION_PLACEMENT_EVENT_M05" as a
Left join 
    "FT_DB_DEV"."MASTER_AGGREGATIONS"."GEO_REGION_PLACEMENT_EVENT_M05" as ma
    On a.ACTIVITY_DATE = ma.ACTIVITY_DATE
    And a.IDBUSINESS_ENTITY = ma.CLIENT_BEID
    And a.IDCAMPAIGN = ma.IDCAMPAIGN
    And a.IDSITE = ma.IDSITE
    And a.COUNTRY_CODE = ma.COUNTRY_CODE
    And a.REGION_CODE = ma.REGION_CODE
    And a.IDEVENT_TYPE = ma.IDEVENT_TYPE

