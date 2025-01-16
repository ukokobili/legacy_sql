--union_tables_by_prefix macro code:
{%- macro union_tables_by_prefix(database, schema, prefix) -%}

  {%- set tables = dbt_utils.get_relations_by_prefix(database=database, schema=schema, prefix=prefix) -%}

  {% for table in tables %}

      {%- if not loop.first -%}
      union all 
      {%- endif %}
        
      select * from {{ table.database }}.{{ table.schema }}.{{ table.name }}
      
  {% endfor -%}
  
{%- endmacro -%}


union_tables_by_prefix macro code:
{%- macro union_tables_by_prefix(database, schema, prefix) -%}

  {%- set tables = dbt_utils.get_relations_by_prefix(database=database, schema=schema, prefix=prefix) -%}

  {% for table in tables %}

      {%- if not loop.first -%}
      union all 
      {%- endif %}
        
      select * from {{ table.database }}.{{ table.schema }}.{{ table.name }}
      
  {% endfor -%}
  
{%- endmacro -%}


--union_tables_by_orders_prefix model code:
{{ union_tables_by_prefix(

      database='raw',
      schema='dbt_learn_jinja', 
      prefix='orders__'
        
      )
      
  }}