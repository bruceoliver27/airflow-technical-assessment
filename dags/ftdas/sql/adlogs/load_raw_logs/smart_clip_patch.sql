--Line 344
--Business goal is to elimnate records with invalid smartclips, send those rows to an admin table for review, and
--then update idplacements of the new logs (after they've been purged) by comparing the unhex codes to the larger db.

-- ***** idevent_type may need to be event ******

--update TYPE_CLICK to eliminate invalid smartclip rows
update click
set iab_flag = 's'
where (
    (
    idplacement = 0
    or ft_section is null
    or ft_section not regexp '^[0-9a-zA-Z_.-]+\.[0-9a-zA-Z]+_[0-9]+x[0-9]+$')

    and iab_flag in ('w', 'x'));

---
--create admin table filled with recently purged smartclips for review
create or replace table click_purged_smartclip_rows as
(
select
    idplacement,
    idcampaign,
    idevent_type,
    event_date,
    idcreative,
    coalesce(ft_section,'') as ft_section,
    row_number() as 'count'
from
    click
where
    idevent_type in (261, 262)
    and iab_flag = 's'
);

---

--update TYPE_CLICK to set idplacements for the valid smartclips. Do this by comparing the unhex codes
--between TYPE_CLICK and the larger db.
update click
set idplacement = sq.idplacement
from ssc_business.placement_smartclip as sc
where
    idevent_type in (261, 262)
    and sc.unhex_md5_smartclip = click.unhex_md5_smartclip;

---

--update TYPE_IMPRESSION to eliminate invalid smartclip rows
update imp
set iab_flag = 's'
where (
    (
    idplacement = 0
    or ft_section is null
    or ft_section not regexp '^[0-9a-zA-Z_.-]+\.[0-9a-zA-Z]+_[0-9]+x[0-9]+$')

    and iab_flag in ('w', 'x'));

---
--create admin table filled with recently purged smartclips for review
create or replace table imp_purged_smartclip_rows as
(
select
    idplacement,
    idcampaign,
    idevent_type,
    event_date,
    idcreative,
    coalesce(ft_section,'') as ft_section,
    row_number() as 'count'
from
    imp
where
    idevent_type in (261, 262)
    and iab_flag = 's'
);

---

--update TYPE_IMPRESSION to set idplacements for the valid smartclips. Do this by comparing the unhex codes
--between TYPE_IMPRESSION and the larger db.
update imp
set idplacement = sq.idplacement
from ssc_business.placement_smartclip as sc
where
    idevent_type in (261, 262)
    and sc.unhex_md5_smartclip = imp.unhex_md5_smartclip;
