<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.axis .domain {
	display: none;
}

.tick line{
  visibility:hidden;
}

.graph_tooltip{
	pointer-events:none;
}
</style>
<script>


// not implemented
// margin = array: [top, bottom, left, right]


function localHorizontalGroupedStackedBarChart(data, domName, primary, secondary, count, stack_group, xaxis_label) {
	
	
	var margin = {top: 100, right: 100, bottom: 50, left: 400},
		width = 1200 - margin.left - margin.right,
		height = 1500 - margin.top - margin.bottom;

	var myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select("#"+domName).select("svg").remove();
				width = newWidth - margin.left - margin.right;
				if ((width*1.5 - margin.left - margin.right) > 400){
					height = width*2.5 - margin.left - margin.right;
				} else { 
					height = 800;
				}
				draw();
			}
		});
	});
	
	myObserver.observe(d3.select("#"+domName).node());
	
	draw();
	
	function draw() {

		var barPadding = 0;

		var x = d3.scaleLinear()
			.rangeRound([0, width]);

		var x1 = d3.scaleBand()

		var z = d3.scaleOrdinal()
			.range(["#8B8B8B", "#9ecbe1", "#2271b5", "#07306b"]);

		data.forEach(function(d){
    		d.count = +d.count;
		})
		
  	
		z.domain(data.map(function(d){ 
			return d[stack_group]; 
		}));

		var keys = z.domain();
		
		if (stack_group = "age"){
			function hasNumber(myString) {
				return /\d/.test(myString);
			};
			function hasDash(myString) {
				return /(-)/.test(myString);
			};
			function eval(myString){
				if(!hasNumber(myString)){
					return '0';
				} else if(hasDash(myString)){
					 return myString.substring(myString.indexOf('-') + 1);
				} else {
					return myString.replace(/\D/g,'');
				};
			};
			
			keys = keys.sort(function(x, y){
				return Number(eval(x)) - Number(eval(y));
			});
		}
		
		z.domain(keys);
		
		
		var groupData = d3.nest()
			.key(function(d) { return d[secondary] + d[primary]; })
			.rollup(function(d, i){
				var d2 = {secondary: d[0][secondary], primary: d[0][primary], total: 0};
				d.forEach(function(d){
					console.log(d[count]);
					d2[d[stack_group]] = d[count];
					d2.total += d[count];
				})
				return d2;
			})
			.entries(data)
			.map(function(d){ return d.value; });
		
		console.log(groupData);
		console.log(d3.max(groupData, function(d) { return d.total; }));
	
		x.domain([0, d3.max(groupData, function(d) { return d.total; })]).nice();

		var groupedData = d3.nest()
			.key(function (d) { return d.primary; })
            .entries(groupData);
		
		var sub_labels  = [];

		groupData.forEach(function(d) {
			var string = '' + d.secondary + d.primary;
			sub_labels.push(string);
		});
		
		var sub_labels2 = sub_labels;
	
		var category_labels = [];
		var cummulative = 0;
		var rangeBands = [];
		
		groupedData.forEach(function(d, i) {
			
			d.values = d3.stack().keys(keys)(d.values);
			d.cummulative = cummulative;
			cummulative += d.values[0].length;
			category_labels.push(d.key);
			d.values.forEach(function(e) {
			    rangeBands.push(i);
			 })
		});
		
		

		var axis_color = d3.scaleOrdinal()
			.range(["#000000", "#7f7e80"])
			.domain(category_labels);
		
		var bar_color = d3.scaleOrdinal()
			.range(["#EEEEEE", "white"])
			.domain(category_labels);
		 
		 
		var y_category = d3.scaleLinear().range([0, height]);
		var y_defect = d3.scaleBand().domain(rangeBands).range([0, height]).padding(0.1);
		var y_category_domain = y_defect.bandwidth() * rangeBands.length;
		y_category.domain([0, y_category_domain]);


		var svg = d3.select("#"+domName).append("svg")
			.attr("width", width + margin.left + margin.right)
			.attr("height", height + margin.top + margin.bottom);
			
		
		var g = svg.append("g")
			.attr("transform", "translate(" + margin.left + "," + margin.top + ")")
			.attr("id", "svg_g");
		
		g.append("text")
			.attr("y", 0 - (margin.top/2))
			.attr("x",width/2)
			.attr("dy", "1em")
			.text(xaxis_label); 
		
		g.append("text")
			.attr("y", 0 - (margin.top/2))
			.attr("x", 0)
			.attr("dy", "1em")
			.attr("text-anchor", "end")
			.text("Medications"); 
		
		g.append("text")
			.attr("y", 0 - (margin.top/2))
			.attr("x", -margin.left)
			.attr("dy", "1em")
			.text("Drug Class"); 
		
		g.append("g")
			.attr("class", "axis")
			.call(d3.axisTop(x).ticks(null, "s"))
			.append("text")
			.attr("y", 2)
			.attr("x", x(x.ticks().pop()) + 0.5)
			.attr("dx", "0.32em")
			.attr("fill", "#000")
			.attr("font-weight", "bold")
			.attr("text-anchor", "start")

		
		// Legend ////////////////////	
		var legend_text = g.append("g")
			.attr("transform", "translate(" + (margin.right) + " ," + (0) + " )")
			.attr("font-family", "sans-serif")
			.attr("font-size", 11)
			.attr("font-weight", "bold")
			.attr("text-anchor", "start")
			.append("text")
			.attr("x", width - 24)
			.attr("y", 9.5)
			.attr("dy", "0.32em")
			.text("${param.legend_label}");
			
		var legend = g.append("g")
			.attr("transform", "translate(" + (margin.right) + " ," + (20) + " )")
			.attr("font-family", "sans-serif")
			.attr("font-size", ".8rem")
			.attr("text-anchor", "end")
			.selectAll("g")
			.data(keys.slice().reverse())
			.enter().append("g")
			.attr("transform", function(d, i) {
				return "translate(0," + i * 20 + ")";
			})
			.attr("class", function(d){
				return "secondary lab" + d.replace(/[^A-Z0-9]/ig, "")}
			)
			.on("mouseover", function(d, i) {
				svg.selectAll(".secondary:not(.lab" + d.replace(/[^A-Z0-9]/ig, "") + ")").style("opacity", "0.05");
			})
			.on("mouseout", function(d, i) {
  				svg.selectAll(".secondary").style("opacity", "1");
			});

		legend.append("rect")
			.attr("x", width - 19)
			.attr("width", 19)
			.attr("height", 19)
			.attr("fill", z);

		legend.append("text")
			.attr("x", width - 24)
			.attr("y", 9.5)
			.attr("dy", "0.32em")
			.text(function(d) {
				return d;
		});
		
		// Bars ///////////////
		var categories = g.selectAll(".categories")
			.data(groupedData)
  			.enter().append("g")
  			.attr("class", function(d) {
    			return 'category category-' + d.key.replace(/\s+/g, '');
  			})
  			.attr("transform", function(d) {
    			return "translate(0, " + y_category(( d.cummulative * y_defect.bandwidth() )) + ")";
  			});
		
		categories.append("rect")
			.attr("transform", function(d) {
				var h = (d.values[0].length) * (y_category(y_defect.bandwidth() - barPadding));
    			return "translate("+ -margin.left +", " + 0 + ")";
  			})
  			.style("fill", function(d){
				return bar_color(d.key);
			})
  			.attr("height", function(d){
  				return (d.values[0].length) * (y_category(y_defect.bandwidth() - barPadding));
  			})
  			.attr("width", width + margin.left);
		
		
		categories
			.append("text")
	    	.text(function(d) { return d.key })
	    	.attr("class", function(d){return "text_color " + d.key.replace(/\s/g,'')})
			.style("font-size", ".8rem")
			.style("fill", "black")
			.style("text-anchor", "start")
			.attr("transform", function(d) {
				var h = (d.values[0].length) * (y_category(y_defect.bandwidth() - barPadding));
    			return "translate(" + -(margin.left) + " , " + ((h/2)+5) + ")";
  			})
  			.on("mouseover", function(d, i) {
				svg.selectAll(".text_color:not(." + d.key.replace(/\s/g,'') + ")").style("opacity", "0.05");
			})
			.on("mouseout", function(d, i) {
  				svg.selectAll(".text_color").style("opacity", "1");
			});
			
			
		var serie = categories.selectAll(".serie")
			.data(function(d) {return d.values;})
			.enter().append("g")
			.attr("class",function(d) { return "serie ${param.namespace}" + d.key.replace(/[^A-Za-z0-9]/g, ""); })
			.attr("fill", function(d) { return z(d.key); });
		
		serie.selectAll("rect")
			.data(function(d) {return d; })
			.enter().append("rect")
			.attr("class", function(d){
				var count = d[1]-d[0];
				var label = '';
		     	for (var i in d.data){
		     		if (d.data[i] == count){
		     			label = i;
		     		}
		     	};
				return "serie-rect secondary lab" + label.replace(/[^A-Z0-9]/ig, "");
			})
			.attr("transform", function(d, i) {return "translate(0, " + y_category((i * y_defect.bandwidth())) + ")"; })
			.attr("y", function(d) { return y_category(0); })
			.attr("x", function(d) { return x(d[0]); })
			.attr("width", function(d) { return Math.max(1,x(d[1]) - x(d[0])); })
			.attr("height",  y_category(y_defect.bandwidth() - barPadding))
			.on("click", function(d, i){ console.log("serie-rect click d", i, d); })
			.on("mouseover", function() { tooltip.style("display", null); })
		    .on("mouseout", function() { tooltip.style("display", "none"); })
		    .on("mousemove", function(d) {
		     	var yPosition = d3.mouse(document.getElementById("svg_g"))[1];
		     	var xPosition = d3.mouse(document.getElementById("svg_g"))[0];
		     	var count2 = d[1]-d[0];
		     	var total = d.data.total;
		     	var label = '';
		     	for (var i in d.data){
		     		if (d.data[i] == count2){
		     			label = i;
		     		}
		     	}
		     	tooltip.selectAll("tspan").remove();
		     	tooltip
		     		.attr("transform", "translate(" + xPosition + "," +  yPosition + ")")
		     		.selectAll("text")
		     		.append("tspan")
		     		.text(label)
		     		.attr('x', 30)
  					.attr('dy', 10)
  					.attr('fill', function(d){return z(label)})
		     		.append("tspan")
		     		.text(count2)
		     		.attr('fill', 'black')
		     		.attr('x', 30)
  					.attr('dy', 20)
		     		.append("tspan")
	     			.text(function(){
	     				return  ((count2/total) * 100).toFixed(2) + "%";
	     			})
	     			.attr('fill', 'black')
	     			.attr('x', 30)
					.attr('dy', 21);
		   	 	});
		
		serie.selectAll("g")
			.data(function(d) {return d; })
			.enter().append("text")
			.style("fill", "#a5a2a2")
			.attr("class", "secondary")
			.style("text-anchor", "start")
			.style("font-size", ".8rem")
			.attr("transform", function(d, i) {return "translate(0, " + (y_category(( (i * y_defect.bandwidth())+y_defect.bandwidth()/2)+15    )) + ")"; })
			.attr("y", function(d) { 
				return y_category(0); 
			})
			.attr("x", function(d) { return (x(d.data.total)) + 5; })
			.text(function(d) {
				var string = '' + d.data.secondary + d.data.primary;
				if ( sub_labels2.includes(string) ){
					sub_labels2 = sub_labels2.filter(function(e) { return e !== string });
					return d.data.total;
				}
					console.log(d);
			});
		
		serie.selectAll("text2")
			.data(function(d) {return d; })
			.enter().append("text")
			.style("fill", "black")
			.style("text-anchor", "end")
			.style("font-size", ".8rem")
			.attr("transform", function(d, i) {return "translate(0, " + (y_category(( (i * y_defect.bandwidth())+y_defect.bandwidth()/2)+15    )) + ")"; })
			.attr("class", function(d){return "text_color " + d.data.primary.replace(/\s/g,''); })
			.attr("y", function(d) { return y_category(0); })
			.attr("x", function(d) { return x1(d[0]); })
			.text(function(d) {
				var string = '' + d.data.secondary + d.data.primary;
				if ( sub_labels.includes(string) ){
					sub_labels = sub_labels.filter(function(e) { return e !== string });
					return d.data.secondary;
				}
			})
			.on("mouseover", function(d, i) {
				svg.selectAll(".text_color:not(." + d.data.primary.replace(/\s/g,'') + ")").style("opacity", "0.05");
			})
			.on("mouseout", function(d, i) {
  				svg.selectAll(".text_color").style("opacity", "1");
			});;
		
		// Tooltip ////// 
		var tooltip = g.append("g")
    		.attr("class", "graph_tooltip")
    		.style("display", "none");
      
  		tooltip.append("rect")
    		.attr("width", 60)
    		.attr("height", 53)
    		.attr("fill", "white")
    		.style("opacity", 0.8);

		tooltip.append("text")
 			.attr("x", 30)
    		.attr("dy", "1.2em")
    		.style("text-anchor", "middle")
    		.attr("font-size", "12px")
    		.attr("font-weight", "bold");		
		
	}
};

</script>
