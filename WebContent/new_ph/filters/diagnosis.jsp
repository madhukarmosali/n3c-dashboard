<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>COVID Diagnosis Type</h6>
	<select id="${param.block}-diagnosis-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select distinct diagnosis_abbrev, diagnosis_seq from n3c_dashboard.diagnosis_map order by diagnosis_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.diagnosis_abbrev}">${row.diagnosis_abbrev}</option>
		</c:forEach>
	</select>
</div>
