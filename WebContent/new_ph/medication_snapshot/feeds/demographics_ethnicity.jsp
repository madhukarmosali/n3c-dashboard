<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
        select jsonb_pretty(jsonb_agg(done order by ethnicity_seq,result_seq))
        from (select ethnicity, result_abbrev as result, patient_display, patient_count, ethnicity_seq, result_seq
                        from (select
                                        category_name as ethnicity,
                                        test_result,
                                        ptct as patient_display,
                                        case
                                                when (ptct = '<20' or ptct is null) then 0
                                                else ptct::int
                                        end as patient_count
                                  from n3c_questions.table1_union
                                  where demographic_feature = 'ethnicity'
                        ) as foo
                        natural join n3c_dashboard.ethnicity_map
                        natural join n3c_dashboard.result_map
                  ) as done;
</sql:query>
{
    "headers": [
        {"value":"ethnicity", "label":"Ethnicity"},
        {"value":"result_abbrev", "label":"Test Result"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"ethnicity_seq", "label":"ethnicity seq"},
        {"value":"result_seq", "label":"result seq"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
        ${row.jsonb_pretty}
</c:forEach>
}
