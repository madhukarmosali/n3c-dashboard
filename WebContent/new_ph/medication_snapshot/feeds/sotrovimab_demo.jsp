<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select severity_abbrev as severity, foo.age as age, gender_abbrev as gender, patient_display, patient_count,
				age_abbrev, age_seq, gender_abbrev, gender_seq, severity_abbrev, severity_seq
			from (select
					severity_type as severity,
					age_bracket as age,
					case when (addtl_gender_concept_name = 'No matching concept') then 'Unknown'
					Else addtl_gender_concept_name
					end as gender,
					count as patient_display,
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as patient_count
				  from n3c_questions.sotrovimab_demographic
		  	) as foo
		  	join n3c_dashboard.age_map7 on foo.age = age_map7.age_bin
		  	natural join n3c_dashboard.gender_map
		  	natural join n3c_dashboard.severity_map
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"severity", "label":"Severity"},
        {"value":"age", "label":"Age"},
        {"value":"gender", "label":"Gender"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"},
        {"value":"gender_abbrev", "label":"dummy3"},
        {"value":"gender_seq", "label":"dummy4"},
        {"value":"severity_abbrev", "label":"dummy5"},
        {"value":"severity_seq", "label":"dummy6"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}