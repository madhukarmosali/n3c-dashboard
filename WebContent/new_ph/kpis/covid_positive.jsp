<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<sql:query var="totals" dataSource="jdbc/N3CPublic">
	select to_char(value::int/1000000.0, '999.99')||'M' as count from n3c_admin.enclave_stats where title='covid_positive_patients';
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class=" panel-primary">
		<div class="panel-body">
			<div class="kpi-flex-container">
				<div class="kpi-flex-item mr-2">
					<i class="fas fa-user-plus"></i>
				</div>
				<div class="kpi-flex-item">
					<span>COVID+ Patients</span>
				</div>
			</div>
		</div>
		<div class="panel-heading kpi_num">${row.count}</div>
	</div>
</c:forEach>
