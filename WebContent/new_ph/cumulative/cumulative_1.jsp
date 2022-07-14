<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../block2.jsp">
	<jsp:param name="block" value="cumulative_1" />
	<jsp:param name="block_header" value="Enclave Cumulative Participat Information" />
	<jsp:param name="topic_description" value="secondary_1" />

	<jsp:param name="kpis" value="cumulative/kpis.jsp" />

	<jsp:param name="gender_filter" value="true" />
	<jsp:param name="race_filter" value="true" />

	<jsp:param name="simple_panel" value="cumulative/tables/cumulative_table.jsp" />
	<jsp:param name="datatable_div" value="cumulative_1_cumulative_table" />
	<jsp:param name="target_kpis" value="total,count_non_hispanic,count_hispanic,count_ethnicity_unknown" />
	
</jsp:include>