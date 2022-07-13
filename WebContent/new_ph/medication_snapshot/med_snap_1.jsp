<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="med_snap_1" />
	<jsp:param name="block_header" value="Sotrovimab Treated Patients: Demographics" />
	<jsp:param name="topic_description" value="secondary_1" />

	<jsp:param name="kpis" value="medication_snapshot/kpis.jsp" />
	
	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter4" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="medication_snapshot/severity.jsp" />
	<jsp:param name="age_panel" value="medication_snapshot/age.jsp" />
	<jsp:param name="gender_panel" value="medication_snapshot/gender.jsp" />

	<jsp:param name="datatable" value="medication_snapshot/tables/aggregated_table.jsp" />
	<jsp:param name="datatable_div" value="sotrovimab_demo" />
	<jsp:param name="datatable_feed" value="medication_snapshot/feeds/sotrovimab_demo.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>
<script>
	med_snap_1_toggle("severity");
</script>


