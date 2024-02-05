select
ct.category_name,
sp.company_name suppliers,
pd.product_name,
pd.unit_price,
pd.product_id
from {{source('sources','products')}} pd
left join {{source('sources','suplliers')}} sp on (pd.supplier_id = sp.supplier_id)
left join {{source('sources','categories')}} ct on (pd.category_id = sp.category_id)