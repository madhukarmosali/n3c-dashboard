<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

 <sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select to_char(sum(count)/1000000.0, '999.99')||'M' as count
 	from (select 
			case
				when (count = '<20' or count is null) then 0
				else count::int
			end as count
			from n3c_questions.icd10_symptoms_summary_counts) as foo
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class="panel-body kpi">
		<table>
			<tr>
				<td><i class="fas fa-users"></i></td>
				<td>&nbsp;</td>
				<td>Patient ICD Summary *</td>
			</tr>
		</table>
	</div>
	<div id="${param.block}_long_icd_summary_kpi" class="panel-heading kpi_num">${row.count}</div>
</c:forEach>
