<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="ages" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (
		select count(distinct(symptom)) as count, 
		'Grouped Symptoms' as label, 
		4 as viz_id
		from n3c_questions.icd10_individual_symptom_summary_counts
		UNION 
		select count(distinct(symptom)) as count, 
		'Individual Symptoms' as label,
		5 as viz_id
		from n3c_questions.icd10_individual_symptom_summary_counts_by_symptom
	) as done;
</sql:query>
{"rows": 
<c:forEach items="${ages.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
 