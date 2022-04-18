<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- covid_patients_demographics_censored (2022-03-31 05:01) -->

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="medications_1" />
	<jsp:param name="block_header" value="COVID+ Patients Distribution by Medication" />

	<jsp:param name="kpis" value="medications/kpis.jsp?block=medications_1" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=severity" />

	<jsp:param name="datatable" value="medications/medications_table.jsp" />
	<jsp:param name="datatable_div" value="medications_medications" />
	<jsp:param name="datatable_feed" value="medications/feeds/medications.jsp" />
</jsp:include>
