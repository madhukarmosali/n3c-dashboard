<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="projects" dataSource="jdbc/N3CPublic">
	SELECT jsonb_pretty(jsonb_agg(foo))
	FROM (select pmid,pmcid,title,journal,published from n3c_pubs.litcovid_cache) AS foo;
</sql:query>
{
    "headers": [
        {"value":"pmid", "label":"PMID"},
        {"value":"pmcid", "label":"PubMed Central"},
        {"value":"title", "label":"Title"},
        {"value":"journal", "label":"Journal"},
        {"value":"published", "label":"Published"}
    ],
    "rows" : 
<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
	${row.jsonb_pretty}
</c:forEach>
}
