<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<script>

function ${param.block}_constrain_table(filter, constraint) {
	var table = $('#${param.target_div}-table').DataTable();
	
	switch (filter) {
	case 'severity':
		table.column(0).search(constraint, true, false, false).draw();	
		break;
	case 'gender':
		table.column(1).search(constraint, true, false, false).draw();	
		break;
	case 'age':
		table.column(2).search(constraint, true, false, false).draw();	
		break;
	case 'race':
		table.column(3).search(constraint, true, false, false).draw();	
		break;
	case 'ethnicity':
		table.column(4).search(constraint, true, false, false).draw();	
		break;
	case 'comorbidities':
		var filters = constraint;
		if (constraint != ""){
			filters = constraint.replace(/[$^]/g, '').split("|").sort().join(", ");
			filters = "^" + filters + "$";
		};
		table.column(5).search(filters, true, false, true).draw();	
		break;
	case 'vaccinated':
		table.column(6).search(constraint, true, false, false).draw();	
		break;
	}
	
	var kpis = '${param.target_kpis}'.split(',');
	for (var a in kpis) {
		${param.block}_updateKPI(table, kpis[a])
	}
}

function ${param.block}_updateKPI(table, column) {
	var sum_string = '';
	var sum = table.rows({search:'applied'}).data().pluck(column).sum();
	
	if (sum < 1000) {
		sumString = sum+'';
	} else if (sum < 1000000) {
		sum = sum / 1000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "k"
	} else {
		sum = sum / 1000000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "M"
		
	}

	document.getElementById('${param.block}'+'_'+column+'_kpi').innerHTML = sumString
}

jQuery.fn.dataTable.Api.register( 'sum()', function ( ) {
	return this.flatten().reduce( function ( a, b ) {
		if ( typeof a === 'string' ) {
			a = a.replace(/[^\d.-]/g, '') * 1;
		}
		if ( typeof b === 'string' ) {
			b = b.replace(/[^\d.-]/g, '') * 1;
		}

		return a + b;
	}, 0 );
} );

var ${param.block}_datatable = null;

$.getJSON("<util:applicationRoot/>/new_ph/${param.feed}", function(data){
	
	
	var json = $.parseJSON(JSON.stringify(data));
	
	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}

	var table = document.createElement("table");
	table.className = 'table table-hover compact site-wrapper';
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
    	dom: 'lfr<"datatable_overflow"t>Bip',
    	buttons: {
    	    dom: {
    	      button: {
    	        tag: 'button',
    	        className: ''
    	      }
    	    },
    	    buttons: [{
    	      extend: 'csv',
    	      className: 'btn btn-sm btn-light',
    	      titleAttr: 'CSV export.',
    	      text: 'CSV',
    	      filename: 'severity_csv_export',
    	      extension: '.csv'
    	    }, {
    	      extend: 'copy',
    	      className: 'btn btn-sm btn-light',
    	      titleAttr: 'Copy table data.',
    	      text: 'Copy'
    	    }]
    	},
       	paging: true,
    	pageLength: 10,
    	lengthMenu: [ 10, 25, 50, 75, 100 ],
    	order: [[0, 'asc']],
     	columns: [
        	{ data: 'severity', visible: true},
        	{ data: 'gender', visible: true},
        	{ data: 'age', visible: true},
        	{ data: 'race', visible: true},
        	{ data: 'ethnicity', visible: true},
        	{ data: 'comorbidities', visible: true},
        	{ data: 'vaccinated', visible: true},
        	{ data: 'patient_display', visible: true, orderable: true, orderData: [8], searchable: false },
        	{ data: 'patient_count', visible: false, orderable: false, searchable: false },
        	{ data: 'age_abbrev', visible: false, orderable: false, searchable: false },
        	{ data: 'age_seq', visible: false, orderable: false, searchable: false },
        	{ data: 'race_abbrev', visible: false, orderable: false, searchable: false },
        	{ data: 'race_seq', visible: false, orderable: false, searchable: false },
        	{ data: 'ethnicity_abbrev', visible: false, orderable: false, searchable: false },
        	{ data: 'ethnicity_seq', visible: false, orderable: false, searchable: false },
        	{ data: 'gender_abbrev', visible: false, orderable: false, searchable: false },
        	{ data: 'gender_seq', visible: false, orderable: false, searchable: false },
        	{ data: 'severity_abbrev', visible: false, orderable: false, searchable: false },
        	{ data: 'severity_seq', visible: false, orderable: false, searchable: false }
    	]
	} );


	${param.block}_datatable.on( 'search.dt', function () {
		console.log('${param.target_div}-table search', ${param.block}_datatable.search());
		${param.block}_refreshHistograms();
		$('#${param.block}_btn_clear').removeClass("no_clear");
		$('#${param.block}_btn_clear').addClass("show_clear");
	} );

	// this is necessary to populate the histograms for the panel's initial D3 rendering
	${param.block}_refreshHistograms();

	
}).fail( function(d, textStatus, error) {
    console.error("getJSON failed, status: " + textStatus + ", error: "+error);
});

</script>
