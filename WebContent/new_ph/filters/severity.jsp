<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Severity</h6>
	<select id="${param.block}-severity-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select severity,severity_abbrev from n3c_dashboard.severity_map order by severity_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.severity}">${row.severity_abbrev}</option>
		</c:forEach>
	</select>
</div>
