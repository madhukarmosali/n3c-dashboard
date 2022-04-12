<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

${param.info}

<script>
	console.log("loaded ${param.info}");
</script>
<util:Log message="x" page="y" level="INFO"/>
