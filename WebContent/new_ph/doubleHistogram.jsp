<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

function ${param.block}_refresh${param.array}(data) {
	var aData = new Object;
	var bData = new Object;
	var cData = new Object;
	var dData = new Object;
	var maxIndex = 0;
	$("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().each( function ( group, i ) {
		<c:choose>
			<c:when test="${empty param.primary_abbrev}">
    			var group = data[i].${param.primary};
			</c:when>
			<c:otherwise>
				var group = data[i].${param.primary_abbrev};
			</c:otherwise>
		</c:choose>
    	var seq = data[i].${param.primary}_seq;
    	var count = data[i].patient_count;
    	var ${param.secondary} = data[i].${param.secondary};
    	var ${param.secondary}_seq = data[i].${param.secondary}_seq;
    	
    	if (data[i].${param.primary}_abbrev){
			dData[group] = data[i].${param.primary}_abbrev;
		}else{
			dData[group] = data[i].${param.primary};
		};
		
        if (typeof aData[group] == 'undefined') {
            aData[group] = count;
            bData[group] = seq;
            cData[group] = [0,0,0,0,0,0,0,0];
            cData[group][${param.secondary}_seq] = count;
            maxIndex = Math.max(maxIndex, ${param.secondary}_seq);
         } else {
        	 aData[group] += count;
	         cData[group][${param.secondary}_seq] += count;
             maxIndex = Math.max(maxIndex, ${param.secondary}_seq);
         }
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
    	Object.defineProperty(obj, 'secondary', {
    		  value: cData[i].slice(0, maxIndex + 1)
    		});
    	Object.defineProperty(obj, 'abbrev', {
  		  value: dData[i]
  		});
    	${param.block}_${param.array}.push(obj);
    }
    ${param.block}_${param.array}.sort((a,b) => (a.seq > b.seq) ? 1 : ((b.seq > a.seq) ? -1 : 0));
    //console.log("refreshed ${param.array}", ${param.block}_${param.array});
}

</script>