use schema ft_db_{{ params.env }}.summaries;

set v_loop =                                  '_m05'; --_m05, _p00, _p01, _p10
set v_click_summary =                        (select 'click_summary' || $v_loop);
set v_decision_tree_summary =                (select 'decision_tree_summary' || $v_loop);
set v_heatmap_summary =                      (select 'heatmap_summary' || $v_loop);
set v_impression_summary =                   (select 'impression_summary' || $v_loop);
set v_mrc_viewability_summary =              (select 'mrc_viewability_summary' || $v_loop);
set v_referrer_summary =                     (select 'referrer_summary' || $v_loop);
set v_spotlight_call_log =                   (select 'spotlight_call_log' || $v_loop);
set v_spotlight_log_summary =                (select 'spotlight_log_summary' || $v_loop);
set v_v2_spot_transaction_log =              (select 'v2_spot_transaction_log' || $v_loop);



create table if not exists identifier($v_click_summary) (
  idcampaign                    int not null,
  idad_index                    int not null default 0,
  click_number                  int,
  activity_date                 date not null default to_date('1900-01-01'),
  total                         int
);

create table if not exists identifier($v_decision_tree_summary) (
  idplacement                   int,
  idcreative                    int,
  placement_tree                int,
  creative_tree                 int,
  placement_tree_type           varchar(1),
  creative_tree_type            varchar(1),
  activity_date                 date not null,
  total                         int default 0,
  total_mobile                  int default 0
);

create table if not exists identifier($v_heatmap_summary) (
  idinteraction_log number(10) not null default 0,
  idlog_file_control number(10) not null default 0,
  idevent_type number(5) not null default 0,
  tpt_event number(5) not null default 0,
  idcreative number(8) not null default 0,
  idplacement number(8) not null default 0,
  idcampaign number(9) not null default 0,
  idcreative_config number(10) default null,
  event_date date not null default '1900-01-01'::date,
  event_time timestamp_ntz not null default '1900-01-01 00:00:00'::timestamp_ntz,
  guidn number(20) not null default 0,
  sid number(20) default null,
  idad_index number(10) not null default 0,
  idsite number(5) not null default 0,
  idft_domains number(10) not null default 0,
  idft_agents_os number(5) not null default 0,
  idft_agents_browsers number(8) not null default 0,
  idft_agents_devices number(8) not null default 0,
  device_type number(3) not null default 0 comment '1 = mobile; 2 = tablet; 3 = desktop; 0 = other;',
  country_code char(2) not null default '##',
  metro_code number(8) not null default 0 comment '0 - country code valid only',
  region_code number(8) not null default 0,
  city_code number(8) not null default 0,
  postal_code varchar(12) not null default '',
  idft_isp number(8) not null default 0,
  idft_connection_speed number(3) not null default 0,
  idbusiness_entity number(5) not null default 0,
  options varchar(255) default null,
  arrival_time timestamp_ntz not null default current_timestamp
);

create table if not exists identifier($v_impression_summary) (
      idcampaign                    int,
      idad_index                    int,
      idevent_type                  int,
      activity_date                 date not null default to_date('1900-01-01'),
      total                         int default 0
);

create table if not exists identifier($v_mrc_viewability_summary) (
  activity_date                 date not null,
  idad_index                    int not null,
  idcampaign                    int not null,
  imp_viewable_app              int not null,
  imp_viewable_web              int not null,
  imp_viewable_desktop          int not null,
  imp_rendered_app              int not null,
  imp_rendered_web              int not null,
  imp_rendered_desktop          int not null,
  imp_undet_app                 int not null,
  imp_undet_web                 int not null,
  imp_undet_desktop             int not null,
  imp_desktop                   int not null,
  imp_app                       int not null,
  imp_web                       int not null,
  invalid_imp_viewable_app      int not null default 0,
  invalid_imp_viewable_web      int not null default 0,
  invalid_imp_viewable_desktop  int not null default 0,
  invalid_imp_rendered_app      int not null default 0,
  invalid_imp_rendered_web      int not null default 0,
  invalid_imp_rendered_desktop  int not null default 0,
  invalid_imp_undet_app         int not null default 0,
  invalid_imp_undet_web         int not null default 0,
  invalid_imp_undet_desktop     int not null default 0,
  invalid_imp_desktop           int not null default 0,
  invalid_imp_app               int not null default 0,
  invalid_imp_web               int not null default 0,
  idplacement                   int not null,
  idcreative                    int not null,
  idcreative_config             int not null
);

create table if not exists identifier($v_referrer_summary) (
  idcampaign                     int,
  idplacement                    int,
  domain                         varchar(100),
  client_beid                    int,
  idsite                         int,
  activity_date                  date not null,
  total                          int,
  idft_domains                   int
);

create table if not exists identifier($v_spotlight_call_log) (
  idspotlight_log                     number,
  idlog_file_control                  number,
  idbusiness_entity                   number,
  idspotlight                         number,
  spot_date                           date,
  spot_time                           time default '00:00:00'::time,
  guidn                               number,
  country_code                        varchar(2) default null,
  metro_code                          number,
  city_code                           number,
  spot_group                          number default 0,
  query_string                        varchar(),
  qval                                number(15, 2) default 0.00,
  qref                                varchar(250) default null,
  iab_flag                            varchar(1) default 'w',
  ipn                                 number default 0,
  idft_agents_cons                    number default 0,
  privacy_flag                        varchar(1) default 'x'
);

create table if not exists identifier($v_spotlight_log_summary) (
      idspotlight                    int not null
    , activity_date                  date not null
    , total                          int
    , total_value                    number(27,2)
    , idbusiness_entity              int not null
);

create table if not exists identifier($v_v2_spot_transaction_log) (
    idspotlight_log              int
  , idspotlight_log_file_control int
  , idbusiness_entity            int
  , guidn                        int
  , country_code                 varchar(2)
  , metro_code                   int
  , city_code                    int
  , idft_isp                     int
  , ipn                          int
  , date_logged                  date           not null
  , hour_logged                  int
  , time_logged                  varchar(10)
  , idevent_type                 int
  , qref                         varchar(150)
  , value                        number(37,15)
  , spot_group                   int
  , query_string                 varchar(4000)
  , ft_section                   varchar(250)
  , ft_custom                    varchar(250)
  , idlog_keyword                int
  , logged_at                    timestamp
  , rule_flags                   int
  , event_no                     int
  , event_class                  varchar(1)
  , idft_agents_cons             int
  , idmatched_log                int
  , idmatched_log_file_control   int
  , idad_index                   int
  , idcampaign                   int            not null
  , idplacement                  int            not null
  , idcreative                   int            not null
  , idcreative_config            int
  , iduser_id_type               int
  , log_keywords                 varchar(500)
  , user_id                      varchar(64)
  , idft_agents_browsers         int
  , idft_agents_devices          int
  , idft_agents_os               int
  , ft_product                   varchar(250)
  , ft_data                      varchar(250)
  , ft_tpplid                    varchar(50)
  , ft_c1                        varchar(250)
  , ft_c2                        varchar(250)
  , ft_c3                        varchar(250)
  , device_type                  int
  , agent_env                    int
  , region_code                  int
  , placement_tree               int
  , placement_tree_type          varchar(1)
  , placement_path               varchar(300)
  , creative_tree                int
  , creative_tree_type           varchar(1)
  , creative_path                varchar(300)
  );
