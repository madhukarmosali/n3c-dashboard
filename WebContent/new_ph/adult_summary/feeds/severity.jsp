<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select severity, race, ethnicity, age_bin as age, gender, patient_display, patient_count,
				age_abbrev, age_seq, race_abbrev, race_seq, ethnicity_abbrev, ethnicity_seq, gender_abbrev, gender_seq, severity_abbrev, severity_seq
			from (select
					severity_type as severity,
					race_concept_name as race,
					ethnicity_concept_name as ethnicity,
					age_bin,
					gender_concept_name as gender,
					count as patient_display,
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as patient_count
				  from n3c_questions.covid_severity_grouped_demo_adults_censored
		  	) as foo
		  	natural join n3c_dashboard.age_map2
		  	natural join n3c_dashboard.race_map
		  	natural join n3c_dashboard.ethnicity_map
		  	natural join n3c_dashboard.gender_map2
		  	natural join n3c_dashboard.severity_map
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"severity", "label":"Severity"},
        {"value":"race", "label":"Race"},
        {"value":"ethnicity", "label":"Ethnicity"},
        {"value":"age", "label":"Age"},
        {"value":"gender", "label":"Gender"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"},
        {"value":"race_abbrev", "label":"dummy3"},
        {"value":"race_seq", "label":"dummy4"},
        {"value":"ethnicity_abbrev", "label":"dummy5"},
        {"value":"ethnicity_seq", "label":"dummy6"},
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
