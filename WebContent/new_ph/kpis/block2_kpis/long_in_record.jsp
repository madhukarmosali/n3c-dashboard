<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

 <sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select to_char(sum(count)/1000.0, '999.99')||'k' as patient_count
 	from (select 
			case
				when (count = '<20' or count is null) then 0
				else count::int
			end as count
			from n3c_questions.icd10_symptoms_summary_counts where observation = 'Has U09.9 in Record') as foo
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class="col-12 kpi-main-col">
		<div class="panel-primary kpi">
			<div class="kpi-inner">
				<div class="panel-body">
					<table>
						<tr>
							<td><i class="fas fa-users"></i> Patients w/Symptoms & U09.9 in Record</td>
						</tr>
					</table>
				</div>
				<div id="${param.block}_in_record_kpi" class="panel-heading kpi_num">${row.patient_count}</div>
			</div>
		</div>
	</div>
</c:forEach>
