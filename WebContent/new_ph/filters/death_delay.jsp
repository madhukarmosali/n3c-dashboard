<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="panel-body">
	<h6>Days After Discharge</h6>
	<select id="${param.block}-delay-select" multiple="multiple">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select distinct datediff_bw_death_and_hos as date, split_part(datediff_bw_death_and_hos, '-', 1)::int 
			from n3c_questions.binned_diff_bw_death_and_hospital_visit 
			order by split_part(datediff_bw_death_and_hos, '-', 1)::int;
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			<option value="${row.date}">${row.date}</option>
		</c:forEach>
	</select>
</div>
