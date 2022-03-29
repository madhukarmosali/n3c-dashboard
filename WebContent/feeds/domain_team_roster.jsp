<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<sql:query var="team" dataSource="jdbc/N3CPublic">
select jsonb_agg(foo) as foo
from
     (select nid ,title,regexp_replace(regexp_replace(summary,'[\r\n]+','','g'),'["]','&quot;','g') as description,cross_cutting::boolean, DATE(created) as created from n3c_admin.domain_team order by title) as foo;
</sql:query>

{
    "headers": [
    	{"value":"nid", "label":"id"},
        {"value":"title", "label":"Title"},
        {"value":"description", "label":"Description"},
        {"value":"cross_cutting", "label":"Cross Cutting"},
        {"value":"created", "label":"Created"}
    ],
    "rows" :
    <c:forEach items="${team.rows}" var="row" varStatus="rowCounter">
	    ${row.foo}
	</c:forEach>

}
       