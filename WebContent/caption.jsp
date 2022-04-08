<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<c:choose>
	<c:when test="${not empty param.schema}">
		<c:set var="schema" value="${param.schema}"/>
		<c:set var="column" value="caption"/>
	</c:when>
	<c:otherwise>
		<c:set var="schema" value="n3c_public_site.block"/>
		<c:set var="column" value="block"/>
	</c:otherwise>
</c:choose>
<sql:query var="blocks" dataSource="jdbc/N3CPublic">
	select ${column} as block from ${schema} where tag = ?
	<sql:param>${param.tag}</sql:param>
 </sql:query>
<c:forEach items="${blocks.rows}" var="row" varStatus="rowCounter">
	${row.block }
</c:forEach>