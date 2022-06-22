<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select severity,smoking_status,patient_count,severity_abbrev,severity_seq,smoking_status_abbrev,smoking_status_seq
			from (select
					severity_type as severity,
					smoking_status,
					num_patients as patient_count
				  from n3c_questions.covid_smoking_severity_censored
		  	) as foo
		  	natural join n3c_dashboard.severity_map
		  	natural join n3c_dashboard.status_map
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"severity", "label":"Severity"},
        {"value":"smoking_status", "label":"Smoking Status"},
        {"value":"patient_count", "label":"Patient Count"},
        {"value":"severity_abbrev", "label":"dummy1"},
        {"value":"severity_seq", "label":"dummy2"},
        {"value":"smoking_status_abbrev", "label":"dummy3"},
        {"value":"smoking_status_seq", "label":"dummy4"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
