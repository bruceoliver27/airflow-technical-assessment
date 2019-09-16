create or replace file format raw_stage.ft_log_csv_format
type = csv
compression = gzip
field_delimiter = '\t'
record_delimiter = '\n'
skip_header = 4
;

create or replace file format raw_stage.ft_log_csv_aco_format
type = csv
compression = gzip
field_delimiter = ' '
record_delimiter = '\n'
field_optionally_enclosed_by = '"'
escape_unenclosed_field = none
encoding = 'iso-8859-1'
null_if = '-'
;

create or replace file format raw_ingester.ft_raw_ingester_format
    type = csv
    compression = gzip
    record_delimiter = '\n'
    field_delimiter = '\t'
    skip_header = 1;

create or replace file format aggregations.ft_aggregations_file_format
    type = csv
    compression = gzip
    record_delimiter = '\n'
    field_delimiter = '\t';

create or replace file format ps_xre.tab_sep_hex_format
    type = csv
    compression = gzip
    validate_utf8 = false
    record_delimiter = '\n'
    field_delimiter = '\t'
    skip_header = 1;

create or replace file format log_file_unload_format
   compression = gzip
   record_delimiter = '\n'
   field_delimiter = '\t'
   file_extension = '.log'
   escape = '\\'
   escape_unenclosed_field = '\\'
   timestamp_format = 'YYYYMMDD-HH:MM:SS'
   ;

grant all on file format ft_log_csv_format to role dev_elt_read_write;
grant all on file format ft_log_csv_aco_format to role dev_elt_read_write;
grant all on file format ft_raw_ingester_format to role dev_elt_read_write;
grant all on file format ft_aggregations_file_format to role dev_elt_read_write;
grant all on file format log_file_unload_format to role dev_elt_read_write;
