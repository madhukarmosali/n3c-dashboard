<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- covid_smoking_demographics_censored (2022-03-31 04:54) -->
<!-- covid_smoking_severity_censored (2022-03-31 04:54) -->

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="smoking_1" />
	<jsp:param name="block_header" value="Demographics: COVID+ and Smoking Status" />

	<jsp:param name="kpis" value="smoking/kpis.jsp" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="smoking/severityStatus.jsp" />
	<jsp:param name="age_panel" value="smoking/ageStatus.jsp" />
	<jsp:param name="race_panel" value="smoking/raceStatus.jsp" />
	<jsp:param name="gender_panel" value="smoking/genderStatus.jsp" />

	<jsp:param name="datatable" value="smoking/demographics_table.jsp" />
	<jsp:param name="datatable_div" value="smoking_demographics" />
	<jsp:param name="datatable_feed" value="smoking/feeds/demographics.jsp" />

</jsp:include>
<script>
	smoking_1_toggle("severity");
</script>
