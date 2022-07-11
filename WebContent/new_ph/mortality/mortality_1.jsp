<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="mortality_1" />
	<jsp:param name="block_header" value="Mortality: COVID+ and Hospitalization" />
	<jsp:param name="topic_description" value="secondary_1" />

	<jsp:param name="kpis" value="mortality/kpis.jsp" />

	<jsp:param name="age_filter10" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="mortality/age.jsp" />
	<jsp:param name="race_panel" value="mortality/race.jsp" />
	<jsp:param name="gender_panel" value="mortality/gender.jsp" />
	<jsp:param name="ethnicity_panel" value="mortality/ethnicity.jsp" />

	<jsp:param name="datatable" value="mortality/hospitalization_table.jsp" />
	<jsp:param name="datatable_div" value="mortality_hospitalization" />
	<jsp:param name="datatable_feed" value="mortality/feeds/hospitalization.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>
<script>
	mortality_1_toggle("age");
</script>
