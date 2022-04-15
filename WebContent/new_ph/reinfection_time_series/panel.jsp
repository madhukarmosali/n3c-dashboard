<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- positive_cases_by_day_cumsum_censored (2022-03-31 05:01) -->

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="reinfection_ts_1" />
	<jsp:param name="block_header" value="Reinfection Time Series" />

	<jsp:param name="kpis" value="reinfection_time_series/kpis.jsp?block=reinfection_ts_1" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=simple" />

	<jsp:param name="datatable" value="../modules/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date" />
</jsp:include>
