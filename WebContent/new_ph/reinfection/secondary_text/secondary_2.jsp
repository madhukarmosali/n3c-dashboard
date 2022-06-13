<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div class="secondary-description">
	<p>
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