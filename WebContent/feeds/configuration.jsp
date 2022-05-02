<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

var categorical = ["#464F82", "#CD5B81", "#8C5692", "#F3A93C", "#EE765D", "#173E59", "#8B8B8B"];

var sequential_1 = ["#D6BFD9", "#4D2F50"];
var sequential_2 = ["#F5B1A3", "#5C180A"];

var divergent = ["#5C180A", "#A02A12", "#CE3617", "#ED765E", "#F5B1A3", "#EFEFEF", "#D6BFD9", "#A36FAA", "#8A5590", "#6C4270", "#4D2F50"];

<sql:query var="genders" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct gender_abbrev as secondary, gender_seq as secondary_seq
		  from n3c_dashboard.gender_map
		  ) as done;
</sql:query>
<c:forEach items="${genders.rows}" var="row" varStatus="rowCounter">
	var gender_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="severities" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct severity_abbrev as secondary, severity_seq as secondary_seq
		  from n3c_dashboard.severity_map
		  ) as done;
</sql:query>
<c:forEach items="${severities.rows}" var="row" varStatus="rowCounter">
	var severity_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="races" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct race_abbrev as secondary, race_seq as secondary_seq
		  from n3c_dashboard.race_map
		  ) as done;
</sql:query>
<c:forEach items="${races.rows}" var="row" varStatus="rowCounter">
	var race_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ethnicities" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct ethnicity_abbrev as secondary, ethnicity_seq as secondary_seq
		  from n3c_dashboard.ethnicity_map
		  ) as done;
</sql:query>
<c:forEach items="${ethnicities.rows}" var="row" varStatus="rowCounter">
	var ethnicity_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="befores" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct condition_after_covid_positive as secondary, condition_after_covid_positive_seq as secondary_seq
		  from n3c_dashboard.before_after_map
		  ) as done;
</sql:query>
<c:forEach items="${befores.rows}" var="row" varStatus="rowCounter">
	var before_after_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq
		  from n3c_dashboard.age_map
		  ) as done;
</sql:query>
<c:forEach items="${ages.rows}" var="row" varStatus="rowCounter">
	var age_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq
		  from n3c_dashboard.age_map2
		  ) as done;
</sql:query>
<c:forEach items="${ages.rows}" var="row" varStatus="rowCounter">
	var age_legend_2 = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq
		  from n3c_dashboard.age_map3
		  ) as done;
</sql:query>
<c:forEach items="${ages.rows}" var="row" varStatus="rowCounter">
	var age_legend_3 = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq
		  from n3c_dashboard.age_map4
		  ) as done;
</sql:query>
<c:forEach items="${ages.rows}" var="row" varStatus="rowCounter">
	var age_legend_4 = ${row.jsonb_pretty};
</c:forEach>
