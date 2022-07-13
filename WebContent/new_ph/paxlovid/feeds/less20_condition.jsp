<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select condition, "KnownPositive", "UnknownCovidTestStatus", "KnownNegative", Total,
		case when ("KnownPositive" = '<20') then 0
		when ("KnownPositive" = '') then -1
		else "KnownPositive"::int
		end as positive_sort,
		case when ("KnownNegative" = '<20') then 0
		when ("KnownNegative" = '') then -1
		else "KnownNegative"::int
		end as negative_sort,
		case when ("UnknownCovidTestStatus" = '<20') then 0
		when ("UnknownCovidTestStatus" = '') then -1
		else "UnknownCovidTestStatus"::int
		end as unknown_sort 
	from (SELECT
		condition_concept_name as condition,
		MAX(ptct) FILTER (WHERE covid_test_post_pax = 'known positive') AS "KnownPositive",
		MAX(ptct) FILTER (WHERE covid_test_post_pax = 'unknown covid test status') AS "UnknownCovidTestStatus",
		MAX(ptct) FILTER (WHERE covid_test_post_pax = 'known negative') AS "KnownNegative", 
		sum(case when ptct = '<20' then '0'::int else ptct::int end) as Total
	FROM n3c_questions.conditions_in_window
	GROUP BY condition_concept_name order by total
	) as foo where total = 0 ) as done;
</sql:query>
{
    "headers": [
        {"value":"condition", "label":"Condition"},
        {"value":"KnownPositive", "label":"Known Positive"},
        {"value":"UnknownCovidTestStatus", "label":"Unknown Covid Test Status"},
        {"value":"KnownNegative", "label":"Known Negative"},
        {"value":"total", "label":"Total"},
        {"value":"positive_sort", "label":"Dummy1"},
        {"value":"negative_sort", "label":"Dummy1"},
        {"value":"unknown_sort", "label":"Dummy1"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}