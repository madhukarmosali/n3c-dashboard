<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

function ${param.block}_refresh${param.array}(data) {
	var aData = new Object;
	var bData = new Object;
	var cData = new Object;
	var dData = new Object;
	var eData = new Object;
	var maxIndex = 0;
	
	
	if (!"${param.wrap}"){
		$("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().each( function ( group, i ) {
			<c:choose>
				<c:when test="${empty param.primary_abbrev}">
	    			var group = data[i].${param.primary};
				</c:when>
				<c:otherwise>
					var group = data[i].${param.primary_abbrev};
				</c:otherwise>
			</c:choose>
			var subgroup = data[i].${param.secondary};
	    	var seq = data[i].${param.primary}_seq;
	    	var count = data[i].patient_count;
	    	var ${param.secondary} = data[i].${param.secondary};
	    	var ${param.secondary}_seq = data[i].${param.secondary}_seq;
	    	var ${param.tertiary} = data[i].${param.tertiary};
	    	var ${param.tertiary}_seq = data[i].${param.tertiary}_seq;
	        if (typeof aData[group] == 'undefined') {
	            aData[group] = count;
	            bData[group] = seq;
	            cData[group] = new Object;
	            cData[group][${param.secondary}] = count;
	            dData[group] = new Object();
	            dData[group][${param.secondary}] = [0,0,0,0,0,0,0,0];
	            dData[group][${param.secondary}][${param.tertiary}_seq] += count;
	            maxIndex = Math.max(maxIndex, ${param.tertiary}_seq);
	        } else if (typeof cData[group][${param.secondary}] == 'undefined') {
// 	        	console.log('in secondary')
	            cData[group][${param.secondary}] = count;        	
	            dData[group][${param.secondary}] = [0,0,0,0,0,0,0,0];
	            dData[group][${param.secondary}][${param.tertiary}_seq] += count;
	            maxIndex = Math.max(maxIndex, ${param.tertiary}_seq);
	        } else {
	        	 aData[group] += count;
		         cData[group][${param.secondary}] += count;
		         dData[group][${param.secondary}][${param.tertiary}_seq] += count;
	             maxIndex = Math.max(maxIndex, ${param.tertiary}_seq);
	         }
		});
	
// 		console.log('aData', aData, 'bData', bData, 'cData', cData, 'dData', dData, 'eData', eData, maxIndex)
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
	    	
	    	var secondary = new Array();
	    	for (var j in cData[i]) {
	        	var obj2 = new Object();
	        	Object.defineProperty(obj2, 'element', {
	        		value: j
	        	});
	        	Object.defineProperty(obj2, 'count', {
	      		  value: cData[i][j]
	      		});
	        	Object.defineProperty(obj2, 'tertiary', {
	      		  value: dData[i][j].slice(0, maxIndex + 1)
	      		});
	        	secondary.push(obj2);
	    	}
	    	Object.defineProperty(obj, 'secondary', {
	    		  value: secondary
	    		});
	        secondary.sort((a,b) => (a.element > b.element) ? 1 : ((b.element > a.element) ? -1 : 0));
	    	${param.block}_${param.array}.push(obj);
	    }
	    ${param.block}_${param.array}.sort((a,b) => (a.element > b.element) ? 1 : ((b.element > a.element) ? -1 : 0));
	    //console.log("refreshed ${param.array}", ${param.block}_${param.array});
	} else {
		${param.block}_${param.array} = $("#${param.datatable_div}-table").DataTable().rows({search:'applied'}).data().toArray();
	}
}

</script>