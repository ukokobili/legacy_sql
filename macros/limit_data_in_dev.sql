{% macro limit_data_in_dev(column_name, dav_days_to_data=3) -%}

{% if target.name == 'dev' %}
where {{ column_name }} >= date_add(current_timestamp, INTERVAL -{{ dav_days_to_data }} DAY)
{% endif %}

{%- endmacro %}
