select E.* from TEST_DB.test_schema.EMPLOYEE_BKP E--country_codes  ##EMPLOYEE

--{{config(materialized = 'table')}}-- will create this as table or "view"--no config so creates view  
--or 
/* if i mention this in properties.yml file then it will create as table

- name: kamaleshwar
    config:
      materialized: table

*/ 
--ok done