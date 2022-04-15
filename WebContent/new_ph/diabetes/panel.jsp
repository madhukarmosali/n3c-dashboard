<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_1" />
	<jsp:param name="block_header" value="Diabetes Mellitus Type 2" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp?block=diabetes_1" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=diabetes_2" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_2" />
	<jsp:param name="block_header" value="Diabetes Mellitus Type 1: Detailed" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp?block=diabetes_2" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=diabetes_2_detailed" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_3" />
	<jsp:param name="block_header" value="Diabetes Mellitus Type 1" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp?block=diabetes_3" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=diabetes_1" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_4" />
	<jsp:param name="block_header" value="Diabetes Mellitus Type 1: Detailed" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp?block=diabetes_4" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=diabetes_1_detailed" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_5" />
	<jsp:param name="block_header" value="Type-1 Diabetes Under the Age of 18" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp?block=diabetes_5" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=type1_under_18" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_6" />
	<jsp:param name="block_header" value="Type-2 Diabetes Under the Age of 18" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp?block=diabetes_6" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=type2_under_18" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_7" />
	<jsp:param name="block_header" value="Type-1 Diabetes Over the Age of 18" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp?block=diabetes_7" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=type1_over_18" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="diabetes_8" />
	<jsp:param name="block_header" value="Type-2 Diabetes Over the Age of 18" />

	<jsp:param name="kpis" value="diabetes/kpis.jsp?block=diabetes_8" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=type2_over_18" />
</jsp:include>
