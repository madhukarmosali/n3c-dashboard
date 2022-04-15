<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- binned_datediff_positive_and_symptoms (2022-03-31 05:04) -->
<!-- icd10_individual_symptom_summary_counts (2022-03-31 05:02) -->
<!-- icd10_individual_symptom_summary_counts_by_symptom (2022-03-31 05:02) -->
<!-- icd10_symptoms_summary_counts (2022-03-31 05:01) -->
<!-- long_covid_concept_set_agg_censored (2022-03-31 04:54) -->
<!-- long_covid_icd_agg_censored (2022-03-31 04:54) -->
<!-- symptom_before_or_after_covid (2022-03-31 05:04) -->

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_1" />
	<jsp:param name="block_header" value="Long COVID: U09.9 ICD-10 Code" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_1" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />

	<jsp:param name="datatable" value="../modules/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date" />
</jsp:include>
<script>
	long_covid_1_toggle("severity");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_2" />
	<jsp:param name="block_header" value="Long COVID: Clinic Visit" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_2" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
</jsp:include>
<script>
	long_covid_2_toggle("severity");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_3" />
	<jsp:param name="block_header" value="Long COVID Cumulative Symptoms Summary (Dyspnea, Fatigue, Cognition, POTS, Mental Health)" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_3" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />
</jsp:include>
<script>
	long_covid_3_toggle("age");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_4" />
	<jsp:param name="block_header" value="Long COVID: Individual ICD-10 Symptom Grouped Counts" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_4" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />
</jsp:include>
<script>
	long_covid_4_toggle("age");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_5" />
	<jsp:param name="block_header" value="Long COVID: Ungrouped ICD-10 Symptom Counts" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_5" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />
</jsp:include>
<script>
	long_covid_5_toggle("age");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_6" />
	<jsp:param name="block_header" value="Long COVID: ICD-10 Symptom Counts Before/After COVID+" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_6" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=simple" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_7" />
	<jsp:param name="block_header" value="Long COVID: Cognitive Impairment" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_7" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />
</jsp:include>
<script>
	long_covid_7_toggle("age");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_8" />
	<jsp:param name="block_header" value="Long COVID: Fatigue" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_8" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />
</jsp:include>
<script>
	long_covid_8_toggle("age");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_9" />
	<jsp:param name="block_header" value="Long COVID: Mental Health Condition" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_9" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />
</jsp:include>
<script>
	long_covid_9_toggle("age");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_10" />
	<jsp:param name="block_header" value="Long COVID: Postural Orthostatic Tachycardia Symdrome (POTS)" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_10" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />
</jsp:include>
<script>
	long_covid_10_toggle("age");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_11" />
	<jsp:param name="block_header" value="Long COVID: Shortness of Breath" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_11" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />
</jsp:include>
<script>
	long_covid_11_toggle("age");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="long_covid_12" />
	<jsp:param name="block_header" value="Long COVID: Patients That Have Not Tested Positive For COVID" />

	<jsp:param name="kpis" value="long_covid/kpis.jsp?block=long_covid_12" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />
</jsp:include>
<script>
	long_covid_12_toggle("age");
</script>
