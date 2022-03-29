<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CPublic">
	SELECT jsonb_pretty(jsonb_agg(foo))
	FROM (
		SELECT ROW_NUMBER() OVER (ORDER BY title) as id, *
		FROM (
			SELECT title, 'Publication' as type, concat('https://pubmed.ncbi.nlm.nih.gov/', pmid, '/') as url, journal as outlet, published as date, string_agg(concat(value->>'first_name', ' ', value->>'last_name'), ', ') as authors FROM n3c_pubs.litcovid_cache, jsonb_array_elements(n3c_pubs.litcovid_cache.authors) group by title, url, outlet, date, type

			UNION ALL

			select title, 'Preprint' as type, concat('https://doi.org/', doi) as url, site as outlet, pub_date as date, string_agg(value->>'name', ', ') as authors from n3c_pubs.biorxiv_cache, jsonb_array_elements(n3c_pubs.biorxiv_cache.authors) group by title, url, outlet, date, type

			UNION ALL

			select title, 'Presentation' as type, '' as url, '' as outlet, pub_date as date, correspondingauthor as authors from n3c_pubs.conference_cache
		) x
	) AS foo;
</sql:query>
{
    "headers": [
    	{"value":"id", "label":"id"},
        {"value":"title", "label":"Title"},
        {"value":"type", "label":"Type"},
        {"value":"url", "label":"URL"},
        {"value":"outlet", "label":"Outlet"},
        {"value":"date", "label":"Date"},
        {"value":"authors", "label":"Authors"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
