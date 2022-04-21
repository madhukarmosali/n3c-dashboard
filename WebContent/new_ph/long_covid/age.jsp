<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div id="${param.block}_age_viz" class="col-lg-7 dash_viz"></div>
<script>
	${param.block}_refreshHistograms();
	console.log("age graph", "${param.block}_age_viz", ${param.block}_ageArray)
</script>
