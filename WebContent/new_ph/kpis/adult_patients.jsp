<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select 
 		case
 			when sum(count) < 1000 then sum(count)::text
 			when sum(count) < 1000000 then to_char(sum(count)/1000.0, '999.99')||'k'
 			else to_char(sum(count)/1000000.0, '999.99')||'M'
 		end as count
			from (select
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as count
				  from n3c_questions.covid_severity_grouped_demo_adults_censored
				) as foo;
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class=" panel-primary">
		<div class="panel-body">
			<div class="kpi-flex-container">
				<div class="kpi-flex-item mr-2">
					<i class="fas fa-users"></i>
				</div>
				<div class="kpi-flex-item">
					<span>Number of Patients *</span>
				</div>
			</div>
		</div>
		<div id="${param.block}_adult_total_kpi" class="panel-heading kpi_num">${row.count}</div>
	</div>
	
</c:forEach>
