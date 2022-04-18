<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- covid_positive_mab_demo_censored (2022-03-31 05:01) -->

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="adult_summary_1" />
	<jsp:param name="block_header" value="Demographics: COVID+" />

	<jsp:param name="kpis" value="adult_summary/kpis.jsp?block=adult_summary_1" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="severity_panel" value="adult_summary/severity.jsp?block=adult_summary_1" />
	<jsp:param name="age_panel" value="adult_summary/age.jsp?block=adult_summary_1" />
	<jsp:param name="race_panel" value="adult_summary/race.jsp?block=adult_summary_1" />
	<jsp:param name="gender_panel" value="adult_summary/gender.jsp?block=adult_summary_1" />
	<jsp:param name="ethnicity_panel" value="adult_summary/ethnicity.jsp?block=adult_summary_1" />

	<jsp:param name="datatable" value="adult_summary/aggregated_table.jsp" />
	<jsp:param name="datatable_div" value="adult_aggregated" />
	<jsp:param name="datatable_feed" value="adult_summary/feeds/severity.jsp" />
</jsp:include>
<script>
	adult_summary_1_toggle("severity");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="adult_summary_2" />
	<jsp:param name="block_header" value="Demographics: Vaccinated" />

	<jsp:param name="kpis" value="adult_summary/kpis.jsp?block=adult_summary_2" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />

	<jsp:param name="datatable" value="adult_summary/vaccinated_table.jsp" />
	<jsp:param name="datatable_div" value="adult_vaccinated" />
	<jsp:param name="datatable_feed" value="adult_summary/feeds/vaccinated.jsp" />
</jsp:include>
<script>
	adult_summary_2_toggle("vaccinated");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="adult_summary_3" />
	<jsp:param name="block_header" value="Demographics: Vaccinated and Comorbidities" />

	<jsp:param name="kpis" value="adult_summary/kpis.jsp?block=adult_summary_3" />

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

	<jsp:param name="datatable" value="adult_summary/vaccinated_comorbidity_table.jsp" />
	<jsp:param name="datatable_div" value="adult_vaccinated_comorbidity" />
	<jsp:param name="datatable_feed" value="adult_summary/feeds/vaccinated_comorbidities.jsp" />
</jsp:include>
<script>
	adult_summary_3_toggle("vaccinated_comorbidities");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="adult_summary_4" />
	<jsp:param name="block_header" value="Demographics: Unknown Vaccination and Comorbidities" />

	<jsp:param name="kpis" value="adult_summary/kpis.jsp?block=adult_summary_4" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />

	<jsp:param name="datatable" value="adult_summary/unknown_vaccination_table.jsp" />
	<jsp:param name="datatable_div" value="adult_unknown_vaccination" />
	<jsp:param name="datatable_feed" value="adult_summary/feeds/unknown_vaccination.jsp" />
</jsp:include>
<script>
	adult_summary_4_toggle("unknown_vaccinated");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="adult_summary_5" />
	<jsp:param name="block_header" value="Demographics: Ungrouped Comorbidities" />

	<jsp:param name="kpis" value="adult_summary/kpis.jsp?block=adult_summary_5" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />

	<jsp:param name="datatable" value="adult_summary/ungrouped_table.jsp" />
	<jsp:param name="datatable_div" value="adult_ungrouped" />
	<jsp:param name="datatable_feed" value="adult_summary/feeds/ungrouped.jsp" />
</jsp:include>
<script>
	adult_summary_5_toggle("ungrouped");
</script>
