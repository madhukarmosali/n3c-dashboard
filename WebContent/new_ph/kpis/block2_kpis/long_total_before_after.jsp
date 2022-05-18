<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

 <sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select to_char(sum(count)/1000000.0, '999.99')||'M' as count
 	from (select 
			count
			from n3c_questions.symptom_before_or_after_covid) as foo
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class="col-12 col-md-3 kpi-main-col">
		<div class="panel-primary kpi">
			<div class="kpi-inner">
				<div class="panel-body">
					<table>
						<tr>
							<td><i class="fas fa-users"></i> Total Patients</td>
						</tr>
					</table>
				</div>
				<div id="${param.block}_long_total_before_after_kpi" class="panel-heading kpi_num">${row.count}</div>
				<div class="kpi-limit"><small>(see limitations below)</small></div>
			</div>
		</div>
	</div>
</c:forEach>
