<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select drug_domain, concept_set_name, age_bin as age, patient_count, total_count, age_abbrev, age_seq
			from (select
					drug_domain,
					concept_set_name,
					age_bin,
					case
						when (num_patients = '<20' or num_patients is null) then 0
						else num_patients::int
					end as patient_count,
					total_patients as total_count
				  from n3c_questions.covid_patients_demographics_censored
				  where concept_set_name != 'Available, in progress'
		  	) as foo
		  	natural join n3c_dashboard.age_map4
		  )as done ;
</sql:query>
{
    "headers": [
        {"value":"drug_domain", "label":"Class"},
        {"value":"concept_set_name", "label":"Medication"},
        {"value":"age", "label":"Age"},
        {"value":"patient_count", "label":"Patient Count"},
        {"value":"total_count", "label":"Total Count"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
