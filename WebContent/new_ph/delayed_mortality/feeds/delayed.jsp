<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by diff_seq))
	from (select
					datediff_bw_death_and_hos,
					count as patient_display,
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as patient_count,
					substring(datediff_bw_death_and_hos from '^[0-9]*')::int as diff_seq
				  from n3c_questions.binned_diff_bw_death_and_hospital_visit
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"datediff_bw_death_and_hos", "label":"Days After Discharge"},
        {"value":"patient_display", "label":"Mortality Count"},
        {"value":"patient_count", "label":"Mortality actual"},
        {"value":"diff_seq", "label":"dummy1"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
