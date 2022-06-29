<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="paxlovid_2" />
	<jsp:param name="block_header" value="Paxlovid" />
	<jsp:param name="topic_description" value="secondary_1" />
	<jsp:param name="topic_title" value="Demographics of Patients With Paxlovid" />
	
	<jsp:param name="age_panel" value="medication_snapshot/age.jsp" />
	<jsp:param name="gender_panel" value="medication_snapshot/gender.jsp" />
	<jsp:param name="race_panel" value="medication_snapshot/race.jsp" />
	<jsp:param name="ethnicity_panel" value="medication_snapshot/ethnicity.jsp" />

	<jsp:param name="datatable" value="medication_snapshot/demographics_table.jsp" />
	<jsp:param name="datatable_div" value="medication_snapshot_paxlovid" />
	<jsp:param name="datatable_feed" value="medication_snapshot/feeds/demographics_age.jsp" />
</jsp:include>

<script>
	paxlovid_2_toggle("age");
</script>
