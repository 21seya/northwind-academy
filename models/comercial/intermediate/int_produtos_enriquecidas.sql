with
    produtos as (
        select *
        from {{ ref('str_erp__produtos') }}
    )

    , categorias as (
        select *
        from {{ref('str_erp__categorias')}}
    )

    , fornecedores as (
        select *
        from {{ref('str_erp__fornecedores')}}
    )

    , produtos_enriquecidos as (
        select
            produtos.PK_PRODUTOS
            , produtos.NM_PRODUTO
            , produtos.QUANTIDADE_POR_UNIDADE
            , produtos.PRECO_UNIDADE 
            , produtos.UNIDADE_EM_ESTOQUE
            , produtos.UNIDADE_POR_PEDIDO
            , produtos.NIVEL_DE_PEDIDO
            , produtos.EH_DESCONTINUADO
            , categorias.NOME_CATEGORIA
            , categorias.DESCRICAO_CATEGORIA
            , fornecedores.NM_FORNECEDOR
            , fornecedores.CIDADE_FORNECEDOR
            , fornecedores.PAIS_FORNECEDOR
        from produtos
        left join categorias on categorias.pk_categoria = produtos.fk_categoria
        left join fornecedores on fornecedores.pk_fornecedor = produtos.fk_fornecedor
    )

select * 
from produtos_enriquecidos
