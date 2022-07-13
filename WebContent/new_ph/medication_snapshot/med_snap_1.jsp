<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="all_summary_1" />
	<jsp:param name="block_header" value="Demographics: COVID+" />
	<jsp:param name="topic_description" value="secondary_1" />

	<jsp:param name="kpis" value="all_summary/kpis.jsp" />

	<jsp:param name="severity_panel" value="medication_snapshot/severity.jsp" />
	<jsp:param name="age_panel" value="medication_snapshot/age.jsp" />
	<jsp:param name="gender_panel" value="medication_snapshot/gender.jsp" />

	<jsp:param name="datatable" value="medication_snapshot/tables/aggregated_table.jsp" />
	<jsp:param name="datatable_div" value="all_aggregated" />
	<jsp:param name="datatable_feed" value="medication_snapshot/feeds/sotrovimab_demo.jsp" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>
<script>
	all_summary_1_toggle("severity");
</script>


