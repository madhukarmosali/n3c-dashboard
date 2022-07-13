<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6># of Comorbidities</h6>
	<select id="${param.block}-numberofcomorbidities-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select distinct comorbidity_abbrev, comorbidity_seq from n3c_dashboard.comorbidity_number_map order by comorbidity_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.comorbidity_abbrev}">${row.comorbidity_abbrev}</option>
		</c:forEach>
	</select>
</div>
