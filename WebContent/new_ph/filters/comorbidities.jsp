<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Comorbidities</h6>
	<select id="${param.block}-comorbidities-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			SELECT 
			distinct(
				case when (replace(condition_name, 'Charlson - ', '')) = 'DM' then 'Diabetes'
            	else replace(condition_name, 'Charlson - ', '')
            	end) AS symptoms, 
            	(replace(condition_name, 'Charlson - ', '')) as condition_name
			from n3c_questions.covid_positive_comorbidity_non_grouped_demo_censored
			order by symptoms;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.condition_name}">${row.symptoms}</option>
		</c:forEach>
	</select>
</div>
