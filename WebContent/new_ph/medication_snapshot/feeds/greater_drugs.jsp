<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
		from (select * from (SELECT
			first_four_name as condition,
			MAX(ptct) FILTER (WHERE covid_test_post_pax = 'known positive') AS "KnownPositive",
			MAX(ptct) FILTER (WHERE covid_test_post_pax = 'unknown covid test status') AS "UnknownCovidTestStatus",
			MAX(ptct) FILTER (WHERE covid_test_post_pax = 'known negative') AS "KnownNegative", 
			sum(case when ptct = '<20' then '0'::int else ptct::int end) as Total
		FROM n3c_questions.atc_drugs_in_the_window
		GROUP BY first_four_name order by total
	) as foo where total > 0 ) as done;
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