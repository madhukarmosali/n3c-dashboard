<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="adult_summary_5" />
	<jsp:param name="block_header" value="Demographics: Ungrouped Comorbidities" />
	<jsp:param name="topic_description" value="secondary_5" />

	<jsp:param name="kpis" value="adult_summary/kpis.jsp" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter6" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter3" value="true" />
	<jsp:param name="comorbidities_filter" value="true" /> 

	<jsp:param name="severity_panel" value="adult_summary/severity.jsp" />
	<jsp:param name="age_panel" value="adult_summary/age2.jsp" />
	<jsp:param name="race_panel" value="adult_summary/race.jsp" />
	<jsp:param name="gender_panel" value="adult_summary/gender.jsp" />
	<jsp:param name="comorbidity_panel" value="adult_summary/comorbidity.jsp" />

	<jsp:param name="datatable" value="adult_summary/ungrouped_table.jsp" />
	<jsp:param name="datatable_div" value="adult_ungrouped" />
	<jsp:param name="datatable_feed" value="adult_summary/feeds/ungrouped.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>
<script>
	adult_summary_5_toggle("severity");
</script>
