<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

 <sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select to_char((sum(a::int)-sum(b::int))/1000000.0, '999.99')||'M' as count
 		from (
 			select 
 			case when title='person_rows' then value end as a,
 			case when title='covid_positive_patients' then value end as b
 			from  n3c_admin.enclave_stats 
 		)as foo;
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">

	<div class="col-12 kpi-main-col">
		<div class="panel-primary kpi">
			<div class="kpi-inner">
				<div class="panel-body">
					<table>
						<tr>
							<td>Total Patients that Have Not Tested Positive*</td>
						</tr>
					</table>
				</div>
				<div class="panel-heading kpi_num"><i class="fas fa-users"></i> <span id="${param.block}_patient_count_kpi">${row.count}</span></div>
			</div>
		</div>
	</div>

</c:forEach>
