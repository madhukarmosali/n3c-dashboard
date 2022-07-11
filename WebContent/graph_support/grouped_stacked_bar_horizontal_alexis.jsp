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

d3.json("${param.data_page}", function(error, data) {
	if (error) throw error;

  
	var margin = {top: 100, right: 100, bottom: 50, left: 400},
		width = 1200 - margin.left - margin.right,
		height = 1500 - margin.top - margin.bottom;

	var myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select("${param.dom_element}").select("svg").remove();
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
	
	myObserver.observe(d3.select("${param.dom_element}").node());
	
	draw();
	
	function draw() {
			
		var barPadding = 0;

		var x = d3.scaleLinear()
			.rangeRound([0, width]);

		var x1 = d3.scaleBand()

		var z = d3.scaleOrdinal()
			.range(["#07306b", "#2271b5", "#9ecbe1", "#8B8B8B"]);

		data.forEach(function(d){
    		d.${param.count} = +d.${param.count};
		})
		
  	
		z.domain(data.map(function(d) { 
			return d.${param.stack_group}; 
		}));
		


		var keys = z.domain();
		keys.reverse();


		//var stringToFilter = '<18';
		//keys.unshift(keys.splice(keys.findIndex(item => item.id === stringToFilter), 1)[0]);
		

		var groupData = d3.nest()
			.key(function(d) { return d.${param.secondary_group} + d.${param.primary_group}; })
			.rollup(function(d, i){
				var d2 = {${param.secondary_group}: d[0].${param.secondary_group}, ${param.primary_group}: d[0].${param.primary_group}, total: 0}
					d.forEach(function(d){
						d2[d.${param.stack_group}] = d.${param.count}
						d2.total += d.${param.count}
					})
				return d2;
			})
			.entries(data)
			.map(function(d){ return d.value; });
		
		
	
		x.domain([0, d3.max(groupData, function(d) { return d.total; })]).nice();

		var groupedData = d3.nest()
			.key(function (d) { return d.${param.primary_group}; })
            .entries(groupData);
		
		var sub_labels  = [];
		groupData.forEach(function(d) {
			sub_labels.push(d.${param.secondary_group});
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


		var svg = d3.select("${param.dom_element}").append("svg")
			.attr("width", width + margin.left + margin.right)
			.attr("height", height + margin.top + margin.bottom)
			
		
		var g = svg.append("g")
			.attr("transform", "translate(" + margin.left + "," + margin.top + ")")
			.attr("id", "svg_g");;
		
		g.append("text")
			.attr("y", 0 - (margin.top/2))
			.attr("x",width/2)
			.attr("dy", "1em")
			.text("${param.xaxis_label}"); 
		
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
			//.attr("class", function(d){d.replace(/[^A-Za-z0-9]/g, "")})
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
// 			.style("fill", function(d){
// 				return axis_color(d.key);
// 			})
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
			//.attr("transform", function(d) { return "translate(0," + y0(d.data.${param.primary_group}) + ")"; })
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
		     	var count = d[1]-d[0];
		     	var total = d.data.total;
		     	var label = '';
		     	for (var i in d.data){
		     		if (d.data[i] == count){
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
		     		.text(count)
		     		.attr('fill', 'black')
		     		.attr('x', 30)
  					.attr('dy', 20)
		     		.append("tspan")
	     			.text(function(){
	     				return  ((count/total) * 100).toFixed(2) + "%";
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
				if ( sub_labels2.includes(d.data.${param.secondary_group}) ){
					sub_labels2 = sub_labels2.filter(function(e) { return e !== d.data.${param.secondary_group} });
					return d.data.total;
				}
			});
		
		serie.selectAll("text2")
			.data(function(d) {return d; })
			.enter().append("text")
			.style("fill", "black")
			//.style("fill", function(d) { return axis_color(d.data.${param.primary_group});  })
			.style("text-anchor", "end")
			.style("font-size", ".8rem")
			.attr("transform", function(d, i) {return "translate(0, " + (y_category(( (i * y_defect.bandwidth())+y_defect.bandwidth()/2)+15    )) + ")"; })
			.attr("class", function(d){return "text_color " + d.data.${param.primary_group}.replace(/\s/g,''); })
			.attr("y", function(d) { return y_category(0); })
			.attr("x", function(d) { return x1(d[0]); })
			.text(function(d) {
				if ( sub_labels.includes(d.data.${param.secondary_group}) ){
					sub_labels = sub_labels.filter(function(e) { return e !== d.data.${param.secondary_group} });
					return d.data.${param.secondary_group};
				}
			})
			.on("mouseover", function(d, i) {
				svg.selectAll(".text_color:not(." + d.data.${param.primary_group}.replace(/\s/g,'') + ")").style("opacity", "0.05");
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
  		
  		
    	
		// Wrap Axis Text //////
		function wrap(text, width) {
			text.each(function() {
			  var text = d3.select(this),
			        words = text.text().split(/\s+/).reverse(),
			        word,
			        line = [],
			        lineNumber = 0,
			        lineHeight = 1, // ems
			        y = text.attr("y"),
			        dy = parseFloat(text.attr("dy")),
			        tspan = text.text(null).append("tspan").attr("x", 0).attr("y", y).attr("dy", dy + "em");
			    while (word = words.pop()) {
			      line.push(word);
			      tspan.text(line.join(" "));
			      if (tspan.node().getComputedTextLength() > width) {
			        line.pop();
			        tspan.text(line.join(" "));
			        line = [word];
			        tspan = text.append("tspan").attr("x", 0).attr("y", y).attr("dy", ((Math.ceil(++lineNumber/10)) * lineHeight) + dy + "em").text(word);
			      }
			    }
			  });
			};
		
		
		
 		}
	});

</script>
