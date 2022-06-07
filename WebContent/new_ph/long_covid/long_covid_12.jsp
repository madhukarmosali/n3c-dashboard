<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="long_covid_12" />
	<jsp:param name="block_header" value="Long COVID: Patients That Have Not Tested Positive For COVID" />
	<jsp:param name="topic_description" value="secondary_12" />
	<jsp:param name="topic_title" value="Demographics of Patients Who Have Experienced Long COVID-Related Symptoms but Do Not Have a Recorded COVID-19 Test or Diagnosis" />
	
	
	<jsp:param name="kpis" value="long_covid/kpis2.jsp" />

	<jsp:param name="age_panel" value="long_covid/not_positive_age.jsp" />
	<jsp:param name="race_panel" value="long_covid/not_positive_race.jsp" />
	<jsp:param name="gender_panel" value="long_covid/not_positive_gender.jsp" />
	<jsp:param name="ethnicity_panel" value="long_covid/not_positive_ethnicity.jsp" />
	
	<jsp:param name="datatable" value="long_covid/symptom_not_positive_table.jsp" />
	<jsp:param name="datatable_div" value="long_covid_symptom_not_positive" />
	<jsp:param name="datatable_feed" value="long_covid/feeds/symptom_summary.jsp?not_positive=true" />
	<jsp:param name="datatable_kpis" value="patient_count" />
</jsp:include>
<script>
	long_covid_12_toggle("age");
</script>
