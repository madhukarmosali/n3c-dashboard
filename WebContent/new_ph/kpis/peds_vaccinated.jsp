<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select 
 		case
 			when sum(count) < 1000 then sum(count)::text
 			when sum(count) < 1000000 then to_char(sum(count)/1000.0, '999.99')||'k'
 			else to_char(sum(count)/1000000.0, '999.99')||'M'
 		end as count
			from (select
					age_bin,
					case
						when (num_patients = '<20' or num_patients is null) then 0
						else num_patients::int
					end as count
				  from n3c_questions.covid_positive_with_vax_censored
				) as foo
		  	natural join n3c_dashboard.age_map3
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class="panel-body kpi">
		<table>
			<tr>
				<td><i class="fas fa-users"></i></td>
				<td>&nbsp;</td>
				<td>COVID+ Pediatrics Patients *</td>
			</tr>
		</table>
	</div>
	<div id="${param.block}_adult_total_kpi" class="panel-heading kpi_num">${row.count}</div>
</c:forEach>
