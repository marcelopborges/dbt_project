select * from {{ref('joins')}}
where category_name = '{{var('category')}}'

-- é possivel colocar também variável em tempo de execução digitando por exemplo dbt run --select bicategories --vars 'category: Condiments'