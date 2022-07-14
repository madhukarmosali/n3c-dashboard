<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (
		select *, count_non_hispanic + count_hispanic + count_ethnicity_unknown as total from (
			select INITCAP(gender_concept_name) as gender, 
			case when (count_non_hispanic = '<20') then 0 else COALESCE(count_non_hispanic::int, 0) end as count_non_hispanic,  
    		case when (count_hispanic = '<20') then 0 else COALESCE(count_hispanic::int, 0) end as count_hispanic, 
    		case when (count_ethnicity_unknown = '<20') then 0 else COALESCE(count_ethnicity_unknown::int,0) end as count_ethnicity_unknown, 
			race 
			from n3c_questions.person_agg_demographic_censored 
			order by gender_concept_name
		) as foo
	) as done;
</sql:query>
{
    "headers": [
        {"value":"gender", "label":"Gender"},
        {"value":"count_non_hispanic", "label":"Non-Hispanic or Latino"},
        {"value":"count_hispanic", "label":"Hispanic or Latino"},
        {"value":"count_ethnicity_unknown", "label":"Unknown/Not Reported"},
        {"value":"race", "label":"Race"},
        {"value":"total", "label":"Total"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
