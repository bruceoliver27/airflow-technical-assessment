create schema if not exists ft_db_{{ params.env }}.ps_xre;

---

use schema ft_db_{{ params.env }}.ps_xre;

---

create table if not exists ft_db_{{ params.env }}.ps_xre.ps_xre.brand (
  idbrand           number(5),
  brand_name        varchar(250),
  idbusiness_entity number(8),
  status_value      number(3) default 50,
  date_last_update  timestamp_ntz default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.business_entity (
  idbusiness_entity                number(38, 0),
  idprimary_business_entity	       number(38, 0),
  idbusiness_entity_type	         number(38, 0),
  ft_dept                          number(38, 0),
  entity_name	                     varchar(),
  email_address	                   varchar(),
  primary_site_id	                 number(38, 0),
  addr_1	                         varchar(),
  addr_2	                         varchar(),
  town	                           varchar(),
  county	                         varchar(),
  country	                         varchar(),
  post_code	                       varchar(),
  primary_idcontact	               number(38, 0),
  phone	                           varchar(),
  date_last_update	               timestamp_ntz,
  notinuse	                       varchar(),
  report_all_placements	           varchar(),
  report_priority	                 varchar(),
  report_cpa_filter	               varchar(),
  spotscan_options	               varchar(),
  min_cookie_age_for_uniques	     varchar(),
  mask_ipn	                       varchar(),
  gmt_offset                       number(38, 0)
)
comment = 'flashtalking meta data, business_entity'
;

---

create table if not exists ft_db_{{ params.env }}.ps_xre.campaign (
  idcampaign                  number(38, 0),
  status_value                number(38, 0),
  campaign_name               varchar(),
  date_start                  timestamp_ntz,
  date_end                    timestamp_ntz,
  date_closed                 timestamp_ntz,
  closure_status              varchar(),
  reporting_currency          varchar(),
  auto_close                  varchar(),
  end_date_extended_count     varchar(),
  client_beid                 number(38, 0),
  mediabuyer_beid             number(38, 0),
  mediabuyer_email            varchar(),
  number_of_placements        number(38, 0),
  adindex_count               number(38, 0),
  test_only                   varchar(),
  date_last_update            timestamp_ntz,
  impressions_todate          number(38, 0),
  todays_impressions          number(38, 0),
  clicks_todate               number(38, 0),
  todays_clicks               number(38, 0),
  idspotlight_group           number(38, 0),
  idspotlight_group2          number(38, 0),
  idspotlight_group3          number(38, 0),
  idspotlight_group4          number(38, 0),
  spotlight_count             number(38, 0),
  spotscan_options            varchar(),
  do_unique_placement         varchar(),
  upi_row_count               number(38, 0),
  do_unique_sample            varchar(),
  min_cookie_age_for_uniques  varchar(),
  date_overlap_run            timestamp_ntz,
  runtime_overlap             timestamp_ntz,
  do_freq_view                varchar(),
  imp_overrun_thld            varchar(),
  click_overrun_thld          varchar(),
  do_rep_set                  varchar(),
  pagefold                    varchar(),
  gmt_offset                  number(38, 0),
  campaign_processing_type    varchar(),
  uniques_table_modulo        varchar(),
  idconversion_type           varchar(),
  idfa_conversion_window      varchar(),
  uas_conversion_window       varchar(),
  mask_ipn                    varchar(),
  id_report_table_map_set     varchar()
)
comment = 'flashtalking meta data, campaign'
;

---

create table if not exists ft_db_{{ params.env }}.ps_xre.campaign_ext (
  idcampaign        number(9) default 0,
  idchannel         number(3) default 1,
  idbrand           number(5) default 0,
  date_last_update  timestamp_ntz default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.channel (
  idchannel           number(5) default 0,
  channel_name        varchar(250),
  idbusiness_entity   number(8),
  status_value        number(3) default 50,
  date_last_update    timestamp_ntz default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.charging_method (
  idcharging_method   number(3),
  charge_type         varchar(4) default null,
  description         varchar,
  calculation         varchar comment 'describes how to calculate total charge for this method',
  in_use              char(1) default 'y',
  date_last_update    timestamp_ntz default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.creative (
  idcreative                number(8),
  status_value              number(3) default 0,
  description               varchar(100) default null,
  filename                  varchar(100) default null,
  keyword                   varchar(100) default null,
  extract_filesize          number(10) default null,
  clicktags                 number(3) default null,
  width                     number(5) default null,
  height                    number(5) default null,
  expandedwidth             number(5) default null,
  expandedheight            number(5) default null,
  indentacross              number(5) default null,
  indentdown                number(5) default null,
  closeafter                number(5) default null,
  xmlfile                   varchar(100) default null,
  date_last_update          timestamp_ntz default current_timestamp,
  approval_id               number(5) default null,
  placementsetupversion     number(3) default null,
  flashversion              number(3) default null,
  reject_notes              text,
  instantad                 char(1) default '0',
  flashtalking              char(1) default null,
  linked                    char(1) default null,
  gif                       char(1) default null,
  richload                  char(1) default null,
  idcampaign_creative       number(9) default 0,
  creative_type             varchar(10) default null,
  display_type              varchar(20) default 'onpage',
  rep_adtype                number(3) default 0 comment 'reporting ad type',
  idcreative_group1         number(5) default 0,
  idcreative_group2         number(5) default 0
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.creative_group (
  idcreative_group  number(5),
  description       varchar(100),
  client_beid       number(6),
  status_value      number(4) default 50,
  date_last_update  timestamp_ntz default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.event_type (
  idevent_type                number(5) default 0,
  description                 varchar(40) default null
) ;

---

create table if not exists ft_db_{{ params.env }}.ps_xre.geo_city (
  idgeo_city_code   number(9) default 0,
  city_name   varchar(255) default null,
  latitude    number(7, 4) default 0.0000,
  longitude   number(7, 4) default 0.0000
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.geo_country (
  country_code    varchar(9) default '**',
  continent_name  varchar(2) default null,
  country_name    varchar(100) default null
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.geo_metro (
  idgeo_metro_code  number(9),
  metro_name        varchar(50) default null,
  latitude          number(7, 4) default 0.0000,
  longitude         number(7, 4) default 0.0000
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.geo_region (
  idgeo_region_code   number(5) default 0,
  region_name         varchar(50) default null,
  region_code         varchar(9) default null
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.isp (
  id_isp        number(8),
  isp_name      varchar(200),
  carrier_type  char(1) default 'f' comment 'm = mobile f = fixed'
) COMMENT='imported data from netacuity';

---

create table if not exists ft_db_{{ params.env }}.ps_xre.placement (
  idplacement                 number(8),
  idsite                      number(9) default 0,
  idcharging_method_media     number(4) default 1,
  idcharging_method_ft        number(4) default 1,
  idmarket                    number(6) default 2,
  market_abbr                 varchar(4) default '',
  idcampaign                  number(9) default 0,
  status_value                number(3) default 0,
  description                 varchar(250) default null,
  ad_group_name               varchar(100) default null,
  placementorder              number(5) default null,
  placementshow               number(4) default 1,
  notes                       varchar(250) default null,
  special_routine_name        varchar(50) default null,
  impression_limit            number(10) default null,
  allowable_overrun           number(5) default null,
  impressions_todate          number(10) default null,
  todays_impressions          number(10) default null,
  clicks_todate               number(38) default 0,--was number(8)
  todays_clicks               number(8) default 0,
  est_click_thru_rate         number(3, 2) default null,
  est_cpc                     number(5, 3) default null,
  est_costperconv             number(6, 3) default null,
  xre_rules_valid             varchar(1) default 'n' comment 'have all the xre rules been validated',
  number_xre_rules            number(4) default 1 comment 'currently only 1 rule is supported but this is for future',
  update_imp                  varchar(1) default 'n',
  media_charge_unit_cost      number(10, 4) default 0.0000,
  ft_charge_unit_cost         number(10, 4) default 0.0000,
  booked_cost                 number(10, 2) default 0.00,
  booked_cost_todate          number(10) default 0,
  cost_constraint_type        varchar(1) default 'n',
  cost_cap_period             number(3) default 0,
  effective_media_cost        number(10, 4) default 0.0000,
  dimensions                  varchar(10) default null,
  placeholder                 varchar(250) default null,
  idadbundle                  number(38) default 0, --was number(5)
  idinsert                    number(9) default null,
  charge_currency             varchar(3) default 'gbp',
  prod_status_value           number(3) default null,
  date_last_update            timestamp_ntz default current_timestamp,
  date_start                  date default null,
  date_end                    date default null,
  search                      varchar(1) default 'n',
  channel_type                number(3) default 1,
  reporting_set               varchar(1) default 'n',
  idrep_set_leader            number(8) default 0,
  rep_set_name                varchar(80) default null,
  third_party_id              varchar(250) default null,
  idplacement_category        number(5) default 0,
  idplacement_strategy        number(5) default 0,
  ad_gap_id                   varchar(50) default '',
  idplacement_target          number(3) default 0
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.placement_category (
  idplacement_category  number(5),
  description           varchar(100),
  client_beid           number(6),
  status_value          number(4) default 50,
  date_last_update      timestamp_ntz default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.placement_creative (
  idplacement_creative  number(8),
  idcreative            number(8) default 0,
  idplacement           number(8) default 0,
  creative_order        number(3) default null,
  pc_file_status        char(1) default null,
  pc_file_url           varchar(100) default null,
  status_value          number(3) default null,
  idtemplate            number(5) default null,
  third_party_id        varchar(250) default null comment 'arbitrary char that identify this in 3rd party system',
  date_last_update      timestamp_ntz default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.placement_smartclip (
  idplacement                     number(8),
  idsite                          number(9) default 0,
  idcharging_method_media         number(4) default 1,
  idcharging_method_ft            number(4) default 1,
  idmarket                        number(6) default 2,
  market_abbr                     varchar(4) default '',
  idcampaign                      number(9) default 0,
  status_value                    number(3) default 0,
  description                     varchar(250) default null,
  ad_group_name                   varchar(100) default null,
  placementorder                  number(5) default null,
  placementshow                   number(4) default 1,
  notes                           varchar(250) default null,
  alt_image                       varchar(100) default null,
  special_routine_name            varchar(50) default null,
  impression_limit                number(10) default null,
  allowable_overrun               number(5) default null,
  impressions_todate              number(10) default null,
  todays_impressions              number(10) default null,
  fvpercent                       number(5, 4) default 1.0000 comment 'frequency view percent',
  clicks_todate                   number(8) default 0,
  todays_clicks                   number(8) default 0,
  est_click_thru_rate             number(3,2) default null,
  est_cpc                         number(5, 3) default null,
  est_costperconv                 number(6, 3) default null,
  xre_rules_valid                 char(1) default 'n' comment 'have all the xre rules been validated',
  number_xre_rules                number(4) default 1 comment 'currently only 1 rule is supported but this is for future',
  update_imp                      char(1) default 'n',
  media_charge_unit_cost          number(10, 4) default 0.0000,
  ft_charge_unit_cost             number(10, 4) default 0.0000,
  booked_cost                     number(10, 2) default 0.00,
  booked_cost_todate              number(10) default 0,
  cost_constraint_type            char(1) default 'n',
  cost_cap_period                 number(3) default 0,
  effective_media_cost            number(10, 4) default 0.0000,
  dimensions                      varchar(10) default null,
  placeholder                     varchar(150) default null,
  idadbundle                      number(5) default 0,
  idinsert                        number(9) default null,
  charge_currency                 char(3) default 'gbp',
  prod_status_value               number(3) default null,
  date_last_update                timestamp_ntZ default current_timestamp,
  date_start                      date default null,
  date_end                        date default null,
  search                          char(1) default 'n',
  click_tracking                  char(1) default 'n',
  unq_data_unprocessed            char(1) default 'y',
  unq_daily_date                  char(6) default '999999' comment 'unq daily ran for this impression file. 0 dont process 999999 awaiting todays run',
  channel_type                    number(3) default 1,
  reporting_set                   char(1) default 'n',
  idrep_set_leader                number(8) default 0,
  rep_set_name                    varchar(80) default null,
  third_party_id                  varchar(250) default null,
  idplacement_category            number(5) default 0,
  idplacement_strategy            number(5) default 0,
  do_fed_update                   char(1) default 'y',
  idplacement_master              number(8) comment 'id of the original placement in palcement table',
  unhex_md5_smartclip             binary(16) comment 'smartclip site name key -same as placement name'
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.placement_strategy (
  idplacement_strategy    number(5),
  description             varchar(100),
  client_beid             number(6),
  status_value            number(4) default 50,
  date_last_update        timestamp_ntz default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.spotlight (
  idspotlight               number(38, 0),
  idspotlight_group         number(38, 0),
  spotlight_type            varchar(),
  idsite                    number(38, 0),
  idbusiness_entity         number(38, 0),
  ipexclude_group           varchar(),
  description               varchar(),
  date_added                varchar(),
  date_defunct              varchar(),
  closure_status            varchar(),
  date_closed               varchar(),
  do_not_report             varchar(),
  report_rates              varchar(),
  status_value              number(38, 0),
  active                    varchar(),
  goal                      varchar(),
  currency                  varchar(),
  trigger_value             varchar(),
  date_last_update          varchar(),
  today_spots_count         number(38, 0),
  all_spots_count           number(38, 0),
  spotlight_url             varchar(),
  qs_prefix                 varchar(),
  user_var_count            number(38, 0),
  user_var_split            varchar(),
  dedupe                    varchar(),
  dedupe_window             number(38, 0),
  idconversion_type         varchar(),
  idfa_conversion_window    varchar(),
  uas_conversion_window     varchar(),
  do_touchpoint             varchar(),
  do_tpt_extract            varchar(),
  report_subtype            varchar()
)
comment = 'flashtalking meta data, spotlight'
;

---

create table if not exists ft_db_{{ params.env }}.ps_xre.spotlight_group (
  idspotlight_group       number(38, 0),
  status_value            number(38, 0),
  idbusiness_entity       number(38, 0),
  description             varchar(),
  date_last_update        timestamp_ntz,
  imp_backtrack_days      number(38, 0),
  click_backtrack_days    number(38, 0),
  imp_window_unit         varchar(),
  click_window_unit       varchar(),
  do_touchpoint           varchar(),
  do_natural              varchar(),
  tpt_report_allowed      varchar(),
  date_tpt_lastrun        timestamp_ntz,
  tptmax_date             timestamp_ntz,
  gmt_offset              number(38, 0),
  int_backtrack_days      number(38, 0),
  mask_ipn                varchar()
)
comment = 'flashtalking meta data, spotlight_group'
;

---

create table if not exists ft_db_{{ params.env }}.ps_xre.dtree_metadata (
  tree_type varchar(1) not null comment 'c-creative, p-placement',
  hedge_yn varchar(1) not null comment 'y-ishedge, n-not hedge',
  tree_id number(8) not null comment 'tree id used by xre, is one of idversion_package, idpackage, idhedge',
  path varchar(30) not null comment 'comma delimmited node sequence',
  date_last_update timestamp_ntz not null default current_timestamp,
  path_description text comment 'dessision path in human readable text'
) comment = 'this table is used for path reporting, is populated every day with an english description of discission tree paths';

---

create table if not exists ft_db_{{ params.env }}.ps_xre.devices (
  idft_agents_{{ params.env }}ices number(11) not null autoincrement,
  idft_agents_manufacturers number(10) not null default 0,
  device varchar(100) not null default '',
  status_value number(3) not null default 50,
  date_last_update timestamp_ntz not null default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.device_type (
  idft_agents_{{ params.env }}ice_type number(3) not null,
  php_name varchar(50) not null,
  description varchar(250) not null,
  in_use char(1) not null default 'y',
  date_last_update timestamp_ntz not null default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.ft_agents_os (
  idft_agents_os number(11) not null autoincrement,
  os varchar(50) not null default '',
  type varchar(50) default null,
  ver varchar(15) default null,
  status_value number(3) not null default 50,
  date_last_update timestamp_ntz not null default current_timestamp
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.ft_browser (
  idft_browser number(11) not null autoincrement,
  browser_name varchar(250) not null,
  regex varchar(500) default null,
  status_value number(3) not null default 50,
  date_last_update timestamp_ntz not null default current_timestamp,
  idbrowser_group number(5) not null comment 'references ft_browser_group.idbrowser_group',
  sort_order number(5) default null comment 'sort order for browser groups'
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.ft_connection_speed (
  idft_connection_speed number(3) not null autoincrement,
  name varchar(20) not null,
  is_mobile char(1) not null default 'n' comment 'is this a mobile device',
  description varchar(100) not null,
  in_use char(1) not null default 'y',
  date_last_update timestamp_ntz not null default current_timestamp,
  ft_usage number(3) not null default 255 comment 'order of usage 1 highest'
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.site (
  idsite number(5) not null autoincrement,
  idcontact number(5) not null default 0,
  idbusiness_entity number(5) not null default 0,
  sitename varchar(250) default null,
  uses_iframe char(1) default 'n',
  ftlocal_addr varchar(100) default null,
  site_url varchar(100) default null,
  notes varchar(),
  real_site char(1) default 'y',
  ftadserving_approved char(1) default null,
  site_type varchar(10) default 'display',
  timezone number(3) default null,
  date_last_update timestamp_ntz not null default current_timestamp,
  oob char(1) default 'n' comment 'does site use oob tracking', --was not null
  no_iframe_breakout char(1) comment 'prevent iframe breakout in tag', --was not null
  site_status_value number(4) not null default 50,
  mraid varchar(2), --was not null
  legacy_js_tag number(1) not null default 0 comment 'allows for sites to be set to use legacy js tag types instead of the new aug tag type.',
  isssl number(3) not null default 0 comment 'denotes if site needs ssl',
  idfa_macro varchar(250) default '',
  mpp_macro varchar(250) default '' comment 'mobile publisher partner macro',
  idfa_enabled_macro varchar(250) default '' comment 'idfa enabled macro', --was not null
  lat_macro varchar(250) default '',
  lon_macro varchar(250) default '',
  idplacement_target_default number(3) not null default 0,
  is_vast_enabled number(1) not null default 0
);

---

create table if not exists ft_db_{{ params.env }}.ps_xre.version (
  idversion number(38) not null autoincrement, --was number(8)
  idcreative number(11) not null default 0,
  description varchar(250) default null,
  xmlstatus number(4) not null default 0 comment '0-unpublished; 1-deleted;2-published; 3-live',
  weighting number(5,2) not null default 0.00 comment 'weighting for rotation',
  filesize number(11) default 0,
  richload_filesize number(11) default 0,
  video_filesize number(11) default 0,
  image_filesize number(11) default 0,
  idversion_list number(10) default null,
  date_last_update timestamp_ntz not null default current_timestamp
);
