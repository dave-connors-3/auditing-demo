{% set prod %}

  select

    id as bean_id, 
    color,
    flavor

  from postgres.prod.simple_model

{% endset %}

{% set dev %}

  select
  
    bean_id, 
    color,
    flavor
  from {{ ref('simple_model') }}

{% endset %}

{{ audit_helper.compare_queries(
    a_query=prod,
    b_query=dev,
    primary_key="bean_id",
    summarize=false
) }}