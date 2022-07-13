<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Vaccination Status</h6>
	<select id="${param.block}-vaccinationstatus-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select distinct vaccinated_abbrev, vaccinated_seq from n3c_dashboard.vaccinated_map order by vaccinated_seq;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.vaccinated_abbrev}">${row.vaccinated_abbrev}</option>
		</c:forEach>
	</select>
</div>
