<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div class="panel-body">
	<h6>Observation</h6>
	<select id="${param.block}-observation-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select observation,observation from n3c_dashboard.observation_map order by observation_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.observation}">${row.observation}</option>
		</c:forEach>
	</select>
</div>
