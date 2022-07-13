<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Other Meds</h6>
	<select id="${param.block}-othermeds-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select distinct medications_abbrev, medications_seq from n3c_dashboard.medications_map order by medications_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.medications_abbrev}">${row.medications_abbrev}</option>
		</c:forEach>
	</select>
</div>
