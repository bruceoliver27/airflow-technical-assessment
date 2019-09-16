create schema if not exists hourly_summaries;

use schema hourly_summaries;

create table if not exists ft_db_{{ params.env }}.hourly_summaries.log_sum_click_hourly (
    idevent_type number(5) not null default 0
  , idad_index number(10) not null default 0
  , total number(10) not null default 0
  , activity_date date not null default to_date('1900-01-01')
  , activity_hour number(3) not null default 0
  , activity_timestamp timestamp not null default to_timestamp_ntz('1900-01-01 00:00:00')
  , idcampaign number(9) not null
  , idlog_keyword number(10) default null
  , idbusiness_entity number(9) not null
);

create table if not exists ft_db_{{ params.env }}.hourly_summaries.log_sum_impression_hourly (
    idad_index number(10) not null default 0
  , idevent_type number(3) not null default 0
  , activity_date date not null default to_date('1900-01-01')
  , activity_hour number(3) not null default 0
  , activity_timestamp timestamp not null default to_timestamp_ntz('1900-01-01 00:00:00')
  , total number(10) default null
  , idcampaign number(9) not null
  , idbusiness_entity number(9) not null
);
