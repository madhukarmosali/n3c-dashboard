<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select * from (SELECT
		condition_concept_name as condition,
		MAX(ptct) FILTER (WHERE covid_test_post_pax = 'known positive') AS "KnownPositive",
		MAX(ptct) FILTER (WHERE covid_test_post_pax = 'unknown covid test status') AS "UnknownCovidTestStatus",
		MAX(ptct) FILTER (WHERE covid_test_post_pax = 'known negative') AS "KnownNegative", 
		sum(case when ptct = '<20' then '0'::int else ptct::int end) as Total
		FROM n3c_questions.conditions_in_window
		NATURAL JOIN n3c_dashboard.category_condition
		WHERE category = ?
		GROUP BY condition_concept_name order by total desc
	) as foo limit 20) as done;
	<sql:param>${param.category}</sql:param>
</sql:query>
{
    "headers": [
        {"value":"condition", "label":"Condition"},
        {"value":"KnownPositive", "label":"Known Positive"},
        {"value":"UnknownCovidTestStatus", "label":"Unknown Covid Test Status"},
        {"value":"KnownNegative", "label":"Known Negative"},
        {"value":"total", "label":"Total"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}