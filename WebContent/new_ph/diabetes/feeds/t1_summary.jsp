<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select *
			from (select
					age_bracket as age_bin,
					gender_concept_name as gender,
					observation,
					n_observation as observation_seq,
					count as patient_display,
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as patient_count
				  from n3c_questions.diabetes_t1_full_censored
		  	) as foo
		  	natural join n3c_dashboard.age_map4
		  	natural join n3c_dashboard.gender_map2
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"age_bin", "label":"Age"},
        {"value":"gender", "label":"Gender"},
        {"value":"observation", "label":"Observation"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"},
        {"value":"gender_abbrev", "label":"dummy7"},
        {"value":"gender_seq", "label":"dummy8"},
        {"value":"observation_seq", "label":"dummy0"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
