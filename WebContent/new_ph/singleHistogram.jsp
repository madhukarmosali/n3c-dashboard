<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

function ${param.block}_refresh${param.array}(data) {
	var aData = new Object;
	var bData = new Object;
	$("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().each( function ( group, i ) {
    	var group = data[i].${param.primary};
    	var seq = data[i].${param.primary}_seq;
    	var count = data[i].patient_count;
        if (typeof aData[group] == 'undefined') {
            aData[group] = count;
            bData[group] = seq;
         } else
        	 aData[group] += count;
	});

	${param.block}_${param.array} = new Array();
    for(var i in aData) {
    	var obj = new Object();
    	Object.defineProperty(obj, 'element', {
    		  value: i
    		});
    	Object.defineProperty(obj, 'count', {
  		  value: aData[i]
  		});
    	Object.defineProperty(obj, 'seq', {
	  		  value: bData[i]
	  		});
    	${param.block}_${param.array}.push(obj);
    }
    ${param.block}_${param.array}.sort((a,b) => (a.seq > b.seq) ? 1 : ((b.seq > a.seq) ? -1 : 0));
    console.log("refreshed ${param.array}", ${param.block}_${param.array});
}

</script>
