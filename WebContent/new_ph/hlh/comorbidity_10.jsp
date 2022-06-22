<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="comorbidity_10" />
	<jsp:param name="block_header" value="Cancer" />
	<jsp:param name="topic_description2" value="secondary_10" />
	<jsp:param name="topic_title" value="Demographics of Patients With Diagnosed Long COVID (U09.9)" />
	

	<jsp:param name="age_panel" value="hlh/ageGender.jsp" />
	<jsp:param name="gender_panel" value="hlh/genderAge.jsp" />

	<jsp:param name="datatable" value="hlh/hlh_table.jsp" />
	<jsp:param name="datatable_div" value="hlh_data_10" />
	<jsp:param name="datatable_feed" value="hlh/feeds/hlh.jsp?comorbidity=metastasis" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>

<script>
	hlh_1_toggle("age");
</script>
