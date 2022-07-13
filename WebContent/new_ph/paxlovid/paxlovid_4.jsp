<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<jsp:include page="kpis.jsp">
	<jsp:param value="paxlovid_4" name="block"/>
</jsp:include>
<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="paxlovid_4" />
	<jsp:param name="block_header" value="Paxlovid" />
	<jsp:param name="topic_description" value="secondary_1" />
	<jsp:param name="topic_title" value="Demographics of Patients With Paxlovid" />

	<jsp:param name="result_filter" value="true" />

	<jsp:param name="simple_panel" value="paxlovid/age.jsp" />

	<jsp:param name="datatable" value="paxlovid/demographics_age_table.jsp" />
	<jsp:param name="datatable_div" value="paxlovid_paxlovid_age" />
	<jsp:param name="datatable_feed" value="paxlovid/feeds/demographics_age.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
	<jsp:param name="datatable_filtered_kpis" value="patient_count" />
</jsp:include>

<script>
	paxlovid_4_toggle("age");
</script>
