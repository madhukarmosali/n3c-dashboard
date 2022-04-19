<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

 <sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select count(distinct drug_domain) from n3c_questions.covid_patients_demographics_censored;
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class="panel-body kpi">
		<table>
			<tr>
				<td><i class="fas fa-users"></i></td>
				<td>&nbsp;</td>
				<td>Medication Class Count *</td>
			</tr>
		</table>
	</div>
	<div id="${param.block}_medication_class_count" class="panel-heading kpi_num">${row.count}</div>
</c:forEach>
