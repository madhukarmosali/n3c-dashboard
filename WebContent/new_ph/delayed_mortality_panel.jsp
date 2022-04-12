<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="block.jsp">
	<jsp:param name="block" value="delayed_mortality_1" />
	<jsp:param name="block_header" value="Mortality: Counts from all Sources" />

	<jsp:param name="kpis" value="delayed_mortality_kpis.jsp" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="race_panel" value="test_panel.jsp?info=race" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp?info=ethnicity" />

	<jsp:param name="datatable" value="../modules/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date" />
</jsp:include>
<script>
	delayed_mortality_1_toggle("age");
</script>
<jsp:include page="block.jsp">
	<jsp:param name="block" value="delayed_mortality_2" />
	<jsp:param name="block_header" value="Mortality: Delayed Mortality" />

	<jsp:param name="kpis" value="delayed_mortality_kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=simple" />
</jsp:include>
