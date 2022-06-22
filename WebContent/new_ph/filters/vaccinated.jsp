<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Vaccinated</h6>
	<select id="${param.block}-vaccinated-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select 
			case
			when (vaccinated = '1') then 'True'
			else vaccinated
			end as vaccinated
			from (select distinct(vaccinated) from n3c_questions.covid_positive_with_vax_censored) as foo;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.vaccinated}">${row.vaccinated}</option>
		</c:forEach>
	</select>
</div>
