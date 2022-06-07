<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<sql:query var="totals" dataSource="jdbc/N3CPublic">
	select to_char(sum(patient_count)::int/1000000.0, '999.99')||'M'  as count
			from (select
					case
						when (count = '<20' or count is null) then 0
						else count::int
					end as patient_count
				  from n3c_questions.icd10_symptoms_summary_counts
				  where observation = 'Has not tested positive'
		  	) as foo
</sql:query>

<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
	<div class="col-12 col-md-3 kpi-main-col">
		<div class="panel-primary kpi">
			<div class="kpi-inner">
				<div class="panel-body">
					<table>
						<tr>
							<td><i class="fas fa-users"></i> Patients w/Long COVID-Related Symptoms & have not Tested Positive</td>
						</tr>
					</table>
				</div>
				<div id="${param.block}_tested_positive_kpi" class="panel-heading kpi_num">${row.count}</div>
				<div class="kpi-limit"><a onclick="limitlink(); return false;" href="#limitations-section">see limitations below</a></div>
			</div>
		</div>
	</div>
</c:forEach>