<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<script>

function ${param.block}_constrain_table(filter, constraint) {
	var table = $('#${param.target_div}-table').DataTable();
	console.log("${param.block}", filter, constraint)
	switch (filter) {
	case 'age':
		table.column(0).search(constraint, true, false, true).draw();	
		break;
	case 'gender':
		table.column(1).search(constraint, true, false, true).draw();	
		break;
	case 'race':
		table.column(2).search(constraint, true, false, true).draw();	
		break;
	case 'ethnicity':
		table.column(3).search(constraint, true, false, true).draw();	
		break;
	case 'observation':
		table.column(4).search(constraint, true, false, true).draw();	
		break;
	case 'symptom':
		table.column(5).search(constraint, true, false, true).draw();	
		break;
	}
	
	console.log('${param.target_kpis}')
	var kpis = '${param.target_kpis}'.split(',');
	for (var a in kpis) {
		console.log(kpis[a]);
		${param.block}_updateKPI(table, kpis[a])
	}
	
	console.log('${param.target_filtered_kpis}')
	var kpis = '${param.target_filtered_kpis}'.split(',');
	for (var a in kpis) {
		console.log('filtered', kpis[a]);
		var components = kpis[a].split('|');
		console.log('filtered', components);
		${param.block}_updateFilteredKPI(components[0], components[1], table, components[3], components[2])
	}
}

function ${param.block}_updateKPI(table, column) {
	var sum_string = '';
	var sum = table.rows({search:'applied'}).data().pluck(column).sum();
	console.log(sum, table.rows({search:'applied'}).data().pluck(column))
	if (sum < 1000) {
		sumString = sum+'';
	} else if (sum < 1000000) {
		sum = sum / 1000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "k"
	} else {
		sum = sum / 1000000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "M"
		
	}
	console.log('${param.block}', column, sumString, '${param.block}'+'_'+column+'_kpi')
	document.getElementById('${param.block}'+'_'+column+'_kpi').innerHTML = sumString
}

function ${param.block}_updateFilteredKPI(filter_column, filter_value, table, column, kpi_label) {
	var sum_string = '';
    var indexes = table
      .rows({search:'applied'})
      .indexes()
      .filter( function ( value, index ) {
        return filter_value === table.row(value).data()[filter_column];
      } );
	var sum = table.rows(indexes).data().pluck(column).sum();
	console.log('filtered', sum, table.rows(indexes).data().pluck(column).sum())
	if (sum < 1000) {
		sumString = sum+'';
	} else if (sum < 1000000) {
		sum = sum / 1000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "k"
	} else {
		sum = sum / 1000000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "M"
		
	}
	console.log('${param.block}', column, sumString)
	document.getElementById('${param.block}'+'_'+kpi_label+'_kpi').innerHTML = sumString
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
       	dom: 'lfrtBip',
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
    	      filename: 'grouped_symptoms_csv_export',
    	      extension: '.csv'
    	    }, {
    	      extend: 'copy',
    	      className: 'btn btn-sm btn-light',
    	      titleAttr: 'Copy table data.',
    	      text: 'Copy'
    	    }]
    	},
    	pageLength: 10,
    	lengthMenu: [ 10, 25, 50, 75, 100 ],
    	order: [[0, 'asc']],
     	columns: [
        	{ data: 'age', visible: true, orderable: true },
        	{ data: 'gender', visible: true, orderable: true },
        	{ data: 'race', visible: true, orderable: true },
        	{ data: 'ethnicity', visible: true, orderable: true },
        	{ data: 'observation', visible: true, orderable: true },
        	{ data: 'symptom', visible: true, orderable: true },
        	{ data: 'patient_display', visible: true, orderable: true, orderData: [7] },
        	{ data: 'patient_count', visible: false },
        	{ data: 'age_abbrev', visible: false },
        	{ data: 'age_seq', visible: false },
        	{ data: 'race_abbrev', visible: false },
        	{ data: 'race_seq', visible: false },
        	{ data: 'ethnicity_abbrev', visible: false },
        	{ data: 'ethnicity_seq', visible: false },
        	{ data: 'gender_abbrev', visible: false },
        	{ data: 'gender_seq', visible: false },
        	{ data: 'observation_seq', visible: false },
        	{ data: 'symptom_seq', visible: false }
    	]
	} );

	// this is necessary to populate the histograms for the panel's initial D3 rendering
	${param.block}_refreshHistograms();

	
});

</script>
