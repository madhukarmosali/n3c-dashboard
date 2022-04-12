<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- covid_severity_grouped_demo_adults_censored -->
<jsp:include page="block.jsp">
	<jsp:param name="block" value="adult_summary_1" />
	<jsp:param name="block_header" value="Demographics: COVID+" />

	<jsp:param name="kpis" value="adult_summary_kpis.jsp" />

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
</jsp:include>
<script>
	adult_summary_1_toggle("severity");
</script>
<jsp:include page="block.jsp">
	<jsp:param name="block" value="adult_summary_2" />
	<jsp:param name="block_header" value="Demographics: Vaccinated" />

	<jsp:param name="kpis" value="adult_summary_kpis.jsp" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
</jsp:include>
<script>
	adult_summary_2_toggle("severity");
</script>
<jsp:include page="block.jsp">
	<jsp:param name="block" value="adult_summary_3" />
	<jsp:param name="block_header" value="Demographics: Vaccinated and Comorbidities" />

	<jsp:param name="kpis" value="adult_summary_kpis.jsp" />

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
</jsp:include>
<script>
	adult_summary_3_toggle("severity");
</script>
<jsp:include page="block.jsp">
	<jsp:param name="block" value="adult_summary_4" />
	<jsp:param name="block_header" value="Demographics: Unknown Vaccination and Comorbidities" />

	<jsp:param name="kpis" value="adult_summary_kpis.jsp" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
</jsp:include>
<script>
	adult_summary_4_toggle("severity");
</script>
<jsp:include page="block.jsp">
	<jsp:param name="block" value="adult_summary_5" />
	<jsp:param name="block_header" value="Demographics: Ungrouped Comorbidities" />

	<jsp:param name="kpis" value="adult_summary_kpis.jsp" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
</jsp:include>
<script>
	adult_summary_5_toggle("severity");
</script>
