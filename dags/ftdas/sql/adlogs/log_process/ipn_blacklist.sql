update ft_db_{{ params.env }}.{{ params.transform_schema }}.{{ params.table }} as i--new_logs table
set iab_flag = 'e'
from
    {{ params.database }}.{{ params.business_schema }}.ipn_exclude as a
where
    a.ipn_range_end = 0
    and i.ipn is not null
    and i.ipn = a.ipn;

---

--second update handles case where the ipn is within a range. So between ion and ipn_range_end
update {{ params.database }}.{{ params.transform_schema }}.{{ params.table }} as i--new_logs table
set iab_flag = 'e'
from
    {{ params.database }}.{{ params.business_schema }}.ipn_exclude as a
where
    a.ipn_range_end <> 0
    and i.ipn between a.ipn and a.ipn_range_end;
