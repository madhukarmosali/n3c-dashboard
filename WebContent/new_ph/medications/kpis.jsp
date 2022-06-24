<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div class="col-12 col-md-4 kpi_ind">
	<jsp:include page="../kpis/covid_positive.jsp" >
		<jsp:param name="block" value="${param.block}"/>
	</jsp:include>
</div>
<div class="col-12 col-md-4 kpi_ind">
	<jsp:include page="../kpis/medication_count.jsp" >
		<jsp:param name="block" value="${param.block}"/>
	</jsp:include>
	<small class="limit">(see limitations below)</small>
</div>
<div class="col-12 col-md-4 kpi_ind">
	<jsp:include page="../kpis/medication_class_count.jsp" >
		<jsp:param name="block" value="${param.block}"/>
	</jsp:include>
	<small class="limit">(see limitations below)</small>
</div>

