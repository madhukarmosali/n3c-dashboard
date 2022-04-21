<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<c:set var="feedPath2">
	<util:applicationRoot />/new_ph/diabetes/feeds/diabetes_t2_detail.jsp</c:set>
		<div id="diabetes_type2_detail_2">
			<jsp:include page="../../graph_support/stacked_bar_horizontal_2.jsp">
				<jsp:param name="data_page" value="${feedPath2}" />
				<jsp:param name="namespace" value="diabetes_type2_aggregate" />
				<jsp:param name="dom_element" value="#diabetes_type2_detail_2" />
				<jsp:param name="primary_group" value="observation" />
				<jsp:param name="secondary_group" value="gender_concept_name" />
				<jsp:param name="stack_group" value="age_bracket" />
				<jsp:param name="count" value="count" />
				<jsp:param name="xaxis_label" value="Patient Count" />
				<jsp:param name="legend_label" value="Sex & Age" />
			</jsp:include>
		</div>
