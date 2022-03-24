<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

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
	<c:import url="https://labs.cd2h.org/n3c-cohort/graphs/line_registrations.jsp">
		<c:param name="data_page" value="https://labs.cd2h.org/n3c-cohort/feeds/line_dta_dua_regs.jsp" />
		<c:param name="dom_element" value="#registration_line" />
	</c:import>
</div>
