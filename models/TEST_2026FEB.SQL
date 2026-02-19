select E.* from TEST_DB.test_schema.EMPLOYEE_BKP E--country_codes  ##EMPLOYEE

--{{config(materialized = 'table')}}-- will create this as table or "view"--then view  
/* i have not mentioned in properties yml still it is running succesfull...only thing is case senstive.
*/ 