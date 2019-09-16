Select
    a.ACTIVITY_DATE,
    a.IDBUSINESS_ENTITY,
    a.IDCAMPAIGN,
    a.IDSITE,
    a.IDPLACEMENT,
    a.IDFT_AGENTS_DEVICES,	
    a.DEVICE_TYPE,
    a.IDSPOTLIGHT,
    a.POST_IMP_TOTAL,
    ma.POST_IMP_TOTAL as master_post_imp_total,
    case 
        when a.POST_IMP_TOTAL is not null and ma.POST_IMP_TOTAL is null then 'Incorrect - POST_IMP_TOTAL' 
        when a.POST_IMP_TOTAL is null and ma.POST_IMP_TOTAL is not null then 'Incorrect - POST_IMP_TOTAL' 
        when a.POST_IMP_TOTAL is null and ma.POST_IMP_TOTAL is null then 'Correct - POST_IMP_TOTAL'
        when a.POST_IMP_TOTAL != ma.POST_IMP_TOTAL then 'Incorrect - POST_IMP_TOTAL' 
        else 'Correct - POST_IMP_TOTAL' 
    end post_imp_total_flag,   
    a.POST_IMP_TOTAL_VALUE,
    ma.POST_IMP_TOTAL_VALUE as master_post_imp_total_value,
    case 
        when a.POST_IMP_TOTAL_VALUE is not null and ma.POST_IMP_TOTAL_VALUE is null then 'Incorrect - POST_IMP_TOTAL_VALUE' 
        when a.POST_IMP_TOTAL_VALUE is null and ma.POST_IMP_TOTAL_VALUE is not null then 'Incorrect - POST_IMP_TOTAL_VALUE' 
        when a.POST_IMP_TOTAL_VALUE is null and ma.POST_IMP_TOTAL_VALUE is null then 'Correct - POST_IMP_TOTAL_VALUE'
        when a.POST_IMP_TOTAL_VALUE != ma.POST_IMP_TOTAL_VALUE then 'Incorrect - POST_IMP_TOTAL_VALUE' 
        else 'Correct - POST_IMP_TOTAL_VALUE' 
    end post_imp_total_value_flag,  
    a.POST_IMP_COOKIE,
    ma.POST_IMP_COOKIE as master_post_imp_cookie,
    case 
        when a.POST_IMP_COOKIE is not null and ma.POST_IMP_COOKIE is null then 'Incorrect - POST_IMP_COOKIE' 
        when a.POST_IMP_COOKIE is null and ma.POST_IMP_COOKIE is not null then 'Incorrect - POST_IMP_COOKIE' 
        when a.POST_IMP_COOKIE is null and ma.POST_IMP_COOKIE is null then 'Correct - POST_IMP_COOKIE'
        when a.POST_IMP_COOKIE != ma.POST_IMP_COOKIE then 'Incorrect - POST_IMP_COOKIE' 
        else 'Correct - POST_IMP_COOKIE' 
    end post_imp_cookie_flag,      
    a.POST_IMP_IDFA,
    ma.POST_IMP_IDFA as master_post_imp_idfa,
     case 
        when a.POST_IMP_IDFA is not null and ma.POST_IMP_IDFA is null then 'Incorrect - POST_IMP_IDFA' 
        when a.POST_IMP_IDFA is null and ma.POST_IMP_IDFA is not null then 'Incorrect - POST_IMP_IDFA' 
        when a.POST_IMP_IDFA is null and ma.POST_IMP_IDFA is null then 'Correct - POST_IMP_IDFA'
        when a.POST_IMP_IDFA != ma.POST_IMP_IDFA then 'Incorrect - POST_IMP_IDFA' 
        else 'Correct - POST_IMP_IDFA' 
    end post_imp_idfa_flag,     
    a.POST_IMP_D9,
    ma.POST_IMP_D9 as master_post_imp_d9,
     case 
        when a.POST_IMP_D9 is not null and ma.POST_IMP_D9 is null then 'Incorrect - POST_IMP_D9' 
        when a.POST_IMP_D9 is null and ma.POST_IMP_D9 is not null then 'Incorrect - POST_IMP_D9' 
        when a.POST_IMP_D9 is null and ma.POST_IMP_D9 is null then 'Correct - POST_IMP_D9'
        when a.POST_IMP_D9 != ma.POST_IMP_D9 then 'Incorrect - POST_IMP_D9' 
        else 'Correct - POST_IMP_D9' 
    end post_imp_d9_flag,     
    a.POST_IMP_VIEWABLE,
    ma.POST_IMP_VIEWABLE as master_post_imp_viewable,
    case 
        when a.POST_IMP_VIEWABLE is not null and ma.POST_IMP_VIEWABLE is null then 'Incorrect - POST_IMP_VIEWABLE' 
        when a.POST_IMP_VIEWABLE is null and ma.POST_IMP_VIEWABLE is not null then 'Incorrect - POST_IMP_VIEWABLE' 
        when a.POST_IMP_VIEWABLE is null and ma.POST_IMP_VIEWABLE is null then 'Correct - POST_IMP_VIEWABLE'
        when a.POST_IMP_VIEWABLE != ma.POST_IMP_VIEWABLE then 'Incorrect - POST_IMP_VIEWABLE' 
        else 'Correct - POST_IMP_VIEWABLE' 
    end post_imp_viewable_flag,     
    a.POST_IMP_RENDERED,
    ma.POST_IMP_RENDERED as master_post_imp_rendered,
    case 
        when a.POST_IMP_RENDERED is not null and ma.POST_IMP_RENDERED is null then 'Incorrect - POST_IMP_RENDERED' 
        when a.POST_IMP_RENDERED is null and ma.POST_IMP_RENDERED is not null then 'Incorrect - POST_IMP_RENDERED' 
        when a.POST_IMP_RENDERED is null and ma.POST_IMP_RENDERED is null then 'Correct - POST_IMP_RENDERED'
        when a.POST_IMP_RENDERED != ma.POST_IMP_RENDERED then 'Incorrect - POST_IMP_RENDERED' 
        else 'Correct - POST_IMP_RENDERED' 
    end post_imp_rendered_flag,     
    a.POST_IMP_UNDET,
    ma.POST_IMP_UNDET as master_post_imp_undet,
    case 
        when a.POST_IMP_UNDET is not null and ma.POST_IMP_UNDET is null then 'Incorrect - POST_IMP_UNDET' 
        when a.POST_IMP_UNDET is null and ma.POST_IMP_UNDET is not null then 'Incorrect - POST_IMP_UNDET' 
        when a.POST_IMP_UNDET is null and ma.POST_IMP_UNDET is null then 'Correct - POST_IMP_UNDET'
        when a.POST_IMP_UNDET != ma.POST_IMP_UNDET then 'Incorrect - POST_IMP_UNDET' 
        else 'Correct - POST_IMP_UNDET' 
    end post_imp_undet_flag,      
    a.POST_CLICK_TOTAL,
    ma.POST_CLICK_TOTAL as master_post_click_total,
    case 
        when a.POST_CLICK_TOTAL is not null and ma.POST_CLICK_TOTAL is null then 'Incorrect - POST_CLICK_TOTAL' 
        when a.POST_CLICK_TOTAL is null and ma.POST_CLICK_TOTAL is not null then 'Incorrect - POST_CLICK_TOTAL' 
        when a.POST_CLICK_TOTAL is null and ma.POST_CLICK_TOTAL is null then 'Correct - POST_CLICK_TOTAL'
        when a.POST_CLICK_TOTAL != ma.POST_CLICK_TOTAL then 'Incorrect - POST_CLICK_TOTAL' 
        else 'Correct - POST_CLICK_TOTAL' 
    end post_click_total_flag,      
    a.POST_CLICK_TOTAL_VALUE,
    ma.POST_CLICK_TOTAL_VALUE as master_post_click_total_value,
     case 
        when a.POST_CLICK_TOTAL_VALUE is not null and ma.POST_CLICK_TOTAL_VALUE is null then 'Incorrect - POST_CLICK_TOTAL_VALUE' 
        when a.POST_CLICK_TOTAL_VALUE is null and ma.POST_CLICK_TOTAL_VALUE is not null then 'Incorrect - POST_CLICK_TOTAL_VALUE' 
        when a.POST_CLICK_TOTAL_VALUE is null and ma.POST_CLICK_TOTAL_VALUE is null then 'Correct - POST_CLICK_TOTAL_VALUE'
        when a.POST_CLICK_TOTAL_VALUE != ma.POST_CLICK_TOTAL_VALUE then 'Incorrect - POST_CLICK_TOTAL_VALUE' 
        else 'Correct - POST_CLICK_TOTAL_VALUE' 
    end post_click_total_value_flag,     
    a.POST_CLICK_COOKIE,
    ma.POST_CLICK_COOKIE as master_post_click_cookie,
    case 
        when a.POST_CLICK_COOKIE is not null and ma.POST_CLICK_COOKIE is null then 'Incorrect - POST_CLICK_COOKIE' 
        when a.POST_CLICK_COOKIE is null and ma.POST_CLICK_COOKIE is not null then 'Incorrect - POST_CLICK_COOKIE' 
        when a.POST_CLICK_COOKIE is null and ma.POST_CLICK_COOKIE is null then 'Correct - POST_CLICK_COOKIE'
        when a.POST_CLICK_COOKIE != ma.POST_CLICK_COOKIE then 'Incorrect - POST_CLICK_COOKIE' 
        else 'Correct - POST_CLICK_COOKIE' 
    end post_click_cookie_flag,      
    a.POST_CLICK_IDFA,
    ma.POST_CLICK_IDFA as master_post_click_idfa,
    case 
        when a.POST_CLICK_IDFA is not null and ma.POST_CLICK_IDFA is null then 'Incorrect - POST_CLICK_IDFA' 
        when a.POST_CLICK_IDFA is null and ma.POST_CLICK_IDFA is not null then 'Incorrect - POST_CLICK_IDFA' 
        when a.POST_CLICK_IDFA is null and ma.POST_CLICK_IDFA is null then 'Correct - POST_CLICK_IDFA'
        when a.POST_CLICK_IDFA != ma.POST_CLICK_IDFA then 'Incorrect - POST_CLICK_IDFA' 
        else 'Correct - POST_CLICK_IDFA' 
    end post_click_idfa_flag,      
    a.POST_CLICK_D9,
    ma.POST_CLICK_D9 as master_post_click_d9,
    case 
        when a.POST_CLICK_D9 is not null and ma.POST_CLICK_D9 is null then 'Incorrect - POST_CLICK_D9' 
        when a.POST_CLICK_D9 is null and ma.POST_CLICK_D9 is not null then 'Incorrect - POST_CLICK_D9' 
        when a.POST_CLICK_D9 is null and ma.POST_CLICK_D9 is null then 'Correct - POST_CLICK_D9'
        when a.POST_CLICK_D9 != ma.POST_CLICK_D9 then 'Incorrect - POST_CLICK_D9' 
        else 'Correct - POST_CLICK_D9' 
    end post_click_d9_flag,      
    a.POST_IMP_NOSCRIPT,
    ma.POST_IMP_NOSCRIPT as master_post_imp_noscript,
    case 
        when a.POST_IMP_NOSCRIPT is not null and ma.POST_IMP_NOSCRIPT is null then 'Incorrect - POST_IMP_NOSCRIPT' 
        when a.POST_IMP_NOSCRIPT is null and ma.POST_IMP_NOSCRIPT is not null then 'Incorrect - POST_IMP_NOSCRIPT' 
        when a.POST_IMP_NOSCRIPT is null and ma.POST_IMP_NOSCRIPT is null then 'Correct - POST_IMP_NOSCRIPT'
        when a.POST_IMP_NOSCRIPT != ma.POST_IMP_NOSCRIPT then 'Incorrect - POST_IMP_NOSCRIPT' 
        else 'Correct - POST_IMP_NOSCRIPT' 
    end post_imp_noscript_flag,      
    a.POST_IMP_VIEWABLE_VALUE,
    ma.POST_IMP_VIEWABLE_VALUE as master_post_imp_viewable_value,
    case 
        when a.POST_IMP_VIEWABLE_VALUE is not null and ma.POST_IMP_VIEWABLE_VALUE is null then 'Incorrect - POST_IMP_VIEWABLE_VALUE' 
        when a.POST_IMP_VIEWABLE_VALUE is null and ma.POST_IMP_VIEWABLE_VALUE is not null then 'Incorrect - POST_IMP_VIEWABLE_VALUE' 
        when a.POST_IMP_VIEWABLE_VALUE is null and ma.POST_IMP_VIEWABLE_VALUE is null then 'Correct - POST_IMP_VIEWABLE_VALUE'
        when a.POST_IMP_VIEWABLE_VALUE != ma.POST_IMP_VIEWABLE_VALUE then 'Incorrect - POST_IMP_VIEWABLE_VALUE' 
        else 'Correct - POST_IMP_VIEWABLE_VALUE' 
    end post_imp_viewable_value_flag,      
    a.POST_IMP_RENDERED_VALUE,
    ma.POST_IMP_RENDERED_VALUE as master_post_imp_rendered_value,
    case 
        when a.POST_IMP_RENDERED_VALUE is not null and ma.POST_IMP_RENDERED_VALUE is null then 'Incorrect - POST_IMP_RENDERED_VALUE' 
        when a.POST_IMP_RENDERED_VALUE is null and ma.POST_IMP_RENDERED_VALUE is not null then 'Incorrect - POST_IMP_RENDERED_VALUE' 
        when a.POST_IMP_RENDERED_VALUE is null and ma.POST_IMP_RENDERED_VALUE is null then 'Correct - POST_IMP_RENDERED_VALUE'
        when a.POST_IMP_RENDERED_VALUE != ma.POST_IMP_RENDERED_VALUE then 'Incorrect - POST_IMP_RENDERED_VALUE' 
        else 'Correct - POST_IMP_RENDERED_VALUE' 
    end post_imp_rendered_value_flag,      
    a.POST_IMP_UNDET_VALUE,
    ma.POST_IMP_UNDET_VALUE as master_post_imp_undet_value,
    case 
        when a.POST_IMP_UNDET_VALUE is not null and ma.POST_IMP_UNDET_VALUE is null then 'Incorrect - POST_IMP_UNDET_VALUE' 
        when a.POST_IMP_UNDET_VALUE is null and ma.POST_IMP_UNDET_VALUE is not null then 'Incorrect - POST_IMP_UNDET_VALUE' 
        when a.POST_IMP_UNDET_VALUE is null and ma.POST_IMP_UNDET_VALUE is null then 'Correct - POST_IMP_UNDET_VALUE'
        when a.POST_IMP_UNDET_VALUE != ma.POST_IMP_UNDET_VALUE then 'Incorrect - POST_IMP_UNDET_VALUE' 
        else 'Correct - POST_IMP_UNDET_VALUE' 
    end post_imp_undet_value_flag    
From
    "FT_DB_DEV"."AGGREGATIONS"."ATTRIBUTION_AGENT_DEVICE_PLACEMENT_M05" as a
Left join 
    "FT_DB_DEV"."MASTER_AGGREGATIONS"."ATTRIBUTION_AGENT_DEVICE_PLACEMENT_M05" as ma
    On a.ACTIVITY_DATE = ma.ACTIVITY_DATE
    And a.IDBUSINESS_ENTITY = ma.CLIENT_BEID
    And a.IDCAMPAIGN = ma.IDCAMPAIGN
    And a.IDSITE = ma.IDSITE
    And a.IDPLACEMENT = ma.IDPLACEMENT
    And a.IDFT_AGENTS_DEVICES = ma.IDFT_AGENTS_DEVICES
    And a.DEVICE_TYPE = ma.DEVICE_TYPE
    And a.IDSPOTLIGHT = ma.IDSPOTLIGHT


