<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select *
			from (select
					severity_type as severity,
					race_concept_name as race,
					case
						when (vaccinated = '1') then 'True'
						else vaccinated
					end as vaccinated,
					age_bin,
					gender_concept_name as gender,
					case
						when (num_patients = '<20' or num_patients is null) then 0
						else num_patients::int
					end as patient_count
				  from n3c_questions.covid_positive_with_vax_censored
		  	) as foo
		  	natural join n3c_dashboard.age_map3
		  	natural join n3c_dashboard.race_map
		  	natural join n3c_dashboard.gender_map2
		  	natural join n3c_dashboard.severity_map
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"severity", "label":"Severity"},
        {"value":"gender", "label":"Gender"},
        {"value":"age_bin", "label":"Age"},
        {"value":"race", "label":"Race"},
        {"value":"vaccinated", "label":"Vaccinated"},
        {"value":"patient_count", "label":"Patient Count"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"},
        {"value":"race_abbrev", "label":"dummy3"},
        {"value":"race_seq", "label":"dummy4"},
        {"value":"gender_abbrev", "label":"dummy7"},
        {"value":"gender_seq", "label":"dummy8"},
        {"value":"severity_abbrev", "label":"dummy9"},
        {"value":"severity_seq", "label":"dummy0"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
