<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="test_1" />
	<jsp:param name="block_header" value="Test" />

	<jsp:param name="kpis" value="template/kpis.jsp" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="race_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="ethnicity_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp" />
	<jsp:param name="age_panel" value="test_panel.jsp" />
	<jsp:param name="race_panel" value="test_panel.jsp" />
	<jsp:param name="gender_panel" value="test_panel.jsp" />
	<jsp:param name="ethnicity_panel" value="test_panel.jsp" />

	<jsp:param name="datatable" value="../modules/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date" />
</jsp:include>
