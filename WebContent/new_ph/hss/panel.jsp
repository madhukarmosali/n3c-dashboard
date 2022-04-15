<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- covid_severity_grouped_demo_adults_censored -->
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="hss_1" />
	<jsp:param name="block_header" value="Enclave Cumulative Participant Information" />

	<jsp:param name="kpis" value="hss/kpis.jsp?block=hss_1" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=simple" />
</jsp:include>
