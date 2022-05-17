<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="ages" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select symptom, condition_after_covid_positive, patient_display, patient_count, condition_after_covid_positive_seq from (select
			symptom,
			case
				when (condition_after_covid_positive) then 'Before COVID+'
				else 'After COVID+'
			end as condition_after_covid_positive,
			count as patient_display,
			count as patient_count
		  from n3c_questions.symptom_before_or_after_covid
		  ) as foo
		  natural join n3c_dashboard.before_after_map
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"symptom", "label":"Symptom"},
        {"value":"condition_after_covid_positive", "label":"Condition Before/After COVID+"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"condition_after_covid_positive_seq", "label":"dummy0"}
    ],
    "rows" : 
<c:forEach items="${ages.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
			