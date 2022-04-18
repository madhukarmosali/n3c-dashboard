<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- pediatric_covid_event_type (2022-03-31 05:02) -->
<!-- pediatric_covid_pos_demo_censored (2022-03-31 04:54) -->
<!-- covid_positive_comorbidities_demo_censored (2022-03-31 04:57) -->
<!-- covid_positive_comorbidities_demo_censored_wo_vax (2022-03-31 04:58) -->
<!-- covid_positive_comorbidity_non_grouped_demo_censored (2022-03-31 05:01) -->
<!-- covid_positive_mab_demo_censored (2022-03-31 05:01) -->
<!-- covid_positive_with_vax_censored (2022-03-31 04:59) -->

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="pediatrics_summary_1" />
	<jsp:param name="block_header" value="Pediatrics Demographics: COVID+" />

	<jsp:param name="kpis" value="pediatrics_summary/kpis.jsp?block=pediatrics_summary_1" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />

	<jsp:param name="datatable" value="../modules/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date" />

	<jsp:param name="datatable" value="pediatrics_summary/aggregated_table.jsp" />
	<jsp:param name="datatable_div" value="pediatrics_aggregated" />
	<jsp:param name="datatable_feed" value="pediatrics_summary/feeds/severity.jsp" />
</jsp:include>
<script>
	pediatrics_summary_1_toggle("severity");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="pediatrics_summary_2" />
	<jsp:param name="block_header" value="Pediatrics Demographics: Vaccinated" />

	<jsp:param name="kpis" value="pediatrics_summary/kpis.jsp?block=pediatrics_summary_2" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />

	<jsp:param name="datatable" value="pediatrics_summary/vaccinated_table.jsp" />
	<jsp:param name="datatable_div" value="pediatrics_vaccinated" />
	<jsp:param name="datatable_feed" value="pediatrics_summary/feeds/vaccinated.jsp" />
</jsp:include>
<script>
	pediatrics_summary_2_toggle("severity");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="pediatrics_summary_3" />
	<jsp:param name="block_header" value="Pediatrics Demographics: Vaccinated and Comorbidities" />

	<jsp:param name="kpis" value="pediatrics_summary/kpis.jsp?block=pediatrics_summary_3" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />

	<jsp:param name="datatable" value="pediatrics_summary/vaccinated_comorbidity_table.jsp" />
	<jsp:param name="datatable_div" value="pediatrics_vaccinated_comorbidity" />
	<jsp:param name="datatable_feed" value="pediatrics_summary/feeds/vaccinated_comorbidities.jsp" />
</jsp:include>
<script>
	pediatrics_summary_3_toggle("severity");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="pediatrics_summary_4" />
	<jsp:param name="block_header" value="Pediatrics Demographics: Unknown Vaccination and Comorbidities" />

	<jsp:param name="kpis" value="pediatrics_summary/kpis.jsp?block=pediatrics_summary_4" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />

	<jsp:param name="datatable" value="pediatrics_summary/unknown_vaccination_table.jsp" />
	<jsp:param name="datatable_div" value="pediatrics_unknown_vaccination" />
	<jsp:param name="datatable_feed" value="pediatrics_summary/feeds/unknown_vaccination.jsp" />
</jsp:include>
<script>
	pediatrics_summary_4_toggle("severity");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="pediatrics_summary_5" />
	<jsp:param name="block_header" value="Pediatrics Demographics: Ungrouped Comorbidities" />

	<jsp:param name="kpis" value="pediatrics_summary/kpis.jsp?block=pediatrics_summary_5" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />

	<jsp:param name="datatable" value="pediatrics_summary/ungrouped_table.jsp" />
	<jsp:param name="datatable_div" value="pediatrics_ungrouped" />
	<jsp:param name="datatable_feed" value="pediatrics_summary/feeds/ungrouped.jsp" />
</jsp:include>
<script>
	pediatrics_summary_5_toggle("severity");
</script>
