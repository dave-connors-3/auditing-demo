
{% if target.name == "prod" %}

    -- pretend production version
    select 1 as id, 'orange' as color, 'orange' as flavor
    union all
    select 2 as id, 'blue' as color, 'blueberry' as flavor
    union all
    select 3 as id, null as color, 'mystery' as flavor

{% else %}

    -- pretend development version with a small change
    {# select 1 as bean_id, 'black' as color, 'licorice' as flavor
    union all
    select 2 as bean_id, 'blue' as color, 'blueberry' as flavor
    union all
    select 3 as bean_id, 'green' as color, 'green apple' as flavor
    union all
    select 4 as bean_id, 'yellow' as color, 'lemon' as flavor #}

    --     
    -- data-diff version
    select 1 as id, 'black' as color, 'licorice' as flavor
    union all
    select 2 as id, 'blue' as color, 'blueberry' as flavor
    union all
    select 3 as id, 'green' as color, 'green apple' as flavor
    union all
    select 4 as id, 'yellow' as color, 'lemon' as flavor

{% endif %}
