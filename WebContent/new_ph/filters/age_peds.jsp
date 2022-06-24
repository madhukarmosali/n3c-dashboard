<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Age</h6>
	<select id="${param.block}-age-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select age_bin,age_abbrev from n3c_dashboard.age_map6 where age_bin in ('0-4', '12-15', '5-11', '16-<18', 'null') order by age_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.age_bin}">${row.age_abbrev}</option>
		</c:forEach>
	</select>
</div>