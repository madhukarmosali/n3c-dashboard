<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

{
"nodes": [

<sql:query var="nodes" dataSource="jdbc/N3CPublic">
	select
		'0-'||age_seq as mapping,
		age_bin as label,
		age_abbrev as short_label,
		0 as x,
		(age_seq * 1.0)/(select max(age_seq) from n3c_dashboard.age_map5) as index,
		(select coalesce(sum(case when count='<20' then 0 else count::int end),0)
		 from n3c_questions.all_ages_covid_pos_demo_censored
		 where all_ages_covid_pos_demo_censored.age_bin = age_map5.age_bin) as weight
	from n3c_dashboard.age_map5
	
	union
	
	select
		'1-'||severity_seq as mapping,
		severity as label,
		severity_abbrev as short_label,
		1 as x,
		(severity_seq * 1.0)/(select max(severity_seq) from n3c_dashboard.severity_map) as index,
		(select coalesce(sum(case when count='<20' then 0 else count::int end),0)
		 from n3c_questions.all_ages_covid_pos_demo_censored
		 where all_ages_covid_pos_demo_censored.severity_type = severity_map.severity) as weight
	from n3c_dashboard.severity_map
	
	union
	
	select distinct
		'2-'||gender_seq as mapping,
		gender_abbrev as label,
		gender_abbrev as short_label,
		2 as x,
		(gender_seq * 1.0)/(select max(gender_seq) from n3c_dashboard.gender_map2) as index,
		(select coalesce(sum(case when count='<20' then 0 else count::int end),0)
		 from n3c_questions.all_ages_covid_pos_demo_censored
		 where all_ages_covid_pos_demo_censored.gender_concept_name = gender_map2.gender) as weight
	from n3c_dashboard.gender_map2
	
	union
	
	select
		'3-'||race_seq as mapping,
		race as label,
		race_abbrev as short_label,
		3 as x,
		(race_seq * 1.0)/(select max(race_seq) from n3c_dashboard.race_map) as index,
		(select coalesce(sum(case when count='<20' then 0 else count::int end),0)
		 from n3c_questions.all_ages_covid_pos_demo_censored
		 where all_ages_covid_pos_demo_censored.race_concept_name = race_map.race) as weight
	from n3c_dashboard.race_map
	
	union
	
	select
		'4-'||ethnicity_seq as mapping,
		ethnicity as label,
		ethnicity_abbrev as short_label,
		4 as x,
		(ethnicity_seq * 1.0)/(select max(ethnicity_seq) from n3c_dashboard.ethnicity_map) as index,
		(select coalesce(sum(case when count='<20' then 0 else count::int end),0)
		 from n3c_questions.all_ages_covid_pos_demo_censored
		 where all_ages_covid_pos_demo_censored.ethnicity_concept_name = ethnicity_map.ethnicity) as weight
	from n3c_dashboard.ethnicity_map
	
	order by 4,5
</sql:query>
<c:forEach items="${nodes.rows}" var="row" varStatus="rowCounter">
	{ "mapping":"${row.mapping}", "label":"${row.label}", "short_label":"${row.short_label}", "x":${row.x}, "y":${row.index}, "weight":${row.weight} }<c:if test="${!rowCounter.last}">,</c:if>
</c:forEach>

],

"edges": [

<sql:query var="edges" dataSource="jdbc/N3CPublic">
	select '0-'||age_seq as source, '1-'||severity_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.age_map5, n3c_dashboard.severity_map
	where all_ages_covid_pos_demo_censored.age_bin = age_map5.age_bin
	  and all_ages_covid_pos_demo_censored.severity_type = severity_map.severity
	group by 1,2
	
	union
	
	select '0-'||age_seq as source, '2-'||gender_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.age_map5, n3c_dashboard.gender_map2
	where all_ages_covid_pos_demo_censored.age_bin = age_map5.age_bin
	  and all_ages_covid_pos_demo_censored.gender_concept_name = gender_map2.gender
	group by 1,2
	
	union
	
	select '0-'||age_seq as source, '3-'||race_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.age_map5, n3c_dashboard.race_map
	where all_ages_covid_pos_demo_censored.age_bin = age_map5.age_bin
	  and all_ages_covid_pos_demo_censored.race_concept_name = race_map.race
	group by 1,2
	
	union
	
	select '0-'||age_seq as source, '4-'||ethnicity_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.age_map5, n3c_dashboard.ethnicity_map
	where all_ages_covid_pos_demo_censored.age_bin = age_map5.age_bin
	  and all_ages_covid_pos_demo_censored.ethnicity_concept_name = ethnicity_map.ethnicity
	group by 1,2
	
	union
	
	select '1-'||severity_seq as source, '2-'||gender_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.severity_map, n3c_dashboard.gender_map2
	where all_ages_covid_pos_demo_censored.severity_type = severity_map.severity
	  and all_ages_covid_pos_demo_censored.gender_concept_name = gender_map2.gender
	group by 1,2
	
	union
	
	select '1-'||severity_seq as source, '3-'||race_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.severity_map, n3c_dashboard.race_map
	where all_ages_covid_pos_demo_censored.severity_type = severity_map.severity
	  and all_ages_covid_pos_demo_censored.race_concept_name = race_map.race
	group by 1,2
	
	union
	
	select '1-'||severity_seq as source, '4-'||ethnicity_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.severity_map, n3c_dashboard.ethnicity_map
	where all_ages_covid_pos_demo_censored.severity_type = severity_map.severity
	  and all_ages_covid_pos_demo_censored.ethnicity_concept_name = ethnicity_map.ethnicity
	group by 1,2
	
	union
	
	select '2-'||gender_seq as source, '3-'||race_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.gender_map2, n3c_dashboard.race_map
	where all_ages_covid_pos_demo_censored.gender_concept_name = gender_map2.gender
	  and all_ages_covid_pos_demo_censored.race_concept_name = race_map.race
	group by 1,2
	
	union
	
	select '2-'||gender_seq as source, '4-'||ethnicity_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.gender_map2, n3c_dashboard.ethnicity_map
	where all_ages_covid_pos_demo_censored.gender_concept_name = gender_map2.gender
	  and all_ages_covid_pos_demo_censored.ethnicity_concept_name = ethnicity_map.ethnicity
	group by 1,2
	
	union
	
	select '3-'||race_seq as source, '4-'||ethnicity_seq as target, sum(case when count='<20' then 0 else count::int end) as weight
	from n3c_questions.all_ages_covid_pos_demo_censored, n3c_dashboard.race_map, n3c_dashboard.ethnicity_map
	where all_ages_covid_pos_demo_censored.race_concept_name = race_map.race
	  and all_ages_covid_pos_demo_censored.ethnicity_concept_name = ethnicity_map.ethnicity
	group by 1,2
	
	order by 3 desc;
</sql:query>
<c:forEach items="${edges.rows}" var="row" varStatus="rowCounter">
	{ "source":"${row.source}", "target":"${row.target}", "weight":${row.weight} }<c:if test="${!rowCounter.last}">,</c:if>
</c:forEach>

]
}
