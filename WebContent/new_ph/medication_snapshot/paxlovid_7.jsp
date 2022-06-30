<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<div class="row">
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
				<div class="col-12 col-sm-6 kpi-main-col">
					<div class="panel-primary kpi">
						<div class="kpi-inner">
							<div class="panel-body">
								<table>
									<tr>
										<td><i class="fas fa-users"></i> # of Patients*</td>
									</tr>
								</table>
							</div>
							<div class="panel-heading kpi_num">${row.count}</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="col-12 col-sm-6 kpi-main-col">
					<div class="panel-primary kpi">
						<div class="kpi-inner">
							<div class="panel-body">
								<table>
									<tr>
										<td><i class="fas fa-users"></i> # of Patients Taking Paxlovid</td>
									</tr>
								</table>
							</div>
							<div  class="panel-heading kpi_num">21,993</div>
						</div>
					</div>
			</div>
		</div>
	</div>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="paxlovid_7" />
	<jsp:param name="block_header" value="Paxlovid" />
	<jsp:param name="topic_description" value="secondary_1" />
	<jsp:param name="topic_title" value="Demographics of Patients With Paxlovid" />
	
	<jsp:param name="simple_panel" value="medication_snapshot/ethnicity.jsp" />

	<jsp:param name="datatable" value="medication_snapshot/demographics_ethnicity_table.jsp" />
	<jsp:param name="datatable_div" value="medication_snapshot_paxlovid_ethnicity" />
	<jsp:param name="datatable_feed" value="medication_snapshot/feeds/demographics_ethnicity.jsp" />
</jsp:include>

<script>
	paxlovid_7_toggle("ethnicity");
</script>
