{% if execute %}
ALTER TABLE {{ ref('dim_corp_date') }}
MODIFY COLUMN dim_date_key DATE;
{% endif %}
