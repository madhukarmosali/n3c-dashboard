<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="reinfection1">
	<div id="reinfection1_graph"></div>
	<c:set var="feedPath"><util:applicationRoot />/feeds/reinfections_by_date.jsp</c:set>
	<jsp:include page="../../modules/time_line_2_column.jsp">
		<jsp:param name="data_page" value="${feedPath}" />
		<jsp:param name="dom_element" value="#reinfection1" />
		<jsp:param name="namespace" value="reinfection1" />
		<jsp:param name="date_column" value="c_date" />
		<jsp:param name="column1" value="first_diagnosis" />
		<jsp:param name="column1_label" value="First Diagnosis Countt" />
		<jsp:param name="column1_tip" value="First Diagnosis" />
		<jsp:param name="column1_tip_offset" value="110" />
		<jsp:param name="column1_color" value="#163F59" />
		<jsp:param name="column1_opacity" value="0.25" />
		<jsp:param name="column2" value="reinfected" />
		<jsp:param name="column2_label" value="Reinfection Count" />
		<jsp:param name="column2_tip" value="Reinfection" />
		<jsp:param name="column2_tip_offset" value="85" />
		<jsp:param name="column2_color" value="#454F82" />
		<jsp:param name="constraintPropagator" value="constraint" />
	</jsp:include>
	<p style="text-align: center;">
		<sql:query var="cases" dataSource="jdbc/N3CPublic">
		select
			to_char(c_date::date, 'FMMM/FMDD/YY') as date,
			to_char(first_diagnosis_count::int,'999,999') as first_diagnosis,
			to_char(original_infection_date_for_reinfected_count::int, '999,999') as reinfection
		from n3c_questions.covid_lds_with_reinfection_date_counts_censored where c_date ='2020-03-28'
		</sql:query>
		<c:forEach items="${cases.rows}" var="row" varStatus="rowCounter">
			The numbers indicate counts of first diagnosis for that date and counts of reinfection for that specific cohort.
			As an example for ${row.date}, count that had a positive test was ${row.first_diagnosis} and of this cohort of ${row.first_diagnosis}, ${row.reinfection} were reinfected.
		</c:forEach>
		Hover over the graph to show the counts for that day. Click and drag to focus on a specific time range. Double click to revert to the default time range.
	</p>
</div>