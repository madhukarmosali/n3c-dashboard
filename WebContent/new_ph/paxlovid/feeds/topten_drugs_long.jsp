<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select medication,		
		unnest(array['Positive', 'Negative', 'Unknown']) AS values,
   		unnest(array[
   			case when ("KnownPositive" = '<20') then 0
			when ("KnownPositive" = '') then 0
			else "KnownPositive"::int
			end, 
			case when ("KnownNegative" = '<20') then 0
			when ("KnownNegative" = '') then 0
			else "KnownNegative"::int
			end, 
			case when ("UnknownCovidTestStatus" = '<20') then 0
			when ("UnknownCovidTestStatus" = '') then 0
			else "UnknownCovidTestStatus"::int
			end
		]) AS count
	from (SELECT
		first_four_name as medication,
		MAX(ptct) FILTER (WHERE covid_test_post_pax = 'known positive') AS "KnownPositive",
		MAX(ptct) FILTER (WHERE covid_test_post_pax = 'unknown covid test status') AS "UnknownCovidTestStatus",
		MAX(ptct) FILTER (WHERE covid_test_post_pax = 'known negative') AS "KnownNegative", 
		sum(case when ptct = '<20' then '0'::int else ptct::int end) as Total
		FROM n3c_questions.atc_drugs_in_the_window
		GROUP BY first_four_name order by total desc
		limit 20
	) as foo order by medication
	)as done;
</sql:query>
{
    "headers": [
        {"value":"medication", "label":"Medication"},
        {"value":"values", "label":"Status"},
        {"value":"count", "label":"Count"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}