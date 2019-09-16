create table if not exists recent_spotlight_hits (
  idspotlight_log         number(9) default 0,
  idlog_file_control      number(10) default 0,
  idbusiness_entity       number(5) default 0,
  idspotlight             number(8) default 0,
  spot_date               date default '1900-01-01'::date,
  spot_time               time default '00:00:00'::time,
  guidn                   number(20) default 0 comment 'guid number',
  country_code            varchar(2) default null,
  metro_code              number(8) default null,
  city_code               number(8) default 0,
  spot_group              number default 0,
  query_string            varchar(),
  qval                    number(15,2) default 0.00,
  qref                    varchar(150) default null comment 'ft xref if present',
  iab_flag                varchar(1) default 'w',
  ipn                     number(10) default 0 comment 'ip number',
  idft_agents_cons        number(8) default 0,
  privacy_flag            varchar(1) default 'x'
);

create table if not exists one_tag_spotlight_group_period (
  idbusiness_entity       int default 0,
  idspotlight_group       int default 0,
  domain                  varchar(250) default '',
  path                    varchar(250) default '',
  total                   int default 0
);
