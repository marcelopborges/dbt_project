--Este código de alguma forma não funcionou, o arquivo csv não está sendo alcançavel. 
-- select 
-- sh.shipper_id,
-- se.shipper_email
-- from 
-- {{source("sources",'shippers')}} sh
-- left join
-- {{ref("shippers_emails")}} se
-- on 
-- (sh.shipper_id = se.shipper_id)
