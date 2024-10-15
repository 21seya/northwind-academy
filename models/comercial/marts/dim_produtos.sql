with
    int_produtos as (
        select *
        from {{ ref('int_produtos_enriquecidas') }}
    )

select *
from int_produtos