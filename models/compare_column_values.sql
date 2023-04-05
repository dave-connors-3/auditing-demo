
{% set prod %}

    select
        id as bean_id, 
        color
    
    from prod.simple_model

{% endset %}


{% set dev %}

    select
        bean_id, 
        color
    
    from {{ ref('simple_model') }}

{% endset %}

{% set audit_query = audit_helper.compare_column_values(
    a_query=prod,
    b_query=dev,
    primary_key="bean_id",
    column_to_compare="color"
) %}

{% set audit_results = run_query(audit_query) %}

{% if execute %}
{% do audit_results.print_table() %}
{% endif %}