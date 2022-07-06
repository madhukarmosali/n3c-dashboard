<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


var gender_range = ["#4833B2", "#ffa600", "#8406D1", "#a6a6a6"];
var gender_range3 = ["#4833B2", "#ffa600", "#8406D1", "#a6a6a6", "#8B8B8B"];
var gender_range_no_other = ["#4833B2", "#ffa600", "#a6a6a6"];

var severity_range2 = ["#F5B1A3", "#EE765E", "#CE3617", "#A02A12", "#5C180A", "#8B8B8B", "#8B8B8B"];
var severity_range3 = ["#FFC1DC", "#F584B5", "#CE4682", "#9D285B", "#6C0934", "#8B8B8B"];
var severity_range = ["#EBC4E0", "#C24DA1", "#AD1181", "#820D61", "#570941", "#a6a6a6"];


var race_range2 =  ["#3B59C7", "#AD1181", "#7602EB", "#A8F0D8", "#86CBF3", "#a6a6a6"];
var race_range = ["#09405A", "#AD1181", "#8406D1", "#ffa600", "#ff7155", "#a6a6a6"];

var ethnicity_range = ["#332380", "#B6AAF3", "#a6a6a6", "#8B8B8B"];

var age_range = ["#EADEF7", "#A772DF", "#6512BD", "#a6a6a6"];
var age_range_all = ["#EADEF7", "#C9A8EB", "#A772DF", "#8642CE", "#762AC6", "#6512BD", "#4C1EA5", "#33298D", "#a6a6a6"];
var age_range_all2 = ["#EADEF7", "#C9A8EB", "#A772DF", "#8642CE", "#6512BD", "#33298D", "#a6a6a6", "#8B8B8B"];
var age_range_adult1 = ["#762AC6", "#4C1EA5", "#a6a6a6",  "#8B8B8B", "#762AC6", "#4C1EA5", "#a6a6a6",  "#8B8B8B"];
var age_range_adult2 = ["#762AC6", "#6512BD", "#4C1EA5", "#33298D"];
var age_range_peds1 = ["#EADEF7", "#C9A8EB", "#A772DF", "#8642CE", "#a6a6a6", "#a6a6a6","#a6a6a6","#a6a6a6"];
var age_range_peds2 = ["#EADEF7", "#C9A8EB", "#A772DF", "#8642CE"];

var status_range = ["#455098", "#CD4682", "#a6a6a6"];

var result_range = ["#455098", "#CD4682", "#a6a6a6"];

var categorical = ["#09405A", "#AD1181", "#8406D1", "#ffa600", "#ff7155", "#4833B2", "#a6a6a6"];
var categorical2 = ["#09405A", "#AD1181", "#8406D1", "#ffa600", "#ff7155", "#4833B2", "#a6a6a6", "#09405A", "#AD1181", "#8406D1", "#ffa600", "#ff7155", "#4833B2", "#a6a6a6", "#09405A", "#AD1181", "#8406D1", "#ffa600", "#ff7155", "#4833B2", "#a6a6a6"];

var sequential_1_2 = ["#D6BFD9", "#4D2F50"];
var sequential_1_3 = ["#D6BFD9", "#9a5fa0", "#4D2F50"];
var sequential_1_4 = ["#D6BFD9", "#ae7fb3", "#7a4c80", "#4D2F50"];
var sequential_1_5 = ["#D6BFD9", "#b88fbd", "#995fa0", "#6c4270", "#4D2F50"];
var sequential_1_6 = ["#D6BFD9", "#be98c2", "#a672ab", "#87548d", "#623d66", "#4D2F50"];
var sequential_1_7 = ["#D6BFD9", "#c29fc6", "#ae7fb3", "#9a5fa0", "#7c4c80", "#5c3960", "#4D2F50"];


var sequential_2_2 = ["#F5B1A3", "#5C180A"];
var sequential_2_3 = ["#F5B1A3", "#e63c19", "#5C180A"];
var sequential_2_4 = ["#F5B1A3", "#eb6347", "#8a240f", "#5C180A"];
var sequential_2_5 = ["#F5B1A3", "#ed765e", "#ce3617", "#a02a12", "#5C180A"];
var sequential_2_6 = ["#F5B1A3", "#eb6347", "#e63c19", "#b83014", "#8a240f", "#5C180A"];
var sequential_2_7 = ["#F5B1A3", "#ee765e", "#e94f2f", "#d03616", "#a12a11", "#8a240f", "#5C180A"];

var divergent = ["#5C180A", "#A02A12", "#CE3617", "#ED765E", "#F5B1A3", "#EFEFEF", "#D6BFD9", "#A36FAA", "#8A5590", "#6C4270", "#4D2F50"];

<sql:query var="genders" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct gender_abbrev as secondary, gender_seq as secondary_seq, gender_abbrev as secondary_name
		  from n3c_dashboard.gender_map
		  ) as done;
</sql:query>
<c:forEach items="${genders.rows}" var="row" varStatus="rowCounter">
	var gender_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="genders3" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct gender_abbrev as secondary, gender_seq as secondary_seq, gender_abbrev as secondary_name
		  from n3c_dashboard.gender_map3
		  ) as done;
</sql:query>
<c:forEach items="${genders3.rows}" var="row" varStatus="rowCounter">
	var gender_legend3 = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="severities" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct severity_abbrev as secondary, severity_seq as secondary_seq, severity_abbrev as secondary_name
		  from n3c_dashboard.severity_map
		  ) as done;
</sql:query>
<c:forEach items="${severities.rows}" var="row" varStatus="rowCounter">
	var severity_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="races" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct race_abbrev as secondary, race_seq as secondary_seq, race as secondary_name
		  from n3c_dashboard.race_map
		  ) as done;
</sql:query>
<c:forEach items="${races.rows}" var="row" varStatus="rowCounter">
	var race_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ethnicities" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct ethnicity_abbrev as secondary, ethnicity_seq as secondary_seq, ethnicity as secondary_name
		  from n3c_dashboard.ethnicity_map
		  ) as done;
</sql:query>
<c:forEach items="${ethnicities.rows}" var="row" varStatus="rowCounter">
	var ethnicity_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="befores" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct condition_after_covid_positive as secondary, condition_after_covid_positive_seq as secondary_seq, condition_after_covid_positive as secondary_name
		  from n3c_dashboard.before_after_map
		  ) as done;
</sql:query>
<c:forEach items="${befores.rows}" var="row" varStatus="rowCounter">
	var before_after_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq, age_bin as secondary_name
		  from n3c_dashboard.age_map
		  ) as done;
</sql:query>
<c:forEach items="${ages.rows}" var="row" varStatus="rowCounter">
	var age_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages2" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq, age_bin as secondary_name
		  from n3c_dashboard.age_map2
		  ) as done;
</sql:query>
<c:forEach items="${ages2.rows}" var="row" varStatus="rowCounter">
	var age_legend_2 = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages3" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq, age_bin as secondary_name
		  from n3c_dashboard.age_map3
		  ) as done;
</sql:query>
<c:forEach items="${ages3.rows}" var="row" varStatus="rowCounter">
	var age_legend_3 = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages3" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq, age_bin as secondary_name
		  from n3c_dashboard.age_map3
		  UNION
		  select 'Null' as secondary, 7 as secondary_seq, 'null' as seconary_name
		  ) as done;
</sql:query>
<c:forEach items="${ages3.rows}" var="row" varStatus="rowCounter">
	var age_legend_peds = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages4" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq, age_bin as secondary_name
		  from n3c_dashboard.age_map4
		  ) as done;
</sql:query>
<c:forEach items="${ages4.rows}" var="row" varStatus="rowCounter">
	var age_legend_4 = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages5" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age as secondary, age_seq as secondary_seq, age as secondary_name
		  from n3c_dashboard.age_map8
		  ) as done;
</sql:query>
<c:forEach items="${ages5.rows}" var="row" varStatus="rowCounter">
	var age_legend_5 = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages6" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq, age_bin as secondary_name
		  from n3c_dashboard.age_map6 where age_bin in ('18-64', '65+', 'null', 'Unknown')
		  ) as done;
</sql:query>
<c:forEach items="${ages6.rows}" var="row" varStatus="rowCounter">
	var age_legend_6 = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="ages7" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done order by secondary_seq))
	from (select distinct age_bin as secondary, age_seq as secondary_seq, age_bin as secondary_name
		  from n3c_dashboard.age_map6
		  ) as done;
</sql:query>
<c:forEach items="${ages7.rows}" var="row" varStatus="rowCounter">
	var age_legend_7 = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="statuses" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select distinct smoking_status as secondary
		  from n3c_questions.covid_smoking_demographics_censored order by smoking_status
		  ) as done;
</sql:query>
<c:forEach items="${statuses.rows}" var="row" varStatus="rowCounter">
	var status_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="statuses" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select distinct test_result as secondary, test_result as secondary_name
		  from n3c_questions.table1_union order by test_result
		  ) as done;
</sql:query>
<c:forEach items="${statuses.rows}" var="row" varStatus="rowCounter">
	var result_legend = ${row.jsonb_pretty};
</c:forEach>

<sql:query var="statuses" dataSource="jdbc/N3CPublic">
	select jsonb_pretty(jsonb_agg(done))
	from (select distinct result_abbrev as secondary, result_abbrev as secondary_name, result_seq
		  from n3c_dashboard.result_map order by result_seq
		  ) as done;
</sql:query>
<c:forEach items="${statuses.rows}" var="row" varStatus="rowCounter">
	var result_legend2 = ${row.jsonb_pretty};
</c:forEach>
