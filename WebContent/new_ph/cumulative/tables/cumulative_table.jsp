<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<div id="cumulative_1_cumulative_table" class="dash_viz" style="margin-top:20px;"></div>

<script>
function ${param.block}_constrain_table(filter, constraint) {
	var table = $('#cumulative_1_cumulative_table-table').DataTable();
	
	switch (filter) {
	case 'gender':
		table.column(0).search(constraint, true, false, true).draw();	
		break;
	case 'race':
		table.column(4).search(constraint, true, false, true).draw();	
		break;
	}
	
	var kpis = '${param.target_kpis}'.split(',');
	for (var a in kpis) {
		${param.block}_updateKPI(table, kpis[a])
	}
}

function ${param.block}_updateKPI(table, column) {
	
	console.log(column);
	
	var sum_string = '';
	var sum = table.rows({search:'applied'}).data().pluck(column).sum();
	
	if (sum < 1000) {
		sumString = sum+'';
	} else if (sum < 1000000) {
		sum = sum / 1000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "k";
	} else {
		sum = sum / 1000000.0;
		sumString = sum.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2}) + "M";
		
	}
	
	document.getElementById('${param.block}'+'_'+column+'_kpi').innerHTML = sumString;
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

$.getJSON("<util:applicationRoot/>/new_ph/cumulative/feeds/cumulative_summary.jsp", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}

	var table = document.createElement("table");
	table.className = 'table table-hover compact site-wrapper';
	table.style.width = '100%';
	table.id="cumulative_1_cumulative_table-table";

	var header= table.createTHead();

    var header_row1 = header.insertRow(); 
	var header_row2 = header.insertRow(); 
	
	var th1 = document.createElement("th");
	th1.setAttribute("rowspan", "2");
	th1.innerHTML = '<span style="color:#333; font-weight:600; font-size:14px;">Racial Categories & Gender</span>';
	header_row1.appendChild(th1);
	var th2 = document.createElement("th");
	th2.setAttribute("colspan", "4");
	th2.style.textAlign = 'Center';
	th2.innerHTML = '<span style="color:#333; font-weight:600; font-size:14px;">Ethnic Categories</span>';
	header_row1.appendChild(th2);
	var th3 = document.createElement("th");
	th3.setAttribute("rowspan", "2");
	th3.innerHTML = '<span style="color:#333; font-weight:600; font-size:14px;">Total</span>';
	header_row1.appendChild(th3);

	var other_vals = ['Non-Hispanic or Latino', 'Hispanic or Latino', 'Unknown/Not Reported', 'Race']

	for (i in other_vals) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:14px;">' + other_vals[i] + '</span>';
		header_row2.appendChild(th);
	}

	var divContainer = document.getElementById("cumulative_1_cumulative_table");
	divContainer.appendChild(table);

	var data = json['rows'];

	${param.block}_datatable = $('#cumulative_1_cumulative_table-table').DataTable( {
		data: data,
    	dom: 'lr<"datatable_overflow"t>Bip',
    	buttons: {
    	    dom: {
    	      button: {
    	        tag: 'button',
    	        className: ''
    	      }
    	    },
    	    buttons: [{
    	      className: 'btn btn-sm btn-light',
    	      titleAttr: 'Excel export.',
    	      text: 'Excel',
			  action: function ( e, dt, node, config ) {
			  	var table = $("#cumulative_1_cumulative_table-table").tableExport({
			  		formats: ["xlsx"],
			  		exportButtons: false
			  	});
			  	var exportData = table.getExportData(); 
			  	var xlsxData = exportData['cumulative_1_cumulative_table-table'].xlsx; 
			  	table.export2file(xlsxData.data, xlsxData.mimeType, xlsxData.filename, xlsxData.fileExtension, xlsxData.merges, xlsxData.RTL, xlsxData.sheetname)
              }
    	    }]
    	},
       	paging: false,
    	order: [[4, 'asc']],
     	columns: [
        	{ data: 'gender', visible: true, orderable: false },
        	{ data: 'count_non_hispanic', visible: true, orderable: false },
        	{ data: 'count_hispanic', visible: true, orderable: false },
        	{ data: 'count_ethnicity_unknown', visible: true, orderable: false},
        	{ data: 'race', visible: false},
        	{ data: 'total', visible: true, orderable: false }
    	],
    	drawCallback: function ( settings ) {    	
			var table = $('#cumulative_1_cumulative_table-table').DataTable();
			var rows = table.rows({ search: 'applied' }).nodes();
			var last= null;
			var subTotal = new Array();
			var groupID = -1;
			var aData = new Array();
			var index = 0;

			table.rows({ search: 'applied' }).data().each( function ( values, i ) {
				var group = values['race'];
				var vals = table.row(table.row($(rows).eq(i)).index()).data();
				var total = vals.total;
				var non_total = vals.count_non_hispanic;
				var hisp_total = vals.count_hispanic;
				var unk_total = vals.count_ethnicity_unknown;
				
				if (typeof aData[group] == 'undefined') {
					aData[group] = new Array();
					aData[group].rows = [];
					aData[group].total = [];
					aData[group].non_total = [];
					aData[group].hisp_total = [];
					aData[group].unk_total = [];
				}
				
				aData[group].rows.push(i); 
				aData[group].total.push(total); 
				aData[group].non_total.push(non_total); 
				aData[group].hisp_total.push(hisp_total); 
				aData[group].unk_total.push(unk_total); 
			});

			var idx= 0;

			for(var race in aData){
            	idx =  Math.min.apply(Math,aData[race].rows);
            	
				var sum = 0; 
				var non_sum = 0; 
				var hisp_sum = 0; 
				var unk_sum = 0; 
				
				$.each(aData[race].total,function(k,v){
					sum = sum + v;
				});
				$.each(aData[race].non_total,function(k,v){
					non_sum = non_sum + v;
				});
				$.each(aData[race].hisp_total,function(k,v){
					hisp_sum = hisp_sum + v;
				});
				$.each(aData[race].unk_total,function(k,v){
					unk_sum = unk_sum + v;
				});
				
				$(rows).eq(idx).before(
					'<tr class="group" style="background: lightgray; font-weight: bold"><td>'+race+'</td>'+
					'<td>'+non_sum+'</td>'+
					'<td>'+hisp_sum+'</td>'+
					'<td>'+unk_sum+'</td>'+
					'<td>'+sum+'</td></tr>'
				);    
            };
        }
	} );

	
});

</script>
