<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- binned_diff_bw_death_and_hospital_visit (2022-03-31 05:04) -->
<!-- icd10_mortality_demo_grouped (2022-03-31 05:02) -->

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="delayed_mortality_1" />
	<jsp:param name="block_header" value="Mortality: Counts from all Sources" />

	<jsp:param name="kpis" value="delayed_mortality/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp" />
	<jsp:param name="race_panel" value="test_panel.jsp" />
	<jsp:param name="gender_panel" value="test_panel.jsp" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp" />

	<jsp:param name="datatable" value="delayed_mortality/demographics_table.jsp" />
	<jsp:param name="datatable_div" value="delayed_mortality_demographics" />
	<jsp:param name="datatable_feed" value="delayed_mortality/feeds/demographics.jsp" />
</jsp:include>
<script>
	delayed_mortality_1_toggle("age");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="delayed_mortality_2" />
	<jsp:param name="block_header" value="Mortality: Delayed Mortality" />

	<jsp:param name="kpis" value="delayed_mortality/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp" />

	<jsp:param name="datatable" value="delayed_mortality/delayed_table.jsp" />
	<jsp:param name="datatable_div" value="delayed_mortality_delayed" />
	<jsp:param name="datatable_feed" value="delayed_mortality/feeds/delayed.jsp" />
</jsp:include>
