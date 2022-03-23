<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" flush="true" />

<body>
	<jsp:include page="navbar.jsp" flush="true" />

	<div class="container-fluid">
		<h2 class="header-text">
			<img src="images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">
			The National <strong>COVID-19</strong> Cohort Collaborative (N3C)
		</h2>
	</div>

	<div class="row large-mb">
		<div class="col-xs-4">
			<h3 class="header-text">Metrics</h3>
						<table class="table table-hover">
		    				<thead>
		    					<tr><th>Institutions</th><th>Count</th></tr>
		    				</thead>
		    				<sql:query var="duas" dataSource="jdbc/N3CPublic">
		        				select count(*) from n3c_admin.dua_master where duaexecuted is not null;
		    				</sql:query>
		    				<c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
		        				<tr><td>Institutions with Executed DUAs</td><td align=right>${row.count}</td></tr>
		    				</c:forEach>
		    				<sql:query var="duas" dataSource="jdbc/N3CPublic">
		        				select count(*) from n3c_admin.dua_master where duaexecuted is not null and institutionid in (select ror_id from n3c_admin.gsuite_view );
		    				</sql:query>
		    				<c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
		        				<tr><td>DUA Institutions with Registered Users</td><td align=right>${row.count}</td></tr>
		    				</c:forEach>
		    				<sql:query var="dtas" dataSource="jdbc/N3CPublic">
		        				select count(*) from n3c_admin.dta_master where dtaexecuted is not null;
		    				</sql:query>
		    				<c:forEach items="${dtas.rows}" var="row" varStatus="rowCounter">
		        				<tr><td>Institutions with Executed DTAs</td><td align=right>${row.count}</td></tr>
		    				</c:forEach>
	    				</table>
			<div id="dua_line">
				<c:import url="http://localhost:8080/n3c_cohort/graphs/line_data_dua.jsp">
					<c:param name="data_page" value="http://localhost:8080/n3c_cohort/feeds/line_dta_dua_regs.jsp" />
					<c:param name="dom_element" value="#dua_line" />
				</c:import>
			</div>
						<table class="table table-hover">
				    		<thead>
				    			<tr><th>Users</th><th>Count</th></tr>
				    		</thead>
				    		<sql:query var="duas" dataSource="jdbc/N3CPublic">
				        		select count(*) from n3c_admin.registration;
				    		</sql:query>
				    		<c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
				        		<tr><td>Total User Registrations</td><td align=right>${row.count}</td></tr>
				    		</c:forEach>
				    		<sql:query var="duas" dataSource="jdbc/N3CPublic">
				        		select count(*) from n3c_admin.registration where enclave;
				    		</sql:query>
				   			<c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
				        		<tr><td>Users Requesting Enclave Access</td><td align=right>${row.count}</td></tr>
				    		</c:forEach>
				    		<sql:query var="duas" dataSource="jdbc/N3CPublic">
				        		select count(*) from palantir.n3c_user;
				    		</sql:query>
				    		<c:forEach items="${duas.rows}" var="row" varStatus="rowCounter">
				        		<tr><td>Registered Enclave Users From DUA Institutions</td><td align=right>${row.count}</td></tr>
				    		</c:forEach>
				    	</table>
			<div id="registration_line">
				<c:import url="http://localhost:8080/n3c_cohort/graphs/line_registrations.jsp">
					<c:param name="data_page" value="http://localhost:8080/n3c_cohort/feeds/line_dta_dua_regs.jsp" />
					<c:param name="dom_element" value="#registration_line" />
				</c:import>
			</div>
		</div>
		<div class="col-xs-4">
			<h3 class="header-text">Institutions</h3>
			<div id="graph"></div>
			<jsp:include page="graph_support/site_map.jsp">
				<jsp:param name="ld" value="300" />
				<jsp:param name="map_type" value="${param.map_type}" />
				<jsp:param name="state_page" value="graph_support/us-states.json" />
				<jsp:param name="data_page" value="feeds/map_data.jsp" />
				<jsp:param name="site_page" value="feeds/siteLocations.jsp" />
				<jsp:param name="dom_element" value="#graph" />
			</jsp:include>
		</div>
		<div class="col-xs-4">
			<h3 class="header-text">Groups</h3>
			<div class="panel-body">
			<div class="panel-heading">Domain Team Roster</div>
			<div class="panel-body">
				<div id="domain-team-roster"></div>
				<jsp:include page="tables/domain_team_roster.jsp"/>
			</div>
				<div id="project-roster"></div>
				<jsp:include page="tables/project_roster_styled.jsp" />
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
