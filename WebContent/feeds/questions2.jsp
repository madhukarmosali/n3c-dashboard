<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="questions" dataSource="jdbc/N3CPublic">
	select seqnum, jsonb_build_object('question' , question, 'asked' , asked, 'description' , description, 'limitations' , limitations, 'iframe_info' , iframe_info, 'iframe_content' , iframe_content, 'iframe_style' , iframe_style) AS data
	from n3c_questions.roster
	order by seqnum;
</sql:query>



{
<c:forEach items="${questions.rows}" var="row" varStatus="rowCounter">
	<c:if test="${!rowCounter.last}">
	"${row.seqnum}" : ${row.data},
	</c:if>
	<c:if test="${rowCounter.last}">
		"${row.seqnum}" : ${row.data} 
	</c:if>
</c:forEach>
}
