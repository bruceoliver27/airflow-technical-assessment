--UDFs need to be created and permissioned in all schemas where they will be used.

create function if not exists js_binhextoint (s string, base double)
  returns double
  language JAVASCRIPT
   as
   'if (S !== null)
   {
    yourNumber = parseInt(S, BASE);
   }
   return yourNumber';

grant usage on function js_binhextoint(string, double)
  to role dev_elt_read_write;

grant usage on function js_binhextoint(string, double)
  to role qa_elt_read_write;

grant usage on function js_binhextoint(string, double)
  to role prod_elt_read_write;
