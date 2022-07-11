<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.tick line{
  visibility:hidden;
}

rect{
	cursor: auto;
}

.graph_tooltip{
	pointer-events:none;
}

</style>

<script>

function localPercentageBarChart(data, domName, barLabelWidth, colorscale, ordered, legend_label, legend_data) {
	
	var filter_icon = " &#xf0b0";
	
	var margin = {top: 40, right: 100, bottom: 50, left: barLabelWidth},
	width = $(domName).width() - margin.left - margin.right,
	height = width/3;
	
	if ((ordered != undefined) && (ordered == 1) ){
		data.sort(function(a, b) {
		    return parseFloat(b.count) - parseFloat(a.count);
		});
	}
	
	function drawgraphnew(){
		var newWidth = $(domName).width();
		if (newWidth > 0) {
			d3.select(domName).select("svg").remove();
			width = newWidth - margin.left - margin.right;;
			height = width/3;
			if (height > 300){
				height = 300;
			}
			draw();
		}
	}
	
	d3.select(domName).select("svg").remove();

 	window.onresize = drawgraphnew;
	
	var word_length = 3;
	
	if (data.length > 0){
		var longest_word = data.reduce(
			    function (a, b) {
			        return a.element.length > b.element.length ? a : b;
			    }
		);
		word_length =  longest_word.element.length;
	}
	

	draw();
	function draw() {
		
		var barHeight = 25;      
		
		//Appends the svg to the chart-container div
		var svg = d3.select(domName).append("svg")
		  .attr("width", width + margin.left + margin.right)
		  .attr("height", height + margin.top + margin.bottom)
		  .append("g")
		  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
		
		var svgDefs = svg.append('defs');

        var mainGradient = svgDefs.append('linearGradient')
            .attr('id', domName.replace('#', '') + 'mainGradient');

        // Create the stops of the main gradient.
        mainGradient.append('stop')
            .style('stop-color', "#33298D")
            .attr('offset', '0');

        mainGradient.append('stop')
            .style('stop-color', "#3F50B0")
            .attr('offset', '99%');
		
		//Creates the xScale 
		var xScale = d3.scaleLinear()
		  .range([0,width-margin.right]);
		
		//Creates the yScale
		var y0 = d3.scaleBand()
			.paddingInner(0.4)
			.range([0, height])
			.domain(data.map(function(d) { return d.abbrev; }));
		
		//Defines the y axis styles
		var yAxis = d3.axisLeft(y0);
	
		//Appends the y axis
		var yAxisGroup = svg.append("g")
			.attr("class", "y axis")
			.call(yAxis);
		
		//add y axis tooltip 
		svg.select(".y.axis")
	    	.selectAll(".tick")
	    	.on("mouseover", function() { tooltip3.style("display", null); })
		    .on("mouseout", function() { tooltip3.style("display", "none"); })
		    .on("mousemove", function(d, i) {
		    	var label = data[i].element;
		    	tooltip3.selectAll("tspan").remove();
		    	tooltip3.selectAll("rect").attr("width", ((label.length * 8)+10) + 'px');
		     	var xPosition = d3.mouse(this)[0];
		     	var yPosition = d3.mouse(this)[1];
		     	tooltip3.attr("transform", "translate(" + xPosition + "," + (yPosition + y0(d)) + ")")
		     	.selectAll("text")
		     		.append("tspan")
		     		.text(label)
		     		.attr('x', 10)
  					.attr('dy', 13);
		    });

		
		var sumelement = 0;
		for (i in data){
			sumelement = sumelement+data[i].count;
		}
		
		function round(value, decimals) {
			 return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
		}   
			
		for (i in data){
			data[i]["num2"] = 100;
			if (data[i].count == 0){
				data[i]["num"] = 0;
			}else{
				data[i]["num"] = round((data[i].count/sumelement)*100, 2);
			}
		}
		
		
		  //Sets the max for the xScale
		  var maxX = d3.max(data, function(d) { return d.num2; });
		
		  //Gets the min for bar labeling
		  var minX = d3.min(data, function(d) { return d.num; });
		
		  //Defines the xScale max
		  xScale.domain([0, maxX ]);
			
		// axis labels & ticks
			var axisContainer = svg.append('g')
				.attr("class", "axis xaxis " + legend_label)
				.attr("transform", "translate(0," + (height) + ")")				
				.call(d3.axisBottom(xScale).ticks(Math.round(width/100), "s").tickFormat(function(d) {  return  d + "%" }))
				.append("text")										
				.attr("fill", "#000")
				.attr("font-weight", "bold")
				.attr("text-anchor", "start")
				.text("Percent of Total")
				.attr("transform", "translate(" + ((width/2)- margin.right) + "," + 40 + ")"); 
			
			d3.selectAll("g.xaxis." + legend_label + " g.tick")
		    	.append("line")
		    	.attr("class", "gridline")
		    	.attr("x1", 0)
		    	.attr("y1", -height+margin.top)
		    	.attr("x2", 0)
		    	.attr("y2", 0);
		
		  //Binds the data to the bars      
		  var categoryGroup = svg.selectAll(".g-category-group " + legend_label)
		    .data(data)
		    .enter()
		    .append("g")
		    .attr("class", "g-category-group " + legend_label)
		    .attr("transform", function(d) {
		    	return "translate(0," + (y0(d.abbrev)) + " )";
		    });
		  
		  //Appends background bar   
		  var bars2 = categoryGroup.append("rect")
		    .attr("width", function(d) { return xScale(d.num2); })
		    .attr("height", y0.bandwidth())
		    .attr("class", "g-num2")
		    .attr("fill", "#f1f1f1");
		
		  //Appends main bar   
		  var bars = categoryGroup.append("rect")
		    .attr("width", function(d) { return xScale(d.num); })
		    .attr("height", y0.bandwidth())
		    .attr("class", "g-num " + legend_label)
		    .attr('fill', function(d){
				if (colorscale != undefined){
					return colorscale[(d.seq-1)];
				}else{
					return 'url(' + domName +'mainGradient)';
				}
			})
		    .on("mouseover", function() { tooltip.style("display", null); })
		    .on("mouseout", function() { tooltip.style("display", "none"); })
		    .on("mousemove", function(d) {
		    	tooltip.selectAll("tspan").remove();
		    	
		     	var xPosition = d3.mouse(this)[0];
		     	var yPosition = d3.mouse(this)[1];
		     	tooltip.attr("transform", "translate(" + xPosition + "," + (d3.mouse(this)[1] + y0(d.abbrev)) + ")")
		     	.selectAll("text")
		     		.append("tspan")
		     		.text(d.element)
		     		.attr('x', 20)
  					.attr('dy', 13)
		     		.append("tspan")
		     		.text(d.num + "%")
		     		.attr('fill', 'black')
		     		.attr('x', 20)
  					.attr('dy', 20)
		     		.append("tspan")
	     			.text(d.count.toLocaleString())
	     			.attr('fill', 'black')
	     			.attr('x', 20)
					.attr('dy', 20);
		    });
		  
		  //Binds data to labels
		  var labelGroup = svg.selectAll("g-num " + legend_label)
		    .data(data)
		    .enter()
		    .append("g")
		    .attr("class", "g-label-group")
		    .attr("transform", function(d) {
		    	return "translate(0," + y0(d.abbrev) + ")";
		    });
		
		  //Appends main bar labels   
		  var barLabels = labelGroup.append("text") 
		    .text(function(d) {return  d.num + "%";})
		    .attr("x", function(d) { 
		      if (minX > 32) {
		        return xScale(d.num) - 37;}
		      else {
		        return xScale(d.num) + 6;}})
		    .style("fill", "#696969") 
		    .attr("y", (y0.bandwidth() / 1.4))
		    .attr("class", "g-labels");    
		  
		// Legend ////////////////////	
			var legend_text = svg.append("g")
				.attr("transform", "translate(" + ((margin.right/2)) + " ," + 20 + " )")
				.attr("font-family", "sans-serif")
				.attr("font-size", '14px')
				.attr("font-weight", "bold")
				.attr("text-anchor", "end")
				.append("text")
				.attr("x", width)
				.attr("y", 9.5)
				.attr("dy", "5px")
				.text(legend_label)
				.append("tspan")
				.attr('font-family', 'FontAwesome')
				.attr("class", "fa")
				.html(filter_icon);

			var legend = svg.append("g")
				.attr("transform", "translate(" + ((margin.right/2)) + " ," + 40 + " )")
				.attr("font-family", "sans-serif")
				.attr("font-size", '14px')
				.attr("text-anchor", "end")
				.selectAll("g")
					.data(legend_data)
					.enter().append("g")
					.attr("transform", function(d, i) {
						return "translate(0," + i * 20 + ")";
				});
		
			legend.append("rect")
				.attr("x", width-19)
				.attr("width", 19)
				.attr("height", 19)
				.attr("fill", function(d, i) { return colorscale[i]; })
				.on("mouseover", function(d, i) {
					tooltip2.style("display", null);
				})
				.on("mouseout", function(d, i) {
  					tooltip2.style("display", "none");
				})
				.on("click", function(d, i){window[domName.replace(/_[^_]+_[^_]+$/i,'_').replace('#', '')+'viz_constrain'](d, legend_label.replace(/\s/g, "")); });
			
			legend.append("text")
				.attr("x", width - 24)
				.attr("y", 9.5)
				.attr("dy", "5px")
				.text(function(d) {	return d.secondary; });
		  
		// Tooltip ////// 
			var tooltip = svg.append("g")
	    		.attr("class", "graph_tooltip")
	    		.style("display", "none");
	      
	  		tooltip.append("rect")
	    		.attr("width", 30 + word_length * 7)
    			.attr("height", 60)
    			.attr("fill", "white")
    			.style("opacity", 0.7);

	  		tooltip.append("text")
	    		.attr("x", 30)
	    		.attr("dy", "1.2em")
	    		.style("text-anchor", "start")
	    		.attr("font-size", "12px")
	    		.attr("font-weight", "bold");
	  		
	  	// Legend Tooltip ////// 
			var tooltip2 = svg.append("g")
	    		.attr("class", "graph_tooltip")
	    		.style("display", "none")
	    		.attr("transform", "translate(" + ((width + margin.right/2)) + "," + 0 + ")");

	  		tooltip2.append("text")
	    		.attr("x", 10)
	    		.attr("dy", "1.2em")
	    		.style("text-anchor", "end")
	    		.style("fill", "#0d6efd")
	    		.attr("font-size", "12px")
	    		.attr("font-weight", "bold")
	    		.text("Click to add/remove filter");
	  	
		// Y axis Tooltip ////// 
			var tooltip3 = svg.append("g")
	    		.attr("class", "graph_tooltip")
	    		.style("display", "none");
		
			tooltip3.append("rect")
    			.attr("width", word_length * 7)
				.attr("height", 20)
				.attr("fill", "white")
				.style("opacity", 0.7);

	  		tooltip3.append("text")
	  			.attr("x", 10)
    			.attr("dy", "1.2em")
    			.style("text-anchor", "start")
    			.attr("font-size", "12px")
    			.attr("font-weight", "bold");
	  		
		
	};

}
</script>
