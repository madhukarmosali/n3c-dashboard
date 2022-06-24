<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="ages" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (
		select sum(
			case
			when (num_patients = '<20' or num_patients is null) then 0
			else num_patients::int
			end
		) as count, 
		'Long COVID ICD-10 (U09.9) In Record' as label, 
		13 as viz_id
		from n3c_questions.long_covid_icd_agg_censored 
		UNION 
		select sum(
			case
			when (num_patients = '<20' or num_patients is null) then 0
			else num_patients::int
			end
		) as count, 
		'Long COVID Clinic Visit' as label,
		2 as viz_id
		from n3c_questions.long_covid_concept_set_agg_censored
	) as done;
</sql:query>
{"rows": 
<c:forEach items="${ages.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
 