<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- adult_covid_event_type (2022-03-31 05:03) -->
<!-- diabetes_t1_agg (2022-03-31 04:54) -->
<!-- diabetes_t1_full_censored (2022-03-31 05:01) -->
<!-- diabetes_t2_agg (2022-03-31 04:54) -->
<!-- diabetes_t2_full_censored (2022-03-31 05:01) -->

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_1" />
	<jsp:param name="block_header" value="Diabetes Mellitus Type 2" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="diabetes/type_2.jsp" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_2" />
	<jsp:param name="block_header" value="Diabetes Mellitus Type 2: Detailed" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="diabetes/type_2_detailed.jsp" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_3" />
	<jsp:param name="block_header" value="Diabetes Mellitus Type 1" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="diabetes/type_1.jsp" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_4" />
	<jsp:param name="block_header" value="Diabetes Mellitus Type 1: Detailed" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="diabetes/type_1_detailed.jsp" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_5" />
	<jsp:param name="block_header" value="Type-1 Diabetes Under the Age of 18" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_6" />
	<jsp:param name="block_header" value="Type-2 Diabetes Under the Age of 18" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_7" />
	<jsp:param name="block_header" value="Type-1 Diabetes Over the Age of 18" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_8" />
	<jsp:param name="block_header" value="Type-2 Diabetes Over the Age of 18" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp" />
</jsp:include>
