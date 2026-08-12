{%
    set
    person ={
        'name' : "srinivas",
        'job' : 'trainer'
    }
%}
select {{person["name"]}} as name,
       {{person["job"]}} as job
