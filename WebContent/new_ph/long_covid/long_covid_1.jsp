<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="long_covid_1" />
	<jsp:param name="block_header" value="Long COVID: U09.9 ICD-10 Code" />
	<jsp:param name="topic_description" value="Sample: All patients in the N3C Data Enclave with a medical visit containing the ICD-10 code for PASC (U09.9)" />

	<jsp:param name="kpis" value="long_covid/kpis2.jsp" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="long_covid/severityGender.jsp" />
	<jsp:param name="gender_panel" value="long_covid/genderSeverity.jsp" />

	<jsp:param name="datatable" value="long_covid/severity_table.jsp" />
	<jsp:param name="datatable_div" value="long_covid_severity" />
	<jsp:param name="datatable_feed" value="long_covid/feeds/severity.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>

<script>
	long_covid_1_toggle("severity");
</script>
