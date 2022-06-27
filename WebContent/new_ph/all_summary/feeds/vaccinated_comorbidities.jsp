<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="severity" dataSource="jdbc/N3CPublic">
	SELECT jsonb_pretty(jsonb_agg(done.*)) AS jsonb_pretty
   FROM ( SELECT severity_abbrev as severity,
            gender_map3.gender_abbrev AS gender,
            age_map6.age_abbrev AS age,
            foo.race,
            foo.ethnicity,
            foo.comorbidities,
            foo.vaccinated,
            foo.patient_display,
            foo.patient_count,
            age_map6.age_abbrev,
            age_map6.age_seq,
            race_map.race_abbrev,
            race_map.race_seq,
            ethnicity_map.ethnicity_abbrev,
            ethnicity_map.ethnicity_seq,
            gender_map3.gender_abbrev,
            gender_map3.gender_seq,
            severity_map.severity_abbrev,
            severity_map.severity_seq
           FROM ( SELECT covid_positive_comorbidities_demo_censored.severity_type AS severity,
                    covid_positive_comorbidities_demo_censored.race_concept_name AS race,
                    covid_positive_comorbidities_demo_censored.ethnicity_concept_name AS ethnicity,
                    regexp_replace(covid_positive_comorbidities_demo_censored.comorbidity_list, 'Charlson - '::text, ''::text, 'g'::text) AS comorbidities,
                        CASE
                            WHEN covid_positive_comorbidities_demo_censored.vaccinated = '1'::text THEN 'True'::text
                            ELSE covid_positive_comorbidities_demo_censored.vaccinated
                        END AS vaccinated,
                    COALESCE(covid_positive_comorbidities_demo_censored.age_bin, 'null'::text) AS age_bin,
                    COALESCE(covid_positive_comorbidities_demo_censored.gender_concept_name, 'null'::text) AS gender,
                    covid_positive_comorbidities_demo_censored.num_patients AS patient_display,
                        CASE
                            WHEN covid_positive_comorbidities_demo_censored.num_patients = '<20'::text OR covid_positive_comorbidities_demo_censored.num_patients IS NULL THEN 0
                            ELSE covid_positive_comorbidities_demo_censored.num_patients::integer
                        END AS patient_count
                   FROM n3c_questions.covid_positive_comorbidities_demo_censored
                  WHERE covid_positive_comorbidities_demo_censored.num_patients <> '<20'::text 
                  AND covid_positive_comorbidities_demo_censored.num_patients IS NOT NULL ) foo
             JOIN n3c_dashboard.age_map6 USING (age_bin)
             JOIN n3c_dashboard.race_map USING (race)
             JOIN n3c_dashboard.ethnicity_map USING (ethnicity)
             JOIN n3c_dashboard.gender_map3 USING (gender)
             JOIN n3c_dashboard.severity_map USING (severity)) done;
</sql:query>
{
    "headers": [
        {"value":"severity", "label":"Severity"},
        {"value":"gender", "label":"Gender"},
        {"value":"age_bin", "label":"Age"},
        {"value":"race", "label":"Race"},
        {"value":"ethnicity", "label":"Ethnicity"},
        {"value":"comorbidities", "label":"Comorbidities"},
        {"value":"vaccinated", "label":"Vaccinated"},
        {"value":"patient_display", "label":"Patient Count"},
        {"value":"patient_count", "label":"Patient actual"},
        {"value":"age_abbrev", "label":"dummy1"},
        {"value":"age_seq", "label":"dummy2"},
        {"value":"race_abbrev", "label":"dummy3"},
        {"value":"race_seq", "label":"dummy4"},
        {"value":"ethnicity_abbrev", "label":"dummy3"},
        {"value":"ethnicity_seq", "label":"dummy4"},
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
