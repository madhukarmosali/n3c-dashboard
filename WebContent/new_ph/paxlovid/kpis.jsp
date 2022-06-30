<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<div class="row">
	<sql:query var="totals" dataSource="jdbc/N3CPublic">
		select to_char(value::int/1000000.0, '999.99')||'M' as count from n3c_admin.enclave_stats where title='covid_positive_patients';
	</sql:query>
	<c:forEach items="${totals.rows}" var="row" varStatus="rowCounter">
		<div class="col-12 col-sm-6 kpi-main-col">
			<div class="panel-primary kpi">
				<div class="kpi-inner">
					<div class="panel-body">
						<table>
							<tr>
								<td><i class="fas fa-user-plus"></i> COVID+ Patients*</td>
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
				<div class="panel-heading kpi_num">21,993</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
		<div class="col-12 mx-auto mt-2 mb-2 text-center">
All data shown occurred between the first day after the end of the 5-day course of Paxlovid (i.e., day 6 post-Paxlovid) and three weeks following (i.e., day 27 post-Paxlovid).
</div>
</div>
