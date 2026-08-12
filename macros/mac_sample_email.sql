{% macro create_email_enrichment_udf() %}

create or replace function {{ target.schema }}.email_enrichment(email string)
returns variant
language sql
as
$$
    with parsed as (
        select
            email as original_email,
            regexp_like(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') as is_valid,
            split_part(email, '@', 1) as username,
            split_part(email, '@', 2) as domain
    )

    
    select object_construct(
        'is_valid', is_valid,
        'masked_email',
            case 
                when length(username) > 2
                then substr(username,1,2) || '****@' || domain
                else '****@' || domain
            end,
        'domain_type',
            case 
                when lower(domain) in ('gmail.com','yahoo.com','hotmail.com','outlook.com')
                then 'FREE'
                else 'CORPORATE'
            end
    )
    from parsed
$$;

{% endmacro %}