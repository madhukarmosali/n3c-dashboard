<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="peds_summary_5" />
	<jsp:param name="block_header" value="Demographics: Ungrouped Comorbidities" />
	<jsp:param name="topic_description" value="secondary_5" />

	<jsp:param name="kpis" value="pediatrics/kpis.jsp" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filterpeds2" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter3" value="true" />
	<jsp:param name="comorbidities_filter" value="true" /> 

	<jsp:param name="severity_panel" value="pediatrics/severity.jsp" />
	<jsp:param name="age_panel" value="pediatrics/age2.jsp" />
	<jsp:param name="race_panel" value="pediatrics/race.jsp" />
	<jsp:param name="gender_panel" value="pediatrics/gender.jsp" />
	<jsp:param name="comorbidity_panel" value="pediatrics/comorbidity.jsp" />

	<jsp:param name="datatable" value="pediatrics/ungrouped_table.jsp" />
	<jsp:param name="datatable_div" value="peds_ungrouped" />
	<jsp:param name="datatable_feed" value="pediatrics/feeds/ungrouped.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>
<script>
	peds_summary_5_toggle("severity");
</script>
