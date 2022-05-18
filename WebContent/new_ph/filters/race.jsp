<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Race</h6>
	<select id="${param.block}-race-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select race,race_abbrev from n3c_dashboard.race_map order by race_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.race}">${row.race_abbrev}</option>
		</c:forEach>
	</select>
</div>
