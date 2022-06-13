<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="cases" dataSource="jdbc/N3CPublic">
	select json_agg(json order by start)
	from (select
			test_date_diff_range as time_range,
			count,
			range_start as start, 
			case 
				when (count = '<20') then 0
				else count::int
			end as actual_count
			from n3c_questions.reinfection_leonie_requested
			where test_date_diff_range not in ('0-15','15-30')
		) as json;

</sql:query>


{
    "headers": [
        {"value":"time_range", "label":"Time Range in Days"},
        {"value":"count", "label":"Number of Patients"},
        {"value":"start", "label":"Start"}, 
        {"value":"actual_count", "label":"Actual Count"}
    ],
    "rows" : 
<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
	${row.json_agg}
</c:forEach>

}

