<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<style>
	#paxlovid .dataTables_filter{
		display: unset;
	}
</style>

<div class="paxlovid_1">
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
	<div class="row">
		<div class="col-12 mx-auto mt-2 mb-2 text-center">
			<h4>Top 20 Most Frequent Conditions Seen Between 6 to 29 Days After Paxlovid Treatment</h4>
		</div>
		<div class="col-12 col-md-6 viz" id="condition_viz_1">
			<div id="condition_viz"></div>
			<jsp:include page="vizs/stacked_bar.jsp">
				<jsp:param name="domName" value='condition_viz' />
				<jsp:param name="feed" value="topten_condition.jsp" />
				<jsp:param name="primary" value="condition" />
				<jsp:param name="secondary" value="result" />
				<jsp:param name="textmargin" value="340" />
			</jsp:include>
		</div>
		<div class="col-12 col-md-6 viz-table" id="condition_table_1">
			<jsp:include page="tables/top10_table.jsp" flush="true"/>
		</div>
	</div>
	<div class="row">
		<div class="col-12 mx-auto mt-2 mb-2 text-center">
			<h4>All Conditions Seen Between 6 to 29 Days After Paxlovid Treatment </h4>
		</div>
		<div class="col-12 col-md-6 viz-table" id="condition_table_2">
			<h5 class="text-center">Total Occurrences Greater Than 20</h5>
			<jsp:include page="tables/greater_table.jsp" flush="true"/>
		</div>
		<div class="col-12 col-md-6 viz-table" id="condition_table_3">
			<h5 class="text-center">Total Occurrences Less Than 20</h5>
			<jsp:include page="tables/less20_table.jsp" flush="true"/>
		</div>
	</div>
</div>
