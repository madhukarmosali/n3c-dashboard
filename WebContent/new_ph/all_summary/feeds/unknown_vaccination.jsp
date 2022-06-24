<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	SELECT jsonb_pretty(jsonb_agg(done.*)) AS jsonb_pretty
   FROM ( SELECT foo.severity,
            gender_map3.gender_abbrev AS gender,
            age_map6.age_abbrev AS age,
            foo.race,
            foo.comorbidities,
            foo.patient_display,
            foo.patient_count,
            age_map6.age_abbrev,
            age_map6.age_seq,
            race_map.race_abbrev,
            race_map.race_seq,
            gender_map3.gender_abbrev,
            gender_map3.gender_seq,
            severity_map.severity_abbrev,
            severity_map.severity_seq
           FROM ( SELECT covid_positive_comorbidities_demo_censored_wo_vax.severity_type AS severity,
                    COALESCE(covid_positive_comorbidities_demo_censored_wo_vax.gender_concept_name, 'null'::text) AS gender,
                    COALESCE(covid_positive_comorbidities_demo_censored_wo_vax.age_bin, 'null'::text) AS age_bin,
                    covid_positive_comorbidities_demo_censored_wo_vax.race_concept_name AS race,
                    regexp_replace(covid_positive_comorbidities_demo_censored_wo_vax.comorbidity_list, 'Charlson - '::text, ''::text, 'g'::text) AS comorbidities,
                    covid_positive_comorbidities_demo_censored_wo_vax.num_patients AS patient_display,
                        CASE
                            WHEN covid_positive_comorbidities_demo_censored_wo_vax.num_patients = '<20'::text OR covid_positive_comorbidities_demo_censored_wo_vax.num_patients IS NULL THEN 0
                            ELSE covid_positive_comorbidities_demo_censored_wo_vax.num_patients::integer
                        END AS patient_count
                   FROM n3c_questions.covid_positive_comorbidities_demo_censored_wo_vax
                  WHERE covid_positive_comorbidities_demo_censored_wo_vax.num_patients IS NOT NULL 
                  AND covid_positive_comorbidities_demo_censored_wo_vax.num_patients <> '<20'::text ) foo
             JOIN n3c_dashboard.age_map6 USING (age_bin)
             JOIN n3c_dashboard.race_map USING (race)
             JOIN n3c_dashboard.gender_map3 USING (gender)
             JOIN n3c_dashboard.severity_map USING (severity)) done;
</sql:query>
{
    "headers": [
        {"value":"severity", "label":"Severity"},
        {"value":"gender", "label":"Gender"},
        {"value":"age_bin", "label":"Age"},
        {"value":"race", "label":"Race"},
        {"value":"comorbidity_list", "label":"Comorbidities"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"},
        {"value":"race_abbrev", "label":"dummy3"},
        {"value":"race_seq", "label":"dummy4"},
        {"value":"gender_abbrev", "label":"dummy7"},
        {"value":"gender_seq", "label":"dummy8"},
        {"value":"severity_abbrev", "label":"dummy9"},
        {"value":"severity_seq", "label":"dummy0"}
    ],
    "rows" : 
<c:forEach items="${severity.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
