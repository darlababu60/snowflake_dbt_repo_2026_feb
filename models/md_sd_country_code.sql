
select *
from {{ref('country_codes')}}
--first refers table,view,ephemeral----if table existed then, it will check config ()...here no config so created view in db
/*
--country_codes are csv file in seeds folder whcih is creted as table in snowflake
--i droped table in test_db database so now if i run this model md_sd_country_code it is failing because it searced for table,view,ephmeral not existed.
-- now i ran seed and creted table in data base,i am running the model again- view creted..not table
--since no config file, created view
*/
-- ok done