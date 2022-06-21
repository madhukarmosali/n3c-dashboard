<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by age_seq))
	from (select age_bin as age,smoking_status,race,gender,patient_display,patient_count,age_abbrev,age_seq,race_abbrev,race_seq,gender_abbrev,gender_seq, smoking_status_abbrev, smoking_status_seq
			from (select
					age_bin,
					smoking_status,
					race_concept_name as race,
					gender_concept_name as gender,
					num_patients as patient_display,
					case
						when (num_patients = '<20' or num_patients is null) then 0
						else num_patients::int
					end as patient_count
				  from n3c_questions.covid_smoking_demographics_censored
		  	) as foo
		  	natural join n3c_dashboard.age_map4
		  	natural join n3c_dashboard.race_map
		  	natural join n3c_dashboard.gender_map2
		  	natural join n3c_dashboard.status_map
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"age", "label":"Age"},
        {"value":"smoking_status", "label":"Smoking Status"},
        {"value":"race", "label":"Race"},
        {"value":"gender", "label":"Gender"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"},
        {"value":"race_abbrev", "label":"dummy3"},
        {"value":"race_seq", "label":"dummy4"},
        {"value":"gender_abbrev", "label":"dummy5"},
        {"value":"gender_seq", "label":"dummy6"},
        {"value":"smoking_status_abbrev", "label":"dummy7"},
        {"value":"smoking_status_seq", "label":"dummy8"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
