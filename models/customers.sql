--Função de janela
with markup as (
    select * , -- seleciona todos os campos da tabela
    first_value(customer_id) -- na nova coluna que será criada onde conter duplicação será colocado o primeiro registro encontrado, este foi o critério definido.
    over(partition by company_name, contact_name --o negócio informou que para se considerar duplicação bastava repetir company_name e contact_name
    order by company_name -- ordena por company name para facilitar a visualização dos duplicados
    rows between unbounded preceding and unbounded following) as result -- salva a consulta cte como result
    from {{source('sources', 'customers')}} -- origem
), removed as (
    select distinct result from markup --nesta parte é dado um distinct para pegar somente os registros únicos.
), final as ( 
    select * from {{source('sources','customers')}} where customer_id in (select result from removed) -- agora consulta somente os regitros que possuir os dados unicos na tabela
)
select * from final