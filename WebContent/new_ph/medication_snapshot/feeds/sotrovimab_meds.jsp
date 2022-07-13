<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select medications, sotrovimaboccurrence, severity_abbrev as severity, patient_display, patient_count,
				severity_abbrev, severity_seq, medications_abbrev, medications_seq, sotrovimaboccurrence as sotrovimaboccurrence_abbrev, sotrovimaboccurrence_seq
			from (select
					severity_type as severity,
					addtl_concept_set_name as medications,
					case when (sotrovimab_after_other_medication) THEN 'After Other Med'
					Else 'Before Other Med'
					End as sotrovimaboccurrence,
					case when (sotrovimab_after_other_medication) THEN 2
					Else 1
					End as sotrovimaboccurrence_seq,
					count as patient_display,
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as patient_count
				  from n3c_questions.sotrovimab_other_meds
		  	) as foo
		  	natural join n3c_dashboard.severity_map
		  	natural join n3c_dashboard.medications_map
		  ) as done;
</sql:query>
{
    "headers": [
        {"value":"medications", "label":"Medications"},
        {"value":"severity", "label":"Severity"},
        {"value":"sotrovimaboccurrence", "label":"Sotrovimab Occurrence"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"severity_abbrev", "label":"dummy1"},
        {"value":"severity_seq", "label":"dummy2"},
        {"value":"medications_abbrev", "label":"dummy3"},
        {"value":"medications_seq", "label":"dummy4"},
        {"value":"sotrovimaboccurrence_abbrev", "label":"dummy5"},
        {"value":"sotrovimaboccurrence_seq", "label":"dummy6"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}