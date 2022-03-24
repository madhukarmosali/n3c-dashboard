<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

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
	<c:import url="https://labs.cd2h.org/n3c-cohort/graphs/line_data_dua.jsp">
		<c:param name="data_page" value="https://labs.cd2h.org/n3c_-ohort/feeds/line_dta_dua_regs.jsp" />
		<c:param name="dom_element" value="#dua_line" />
	</c:import>
</div>
