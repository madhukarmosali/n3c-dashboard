<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="ages" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (
		select sum(count) as count, 
		'Before COVID+' as label, 
		6 as viz_id
		from n3c_questions.symptom_before_or_after_covid
		where not condition_after_covid_positive
		UNION 
		select sum(count) as count, 
		'After COVID+' as label, 
		6 as viz_id
		from n3c_questions.symptom_before_or_after_covid
		where condition_after_covid_positive 
	) as done;
</sql:query>
{"rows": 
<c:forEach items="${ages.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
 