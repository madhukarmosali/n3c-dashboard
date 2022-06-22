<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="adult_summary_4" />
	<jsp:param name="block_header" value="Demographics: Unknown Vaccination and Comorbidities" />

	<jsp:param name="kpis" value="adult_summary/kpis.jsp" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp" />
	<jsp:param name="age_panel" value="test_panel.jsp" />
	<jsp:param name="race_panel" value="test_panel.jsp" />
	<jsp:param name="gender_panel" value="test_panel.jsp" />

	<jsp:param name="datatable" value="adult_summary/unknown_vaccination_table.jsp" />
	<jsp:param name="datatable_div" value="adult_unknown_vaccination" />
	<jsp:param name="datatable_feed" value="adult_summary/feeds/unknown_vaccination.jsp" />
</jsp:include>
<script>
	adult_summary_4_toggle("unknown_vaccinated");
</script>
