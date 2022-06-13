<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<div class="secondary-description">
	<p>
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