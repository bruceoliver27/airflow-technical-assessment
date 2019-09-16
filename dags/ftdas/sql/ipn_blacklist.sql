--Line 330
--Business goal is to set the iab_flag of new logs to 'e' if the corresponding IPN is blacklisted

--first update handles case where the ipn_range_end is 0
update ipn --new_logs table
set iab_flag = 'e'
from
    diskdb.ipn_blacklist
where
    diskdb.ipn_blacklist.ipn_range_end = 0
    and target_table.ipn is not null
    and target_table.ipn = diskdb.ipn_blacklist.ipn;

---
--second update handles case where the ipn is within a range. So between ion and ipn_range_end
update ipn --new_logs table
set iab_flag = 'e'
from
    diskdb.ipn_blacklist --diskdb.ipn_exclude
where
    diskdb.ipn_blacklist.ipn_range_end <> 0
    and target_table.ipn between diskdb.ipn_blacklist.ipn and diskdb.ipn_blacklist.ipn_range_end;

---
--first update handles case where the ipn_range_end is 0
update click --new_logs table
set iab_flag = 'e'
from
    diskdb.ipn_blacklist
where
    diskdb.ipn_blacklist.ipn_range_end = 0
    and target_table.ipn is not null
    and target_table.ipn = diskdb.ipn_blacklist.ipn;

---
--second update handles case where the ipn is within a range. So between ion and ipn_range_end
update click --new_logs table
set iab_flag = 'e'
from
    diskdb.ipn_blacklist --diskdb.ipn_exclude
where
    diskdb.ipn_blacklist.ipn_range_end <> 0
    and target_table.ipn between diskdb.ipn_blacklist.ipn and diskdb.ipn_blacklist.ipn_range_end;

---
--first update handles case where the ipn_range_end is 0
update type --new_logs table
set iab_flag = 'e'
from
    diskdb.ipn_blacklist
where
    diskdb.ipn_blacklist.ipn_range_end = 0
    and target_table.ipn is not null
    and target_table.ipn = diskdb.ipn_blacklist.ipn;

---
--second update handles case where the ipn is within a range. So between ion and ipn_range_end
update type --new_logs table
set iab_flag = 'e'
from
    diskdb.ipn_blacklist --diskdb.ipn_exclude
where
    diskdb.ipn_blacklist.ipn_range_end <> 0
    and target_table.ipn between diskdb.ipn_blacklist.ipn and diskdb.ipn_blacklist.ipn_range_end;
