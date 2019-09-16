use schema ft_db_{{ params.env }}.aggregations;

set v_loop =                                  '_m05'; --_m05, _p00, _p01, _p10
set v_agent_browser_placement_event =         (select 'agent_browser_placement_event' || $v_loop);
set v_agent_device_placement_event =          (select 'agent_device_placement_event' || $v_loop);
set v_agent_env_placement_event =             (select 'agent_env_placement_event' || $v_loop);
set v_agent_os_placement_event =              (select 'agent_os_placement_event' || $v_loop);
set v_attribution_agent_browser_placement =   (select 'attribution_agent_browser_placement' || $v_loop);
set v_attribution_agent_device_placement =    (select 'attribution_agent_device_placement' || $v_loop);
set v_attribution_agent_env_placement =       (select 'attribution_agent_env_placement' || $v_loop);
set v_attribution_agent_os_placement =        (select 'attribution_agent_os_placement' || $v_loop);
set v_attribution_geo_city_placement =        (select 'attribution_geo_city_placement' || $v_loop);
set v_attribution_geo_metro_placement =       (select 'attribution_geo_metro_placement' || $v_loop);
set v_attribution_geo_region_placement =      (select 'attribution_geo_region_placement' || $v_loop);
set v_attribution_media_creative_config =     (select 'attribution_media_creative_config' || $v_loop);
set v_dimensions_mrc_viewability_summary =    (select 'dimensions_mrc_viewability_summary' || $v_loop);
set v_geo_city_site_event =                   (select 'geo_city_site_event' || $v_loop);
set v_geo_metro_placement_event =             (select 'geo_metro_placement_event' || $v_loop);
set v_geo_region_placement_event =            (select 'geo_region_placement_event' || $v_loop);
set v_int_agent_browser_placement_event =     (select 'int_agent_browser_placement_event' || $v_loop);
set v_int_agent_device_placement_event =      (select 'int_agent_device_placement_event' || $v_loop);
set v_int_agent_env_placement_event =         (select 'int_agent_env_placement_event' || $v_loop);
set v_int_agent_os_placement_event =          (select 'int_agent_os_placement_event' || $v_loop);
set v_int_geo_city_site_event =               (select 'int_geo_city_site_event' || $v_loop);
set v_int_geo_metro_placement_event =         (select 'int_geo_metro_placement_event' || $v_loop);
set v_int_geo_region_placement_event =        (select 'int_geo_region_placement_event' || $v_loop);
set v_int_media_creative_config_event =       (select 'int_media_creative_config_event' || $v_loop);
set v_media_creative_config_event =           (select 'media_creative_config_event' || $v_loop);
set v_user_hll_creative_config =              (select 'user_hll_creative_config' || $v_loop);

create table if not exists identifier($v_agent_browser_placement_event) (
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idcreative                     int not null
    , idft_agents_browsers           int not null
    , device_type                    int not null
    , idevent_type                   int
    , idagent_env                    int
    , total                          int
    , total_time                     int default 0
    , iab_flag                       varchar(1) default 'w' not null
);

create table if not exists identifier($v_agent_device_placement_event) (
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idcreative                     int not null
    , idft_agents_devices            int not null
    , device_type                    int not null
    , idevent_type                   int
    , idagent_env                    int
    , total                          int
    , total_time                     int default 0
    , iab_flag                       varchar(1) default 'w' not null
);

create table if not exists identifier($v_agent_env_placement_event) (
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idagent_env                    char(1) not null
    , device_type                    int not null
    , idevent_type                   int
    , total                          int
    , total_time                     int default 0
    , iab_flag                       varchar(1) default 'w' not null
);

create table if not exists identifier($v_agent_os_placement_event) (
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idcreative                     int not null
    , idft_agents_os                 int not null
    , device_type                    int not null
    , idevent_type                   int
    , idagent_env                    int
    , total                          int
    , total_time                     int default 0
    , iab_flag                       varchar(1) default 'w' not null
);

create table if not exists identifier($v_attribution_agent_browser_placement) (
      activity_date                  date
    , idbusiness_entity              int
    , idcampaign                     int
    , idsite                         int
    , idplacement                    int
    , idft_agents_browsers           int
    , device_type                    int
    , idspotlight                    int
    , post_imp_total                 int
    , post_imp_total_value           number(12,2)
    , post_imp_cookie                int
    , post_imp_idfa                  int
    , post_imp_d9                    int
    , post_imp_viewable              int
    , post_imp_rendered              int
    , post_imp_undet                 int
    , post_click_total               int
    , post_click_total_value         number(12,2)
    , post_click_cookie              int
    , post_click_idfa                int
    , post_click_d9                  int
    , post_imp_noscript              int--not in s3
    , post_imp_viewable_value        number(12,2) not null default 0
    , post_imp_rendered_value        number(12,2) not null default 0
    , post_imp_undet_value           number(12,2) not null default 0
);

create table if not exists identifier($v_attribution_agent_device_placement) (
      activity_date                  date
    , idbusiness_entity              int
    , idcampaign                     int
    , idsite                         int
    , idplacement                    int
    , idft_agents_devices            int
    , device_type                    int
    , idspotlight                    int
    , post_imp_total                 int
    , post_imp_total_value           number(12,2)
    , post_imp_cookie                int
    , post_imp_idfa                  int
    , post_imp_d9                    int
    , post_imp_viewable              int
    , post_imp_rendered              int
    , post_imp_undet                 int
    , post_click_total               int
    , post_click_total_value         number(12,2)
    , post_click_cookie              int
    , post_click_idfa                int
    , post_click_d9                  int
    , post_imp_noscript              int
    , post_imp_viewable_value        number(12,2) not null default 0
    , post_imp_rendered_value        number(12,2) not null default 0
    , post_imp_undet_value           number(12,2) not null default 0
);

create table if not exists identifier($v_attribution_agent_env_placement) (
      activity_date                  date
    , idbusiness_entity              int
    , idcampaign                     int
    , idsite                         int
    , idplacement                    int
    , idagent_env                    int
    , device_type                    int
    , idspotlight                    int
    , post_imp_total                 int
    , post_imp_total_value           number(12,2)
    , post_imp_cookie                int
    , post_imp_idfa                  int
    , post_imp_d9                    int
    , post_imp_viewable              int
    , post_imp_rendered              int
    , post_imp_undet                 int
    , post_click_total               int
    , post_click_total_value         number(12,2)
    , post_click_cookie              int
    , post_click_idfa                int
    , post_click_d9                  int
    , post_imp_noscript              int
    , post_imp_viewable_value        number(12,2) not null default 0
    , post_imp_rendered_value        number(12,2) not null default 0
    , post_imp_undet_value           number(12,2) not null default 0
);

create table if not exists identifier($v_attribution_agent_os_placement) (
      activity_date                  date
    , idbusiness_entity              int
    , idcampaign                     int
    , idsite                         int
    , idplacement                    int
    , idft_agents_os                 int
    , device_type                    int
    , idspotlight                    int
    , post_imp_total                 int
    , post_imp_total_value           number(12,2)
    , post_imp_cookie                int
    , post_imp_idfa                  int
    , post_imp_d9                    int
    , post_imp_viewable              int
    , post_imp_rendered              int
    , post_imp_undet                 int
    , post_click_total               int
    , post_click_total_value         number(12,2)
    , post_click_cookie              int
    , post_click_idfa                int
    , post_click_d9                  int
    , post_imp_noscript              int
    , post_imp_viewable_value        number(12,2) not null default 0
    , post_imp_rendered_value        number(12,2) not null default 0
    , post_imp_undet_value           number(12,2) not null default 0
);

create table if not exists identifier($v_attribution_geo_city_placement) (
      activity_date                  date
    , idbusiness_entity              int
    , idcampaign                     int
    , idsite                         int
    , idplacement                    int
    , country_code                   char (2 )
    , city_code                      int
    , idspotlight                    int
    , post_imp_total                 int
    , post_imp_total_value           number(12,2)
    , post_imp_cookie                int
    , post_imp_idfa                  int
    , post_imp_d9                    int
    , post_imp_viewable              int
    , post_imp_rendered              int
    , post_imp_undet                 int
    , post_click_total               int
    , post_click_total_value         number(12,2)
    , post_click_cookie              int
    , post_click_idfa                int
    , post_click_d9                  int
    , post_imp_noscript              int
    , post_imp_viewable_value        number(12,2) not null default 0
    , post_imp_rendered_value        number(12,2) not null default 0
    , post_imp_undet_value           number(12,2) not null default 0
);

create table if not exists identifier($v_attribution_geo_metro_placement) (
      activity_date                  date
    , idbusiness_entity              int
    , idcampaign                     int
    , idsite                         int
    , idplacement                    int
    , country_code                   char (2 )
    , metro_code                     int
    , idspotlight                    int
    , post_imp_total                 int
    , post_imp_total_value           number(12,2)
    , post_imp_cookie                int
    , post_imp_idfa                  int
    , post_imp_d9                    int
    , post_imp_viewable              int
    , post_imp_rendered              int
    , post_imp_undet                 int
    , post_click_total               int
    , post_click_total_value         number(12,2)
    , post_click_cookie              int
    , post_click_idfa                int
    , post_click_d9                  int
    , post_imp_noscript              int
    , post_imp_viewable_value        number(12,2) not null default 0
    , post_imp_rendered_value        number(12,2) not null default 0
    , post_imp_undet_value           number(12,2) not null default 0
);

create table if not exists identifier($v_attribution_geo_region_placement) (
      activity_date                  date
    , idbusiness_entity              int
    , idcampaign                     int
    , idsite                         int
    , idplacement                    int
    , country_code                   char (2 )
    , region_code                    int
    , idspotlight                    int
    , post_imp_total                 int
    , post_imp_total_value           number(12,2)
    , post_imp_cookie                int
    , post_imp_idfa                  int
    , post_imp_d9                    int
    , post_imp_viewable              int
    , post_imp_rendered              int
    , post_imp_undet                 int
    , post_click_total               int
    , post_click_total_value         number(12,2)
    , post_click_cookie              int
    , post_click_idfa                int
    , post_click_d9                  int
    , post_imp_noscript              int
    , post_imp_viewable_value        number(12,2) not null default 0
    , post_imp_rendered_value        number(12,2) not null default 0
    , post_imp_undet_value           number(12,2) not null default 0
);

create table if not exists identifier($v_attribution_media_creative_config) (
      activity_date                  date
    , idbusiness_entity              int
    , idcampaign                     int
    , idsite                         int
    , idplacement                    int
    , idcreative                     int
    , idcreative_config              int
    , idspotlight                    int
    , post_imp_total                 int
    , post_imp_total_value           number(12,2)
    , post_imp_cookie                int
    , post_imp_idfa                  int
    , post_imp_d9                    int
    , post_imp_viewable              int
    , post_imp_rendered              int
    , post_imp_undet                 int
    , post_click_total               int
    , post_click_total_value         number(12,2)
    , post_click_cookie              int
    , post_click_idfa                int
    , post_click_d9                  int
    , post_imp_noscript              int
    , post_imp_viewable_value        number(12,2) not null default 0
    , post_imp_rendered_value        number(12,2) not null default 0
    , post_imp_undet_value           number(12,2) not null default 0
);

create table if not exists identifier($v_dimensions_mrc_viewability_summary) (
  --impressions, clicks union all combination of event_type and device_id
  activity_date                 date not null,--group by
  idad_index                    int not null default 0,--group by
  idcampaign                    int not null,--group by
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
  invalid_imp_viewable_app      int not null,
  invalid_imp_viewable_web      int not null,
  invalid_imp_viewable_desktop  int not null,
  invalid_imp_rendered_app      int not null,
  invalid_imp_rendered_web      int not null,
  invalid_imp_rendered_desktop  int not null,
  invalid_imp_undet_app         int not null,
  invalid_imp_undet_web         int not null,
  invalid_imp_undet_desktop     int not null,
  invalid_imp_desktop           int not null,
  invalid_imp_app               int not null,
  invalid_imp_web               int not null,
  idcreative                    int not null,--group by
  idplacement                   int not null,--group by
  idcreative_config             int not null--group by
);

create table if not exists identifier($v_geo_city_site_event) (
      activity_date                  date not null,
      idbusiness_entity              int not null,
      idcampaign                     int not null,
      idsite                         int not null,
      country_code                   char(2),
      city_code                      int,
      idevent_type                   int,
      total                          int default 0,
      total_time                     int default 0
);

create table if not exists identifier($v_geo_metro_placement_event) (
      activity_date                 date not null,
      idbusiness_entity             int not null,
      idcampaign                    int not null,
      idsite                        int not null,
      idplacement                   int not null,
      country_code                  char(2),
      metro_code                    int not null,
      idevent_type                  int,
      total                         int default 0,
      total_time                    int default 0
);

create table if not exists identifier($v_geo_region_placement_event) (
      activity_date                  date not null,
      idbusiness_entity              int not null,
      idcampaign                     int not null,
      idsite                         int not null,
      idplacement                    int not null,
      country_code                   char(2),
      region_code                    int not null,
      idevent_type                   int,
      total                          int default 0,
      total_time                     int default 0
);

create table if not exists identifier($v_int_agent_browser_placement_event) (
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idcreative                     int not null
    , idft_agents_browsers           int not null
    , device_type                    int not null
    , idevent_type                   int
    , idagent_env                    int
    , total                          int
    , total_time                     int
    , iab_flag                       varchar(1) default 'w' not null
);

create table if not exists identifier($v_int_agent_device_placement_event) (
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idcreative                     int not null
    , idft_agents_devices            int not null
    , device_type                    int not null
    , idevent_type                   int
    , idagent_env                    int
    , total                          int
    , total_time                     int
    , iab_flag                       varchar(1) default 'w' not null
);

create table if not exists identifier($v_int_agent_env_placement_event) (
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idagent_env                    char(1) not null
    , device_type                    int not null
    , idevent_type                   int
    , total                          int
    , total_time                     int
    , iab_flag                       varchar(1) default 'w' not null
);

create table if not exists identifier($v_int_agent_os_placement_event) (
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idcreative                     int not null
    , idft_agents_os                 int not null
    , device_type                    int not null
    , idevent_type                   int
    , idagent_env                    int
    , total                          int
    , total_time                     int
    , iab_flag                       varchar(1) default 'w' not null
);

create table if not exists identifier($v_int_geo_city_site_event) (
      activity_date                  date not null,
      idbusiness_entity              int not null,
      idcampaign                     int not null,
      idsite                         int not null,
      country_code                   char(2),
      city_code                      int,
      idevent_type                   int,
      total                          int default 0,
      total_time                     int default 0
);

create table if not exists identifier($v_int_geo_metro_placement_event) (
      activity_date                 date not null,
      idbusiness_entity             int not null,
      idcampaign                    int not null,
      idsite                        int not null,
      idplacement                   int not null,
      country_code                  char(2),
      metro_code                    int not null,
      idevent_type                  int,
      total                         int default 0,
      total_time                    int default 0
);

create table if not exists identifier($v_int_geo_region_placement_event) (
      activity_date                  date not null,
      idbusiness_entity              int not null,
      idcampaign                     int not null,
      idsite                         int not null,
      idplacement                    int not null,
      country_code                   char(2),
      region_code                    int not null,
      idevent_type                   int,
      total                          int default 0,
      total_time                     int default 0
);

create table if not exists identifier($v_int_media_creative_config_event) (
  --same as v_agent_browser_placement_event
  -- 'regenerate_previous_days' => 3,
  -- 'filter_events' => true,
  -- 'file_prefix' => 'int_'
      activity_date                  date not null,
      idbusiness_entity              int not null,
      idcampaign                     int not null,
      idsite                         int not null,
      idplacement                    int not null,
      idcreative                     int not null,
      idcreative_config              int not null,
      idevent_type                   int,
      total                          int default 0,
      total_time                     int default 0
);

create table if not exists identifier($v_media_creative_config_event) (
  --same as v_agent_browser_placement_event
  --'filter_events' => true
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idcreative                     int not null
    , idcreative_config              int not null
    , idevent_type                   int
    , total                          int
    , total_time                     int
    , iab_flag                       varchar(1) default 'w' not null
    , ftrack_total                   int--count of decode user_ids where user_ids starts with "d9:" and over 30 characters
);

-- note: modified_user_hll is retained for backwards compatibility with older
-- files but is no longer loaded.

create table if not exists identifier($v_user_hll_creative_config) (
--'filter' => $iabFilter (aggregates.click.uniques.php)
      activity_date                  date not null
    , idbusiness_entity              int not null
    , idcampaign                     int not null
    , idsite                         int not null
    , idplacement                    int not null
    , idcreative                     int not null
    , idcreative_config              int not null
    , idevent_type                   int not null
    , user_hll                       varchar(3100) not null
    , modified_user_hll              varchar(3100)--not in s3
    , user_ftrack_hll                varchar(3100)
);
