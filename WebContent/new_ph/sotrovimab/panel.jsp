<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!-- sotrovimab_comorbidity (2022-03-31 05:05) -->
<!-- sotrovimab_demographic (2022-03-31 05:05) -->
<!-- sotrovimab_other_meds (2022-03-31 05:05) -->
<!-- sotrovimab_test_type (2022-03-31 05:05) -->
<!-- sotrovimab_vax_status (2022-03-31 05:05) -->

<jsp:include page="../block.jsp">
	<jsp:param name="block" value="sotrovimab_1" />
	<jsp:param name="block_header" value="Sotrovimab and Other Medications" />

	<jsp:param name="kpis" value="sotrovimab/kpis.jsp?block=sotrovimab_1" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=simple" />

	<jsp:param name="datatable" value="../modules/reinfections_by_date.jsp" />
	<jsp:param name="datatable_div" value="reinfections-by-date" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="sotrovimab_2" />
	<jsp:param name="block_header" value="Sotrovimab and COVID Diagnosis Type" />

	<jsp:param name="kpis" value="sotrovimab/kpis.jsp?block=sotrovimab_2" />

	<jsp:param name="age_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=simple" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="sotrovimab_3" />
	<jsp:param name="block_header" value="Sotrovimab and Comorbidity" />

	<jsp:param name="kpis" value="sotrovimab/kpis.jsp?block=sotrovimab_3" />

	<jsp:param name="severity_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=simple" />
</jsp:include>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="sotrovimab_4" />
	<jsp:param name="block_header" value="Sotrovimab and Demographics" />

	<jsp:param name="kpis" value="sotrovimab/kpis.jsp?block=sotrovimab_4" />

	<jsp:param name="severity_filter" value="true" />
	<jsp:param name="age_filter" value="true" />
	<jsp:param name="gender_filter" value="true" />

	<jsp:param name="severity_panel" value="test_panel.jsp?info=severity" />
	<jsp:param name="age_panel" value="test_panel.jsp?info=age" />
	<jsp:param name="gender_panel" value="test_panel.jsp?info=gender" />

	<jsp:param name="datatable" value="sotrovimab/demographics_table.jsp" />
	<jsp:param name="datatable_div" value="sotrovimab_demographics" />
	<jsp:param name="datatable_feed" value="sotrovimab/feeds/demographics.jsp" />
</jsp:include>
<script>
	sotrovimab_4_toggle("severity");
</script>
<jsp:include page="../block.jsp">
	<jsp:param name="block" value="sotrovimab_5" />
	<jsp:param name="block_header" value="Sotrovimab and Vaccination Status" />

	<jsp:param name="kpis" value="sotrovimab/kpis.jsp?block=sotrovimab_5" />

	<jsp:param name="severity_filter" value="true" />

	<jsp:param name="simple_panel" value="test_panel.jsp?info=simple" />
</jsp:include>
