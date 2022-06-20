<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Symptom</h6>
	<select id="${param.block}-symptom-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select symptom from n3c_dashboard.symptom_map order by symptom_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.symptom}">${row.symptom}</option>
		</c:forEach>
	</select>
</div>
