<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select observation, age_abbrev as age, gender_abbrev as gender, patient_display, patient_count, age_abbrev, age_seq, gender_abbrev, gender_seq, observation_seq
			from (select
					observation,
					coalesce(age_bracket, 'Unknown') as age_bin,
					case
					when (gender_concept_name = 'UNKNOWN') THEN 'Unknown'
					ELSE gender_concept_name
					END as gender,
					count as patient_display,
					n_observation as observation_seq,
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as patient_count
				  from n3c_questions.${param.comorbidity}_and_covid_summary
		  	) as foo
		  	natural join n3c_dashboard.gender_map2
		  	natural join n3c_dashboard.age_map6
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"observation", "label":"Observation"},
        {"value":"age", "label":"Age"},
        {"value":"gender", "label":"Gender"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"age_abbrev", "label":"dummy0"},
        {"value":"age_seq", "label":"dummy1"},
        {"value":"gender_abbrev", "label":"dummy2"},
        {"value":"gender_seq", "label":"dummy3"},
        {"value":"observation_seq", "label":"dummy4"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
