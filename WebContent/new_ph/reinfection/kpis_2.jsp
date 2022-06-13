<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<jsp:include page="../kpis/block2_kpis/covid_positive.jsp" >
	<jsp:param name="block" value="${param.block}"/>
</jsp:include>
<jsp:include page="../kpis/block2_kpis/covid_first_diagnosis.jsp" >
	<jsp:param name="block" value="${param.block}"/>
</jsp:include>
<jsp:include page="../kpis/block2_kpis/covid_subsequent_test.jsp" >
	<jsp:param name="block" value="${param.block}"/>
</jsp:include>

