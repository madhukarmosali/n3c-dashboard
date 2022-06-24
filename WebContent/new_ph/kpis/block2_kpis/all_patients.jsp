<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<sql:query var="totals" dataSource="jdbc/N3CPublic">
 	select 
 		case
 			when sum(num_patients) < 1000 then sum(num_patients)::text
 			when sum(num_patients) < 1000000 then to_char(sum(num_patients)/1000.0, '999.99')||'k'
 			else to_char(sum(num_patients)/1000000.0, '999.99')||'M'
 		end as count
			from (select
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as num_patients
				  from n3c_questions.all_ages_covid_pos_demo_censored
				) as foo;
</sql:query>
<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class="col-12 kpi-main-col">
		<div class="panel-primary kpi">
			<div class="kpi-inner">
				<div class="panel-body">
					<table>
						<tr>
							<td><i class="fas fa-users"></i> # of Patients*</td>
						</tr>
					</table>
				</div>
				<div id="${param.block}_patient_count_kpi" class="panel-heading kpi_num">${row.count}</div>
			</div>
		</div>
	</div>
</c:forEach>