<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by drug_domain desc,concept_set_name))
	from (select drug_domain, concept_set_name, age_bin as age, patient_count, total_count, age_abbrev, age_seq
			from (select
					drug_domain,
					concept_set_name,
					age_bin,
					case
						when (num_patients = '<20' or num_patients is null) then 0
						else num_patients::int
					end as patient_count,
					total_patients as total_count
				  from n3c_questions.covid_patients_demographics_censored where drug_domain != 'N/A'
		  	) as foo
		  	natural join n3c_dashboard.age_map4
		  ) as done;
</sql:query>
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
