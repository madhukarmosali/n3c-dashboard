<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- count_by_month_censored (2022-03-31 04:59) -->

<!-- covid_severity_grouped_demo_adults_censored -->
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="hlh_1" />
	<jsp:param name="block_header" value="Overall Patient Group Distribution" />

	<jsp:param name="kpis" value="hlh/kpis.jsp?block=hlh_1" />

	<jsp:param name="age_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=simple" />

	<jsp:param name="datatable" value="../modules/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date" />
</jsp:include>
