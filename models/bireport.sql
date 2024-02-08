-- código para criar grupos e usuarios no banco e dados redshift
-- create group biusers;
-- create user alex with password '123abcdfg'
-- alter group biusers add user alex;

-- exemplo de pre hook para travar a tabela antes da execução de uma atividade
-- exemplo de post_hook para que seja executado a configuração de permissão de acesso depois da criação da tabela.

{{ 
    config( 
        materialized='table',
        
        pre_hook=["
            begin; lock table {{target.schema}}.bireport; 
        "],
        post_hook=["
            commit; 
            GRANT USAGE ON SCHEMA {{target.schema}} TO GROUP biusers;
            GRANT SELECT ON TABLE {{target.schema}}.bireport TO GROUP biusers;
        "]
    )
}}

select * from {{ref('joins')}}