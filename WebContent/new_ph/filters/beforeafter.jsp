<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Condition Relative to COVID+</h6>
	<select id="${param.block}-symptomoccurrence-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select distinct(case
				when (condition_after_covid_positive) then 'After COVID+'
				else 'Before COVID+'
				end) as condition from n3c_questions.symptom_before_or_after_covid;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.condition}">${row.condition}</option>
		</c:forEach>
	</select>
</div>
