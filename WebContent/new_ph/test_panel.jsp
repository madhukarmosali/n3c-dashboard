<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<p>panel: ${param.panel}</p>
<p>block: ${param.block}</p>
<p>datatable_div: ${param.datatable_div}</p>

<script>
	console.log("loaded ${param.info}");
</script>
<util:Log message="x" page="y" level="INFO"/>
