<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="comorbidity_1" />
	<jsp:param name="block_header" value="Congestive Heart Failure" />
	<jsp:param name="topic_description" value="secondary_1" />
	<jsp:param name="topic_title" value="Demographics of Patients With Diagnosed Long COVID (U09.9)" />
	
	<jsp:param name="kpis" value="hlh/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="age_panel" value="hlh/severityGender.jsp" />
	<jsp:param name="gender_panel" value="hlh/genderSeverity.jsp" />

	<jsp:param name="datatable" value="hlh/hlh_table.jsp" />
	<jsp:param name="datatable_div" value="hlh_data_2" />
	<jsp:param name="datatable_feed" value="hlh/feeds/hlh.jsp?comorbidity=chf" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>

<script>
	hlh_1_toggle("age");
</script>
