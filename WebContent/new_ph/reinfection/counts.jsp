<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="reinfection2">
	<div id="reinfection2_graph"></div>
<c:set var="feedPath">
	<util:applicationRoot />/feeds/reinfections_by_date.jsp</c:set>
	<jsp:include page="../../graph_support/time_line_2_column.jsp">
		<jsp:param name="data_page" value="${feedPath}" />
		<jsp:param name="dom_element" value="#reinfection2" />
		<jsp:param name="namespace" value="reinfection2" />
		<jsp:param name="date_column" value="c_date" />
		<jsp:param name="column1" value="first_diagnosis" />
		<jsp:param name="column1_label" value="First Diagnosis Count" />
		<jsp:param name="column1_tip" value="First Diagnosis" />
		<jsp:param name="column1_tip_offset" value="110" />
		<jsp:param name="column1_color" value="#163F59" />
		<jsp:param name="column1_opacity" value="0.25" />
		<jsp:param name="column2" value="subsequent_test" />
		<jsp:param name="column2_label" value="Reinfection Count" />
		<jsp:param name="column2_tip" value="Reinfection" />
		<jsp:param name="column2_tip_offset" value="120" />
		<jsp:param name="column2_color" value="#454F82" />
	</jsp:include>
	<p style="text-align: center;">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
			select
				to_char(c_date::date, 'FMMM/FMDD/YY') as date,
				to_char(first_diagnosis_count::int,'999,999') as first_diagnosis,
				to_char(subsequent_test_count::int, '999,999') as subsequent
			from n3c_questions.covid_lds_with_reinfection_date_counts_censored where c_date ='2021-09-06'
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			The numbers indicate counts of first diagnosis and counts of reinfection for that date.
			As an example for ${row.date}, the counts indicates that ${row.first_diagnosis} had a first positive test, ${row.subsequent} indicates reinfection counts.
		</c:forEach>
		Hover over the graph to show the counts for that day. Click and drag
		to focus on a specific time range. Double click to revert to the
		default time range.
	</p>
</div>
