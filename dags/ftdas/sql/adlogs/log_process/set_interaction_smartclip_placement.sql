--Line 374 SetInteractionSmartclipPlacement
--Business goal is to take smartclips with idplacement < 13000001 from new log_table, and set their idplacements by comparing the unhex
--codes to the larger database.

update {{ params.database }}.{{ params.transform_schema }}.{{ params.table }} as i --log_table
set idplacement = sc.idplacement
from {{ params.database }}.placement_smartclip as sc
where
    i.unhex_md5_smartclip = sc.unhex_md5_smartclip
    and i.idplacement < 13000001
    and smartclip = 1;


-- update highwinds_int --log_table
-- set idplacement = sc.idplacement
-- from ssc_business.placement_smartclip as sc
-- where
--     highwinds_int.unhex_md5_smartclip = sc.unhex_md5_smartclip
--     and highwinds_int.idplacement < 13000001
--     and smartclip = 1;
