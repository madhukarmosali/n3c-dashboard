<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body border">
	<h6>Ethnicity</h6>
	<select id="${param.block}-ethnicity-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select ethnicity,ethnicity_abbrev from n3c_dashboard.ethnicity_map order by ethnicity_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.ethnicity}">${row.ethnicity_abbrev}</option>
		</c:forEach>
	</select>
</div>
