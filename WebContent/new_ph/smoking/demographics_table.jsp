<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<script>

function ${param.block}_constrain_table(filter, constraint) {
	console.log("${param.block}", filter, constraint)
	switch (filter) {
	case 'age_bin':
	    $("#${param.datatable_div}-table").DataTable().column(0).search(constraint, true, false, true).draw();	
		break;
	case 'smoking_status':
	    $("#${param.datatable_div}-table").DataTable().column(1).search(constraint, true, false, true).draw();	
		break;
	case 'race':
	    $("#${param.datatable_div}-table").DataTable().column(2).search(constraint, true, false, true).draw();	
		break;
	case 'gender':
	    $("#${param.datatable_div}-table").DataTable().column(3).search(constraint, true, false, true).draw();	
		break;
	}
}

var ${param.block}_datatable = null;

$.getJSON("<util:applicationRoot/>/new_ph/${param.feed}", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover compact site-wrapper';
	table.style.width = '100%';
	table.id="${param.target_div}-table";

	var header= table.createTHead();
	var header_row = header.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:14px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
	}

	var divContainer = document.getElementById("${param.target_div}");
	divContainer.appendChild(table);

	var data = json['rows'];

	${param.block}_datatable = $('#${param.target_div}-table').DataTable( {
    	data: data,
       	paging: true,
    	pageLength: 10,
    	lengthMenu: [ 10, 25, 50, 75, 100 ],
    	order: [[0, 'asc']],
     	columns: [
         	{ data: 'age_bin', visible: true, orderable: true },
        	{ data: 'smoking_status', visible: true, orderable: true },
        	{ data: 'race', visible: true, orderable: true },
        	{ data: 'gender', visible: true, orderable: true },
        	{ data: 'patient_count', visible: true, orderable: true },
        	{ data: 'age_abbrev', visible: false },
        	{ data: 'age_seq', visible: false },
        	{ data: 'race_abbrev', visible: false },
        	{ data: 'race_seq', visible: false },
        	{ data: 'gender_abbrev', visible: false },
        	{ data: 'gender_seq', visible: false }
    	]
	} );

	// this is necessary to populate the histograms for the panel's initial D3 rendering
	${param.block}_refreshHistograms();

	
});

</script>
