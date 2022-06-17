<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.axis .domain {
	display: none;
}

.tick line{
  visibility:hidden;
}

rect{
	cursor: auto;
}

.graph_tooltip{
	pointer-events:none;
}
.axis{
font-size: 14px;
}

</style>
<script>

function localHorizontalStackedBarChart(data, domName, barLabelWidth, legend_data, secondary_range = categorical, legend_label, min_height, nofilter) {
	
	var add_filter_text = 1;
	if ((nofilter != undefined) && (nofilter == 1) ){
		console.log("reached");
		add_filter_text = 0;
	}
	
	if (legend_label === undefined){
		legend_label = "Legend";
	}
	
	if (min_height === undefined) {
        min_height = 200;
    }

	
	var margin = { top: 40, right: 100, bottom: 30, left: barLabelWidth },
		width = 1200 - margin.left - margin.right,
		height = width/2.5 - margin.top - margin.bottom;
	var maxBarWidth = 280; // width of the bar with the max value
	var valueLabelWidth = 50; // space reserved for value labels (right)
	var barLabelPadding = 5; // padding between bar and bar labels (left)
	var paddingInside = 0.5


	// get length of longest legend word for tooltip sizing
	var longest_word = legend_data.reduce(
		    function (a, b) {
		        return a.secondary.length > b.secondary.length ? a : b;
		    }
	);
	var word_length = longest_word.secondary.length;


	var myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select("#"+domName).select("svg").remove();
				width = newWidth - margin.left - margin.right;
				height = width/2.5;
				maxBarWidth = width - barLabelWidth - barLabelPadding - valueLabelWidth;
				if (height < min_height) {
					height = min_height;
				};
				draw();
			}
		});
	});

	myObserver.observe(d3.select("#"+domName).node());

	draw();

	function draw() {
		var svg = d3.select("#"+domName).append("svg")
			.attr("width", width + margin.left + margin.right)
			.attr("height", Number(height) + margin.top + margin.bottom);
		
		var g = svg.append("g")
			.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		var y = d3.scaleBand()			
			.range([0, height-margin.bottom])	
			.paddingInner(paddingInside)
			.align(0.1);

		var x = d3.scaleLinear()	
			.range([0, width - margin.right]);	

		var z = secondary_range;

		var keys = data.map(function(d) { return d.element; });
		
		var stackData = myStack(data);
	
		
		
		y.domain(data.map(function(d) { return d.element; }));					
		x.domain([0, d3.max(data, function(d) { return d.count; })]).nice();	
		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(0,0)") 						
			.call(d3.axisLeft(y));									

		g.append("g")
			.attr("class", "axis xaxis")
			.attr("transform", "translate(0," + (height-margin.bottom) + ")")				
			.call(d3.axisBottom(x).ticks(Math.round(width/100), "s"))
			.append("text")										
			.attr("fill", "#000")
			.attr("font-weight", "bold")
			.attr("text-anchor", "start")
			.text("Patient Count")
			.attr("transform", "translate(" + ((width/2)- margin.right) + "," + 40 + ")"); 
		
		d3.selectAll("g.xaxis g.tick")
	    	.append("line")
	    	.attr("class", "gridline")
	    	.attr("x1", 0)
	    	.attr("y1", -height+margin.top)
	    	.attr("x2", 0)
	    	.attr("y2", 0);

		var barsect = g.append("g")
			.selectAll("g")
			.data(stackData)
			.enter().append("g")
			.attr("class", function(d, i) { return "serie " + "color-" + z[i].substring(1); })
			.attr("fill", function(d,i) {return z[i]; });
		

		
		barsect.selectAll("rect")
			.data(function(d) { return d; })
			.enter().append("rect")
			.attr("class", function(d){ return domName+"-rect "; })
			.attr("y", function(d,i) { return y(data[i].element); })
			.attr("x", function(d) { return x(d[0]); })
			.attr("width", function(d) {return x(d[1]) - x(d[0]); })
			.attr("height", y.bandwidth())	
			.on("mouseover", function() { 
				tooltip.style("display", null); 
			    // Reduce opacity of all rect to 0.2
			    d3.selectAll("."+domName+"-rect").style("opacity", 0.2)
			    // Highlight all rects of this subgroup with opacity 1.
 				d3.select(this.parentNode).selectAll("."+domName+"-rect")
			      .style("opacity", 1);
			})
			.on("mouseout", function() {
				tooltip.style("display", "none");
			    // Back to normal opacity: 1
			    d3.selectAll("."+domName+"-rect")
			      .style("opacity",1);
			})
			.on("mousemove", function(d) {	
				tooltip.selectAll("tspan").remove();
				
				var xPosition = d3.mouse(this)[0];
		     	var yPosition = d3.mouse(this)[1];
		     	var count2 = d[1]-d[0];
		     	tooltip.attr("transform", "translate(" + xPosition + "," + yPosition + ")")
		     	.selectAll("text")
		     		.append("tspan")
		     		.text(d[2])
		     		.attr('x', 10)
  					.attr('dy', 13)
		     		.append("tspan")
		     		.text(count2)
		     		.attr('fill', 'black')
		     		.attr('x', 10)
  					.attr('dy', 20)
		     		.append("tspan")
	     			.text(function(){
	     				return  ((count2/d[3]) * 100).toFixed(2) + "%";
	     			})
	     			.attr('fill', 'black')
	     			.attr('x', 10)
					.attr('dy', 20);
			});

		
		function nFormatter(num, digits) {
			  const lookup = [
			    { value: 1, symbol: "" },
			    { value: 1e3, symbol: "k" },
			    { value: 1e6, symbol: "M" },
			    { value: 1e9, symbol: "G" },
			    { value: 1e12, symbol: "T" },
			    { value: 1e15, symbol: "P" },
			    { value: 1e18, symbol: "E" }
			  ];
			  const rx = /\.0+$|(\.[0-9]*[1-9])0+$/;
			  var item = lookup.slice().reverse().find(function(item) {
			    return num >= item.value;
			  });
			  return item ? (num / item.value).toFixed(digits).replace(rx, "$1") + item.symbol : "0";
			}
		
		
		barsect.selectAll("g")
			.data(function(d) {return d; })
			.enter().append("text")
			.style("fill", "#a5a2a2")
			.attr("class", "secondary")
			.style("text-anchor", "start")
			.style("font-size", "12px")
			.attr("y", function(d,i) { return (y(data[i].element)) + ((y.bandwidth()*paddingInside)/4) + (y.bandwidth()/2) ; })
			.attr("x", function(d) { return (x(d[3])) + 5; })
			.text(function(d) {
				if(d[2] == legend_data[0].secondary){
					return nFormatter(d[3], 2);
				}
			});

		// Legend ////////////////////	
		var legend_text = g.append("g")
			.attr("transform", "translate(" + ((margin.right/2)) + " ," + 0 + " )")
			.attr("font-family", "sans-serif")
			.attr("font-size", '14px')
			.attr("font-weight", "bold")
			.attr("text-anchor", "end")
			.append("text")
			.attr("x", width)
			.attr("y", 9.5)
			.attr("dy", "5px")
			.text(legend_label);

		var legend = g.append("g")
			.attr("transform", "translate(" + ((margin.right/2)) + " ," + 20 + " )")
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
// 			.attr("cx", width - 10)
// 			.attr("cy", 10)
// 			.attr("r", 8)
			.attr("x", width-19)
			.attr("width", 19)
			.attr("height", 19)
			.attr("fill", function(d, i) { return z[i]; })
			.on("click", function(d, i){window[domName.replace(/_[^_]+_[^_]+$/i,'_')+'viz_constrain'](d, legend_label); })
			.on("mouseover", function(d, i) {
				svg.selectAll(".serie:not(.color-" + z[i].substring(1) + ")").style("opacity", "0.2");
			})
			.on("mouseout", function(d, i) {
  				svg.selectAll(".serie").style("opacity", "1");
			})
			.append('title')
  			.text(function (){
  				if (add_filter_text == 1){
  					return 'Click to add/remove filter'
  				} else return
  			});

		legend.append("text")
			.attr("x", width - 24)
			.attr("y", 9.5)
			.attr("dy", "5px")
			.text(function(d) {	return d.secondary; });
			
		// Tooltip ////// 
		var tooltip = g.append("g")
    		.attr("class", "graph_tooltip")
    		.style("display", "none");
      
  		tooltip.append("rect")
    		.attr("width", 10 + word_length * 7)
    		.attr("height", 60)
    		.attr("fill", "white")
    		.style("opacity", 0.7);

  		tooltip.append("text")
    		.style("text-anchor", "start")
    		.attr("font-size", "12px")
    		.attr("font-weight", "bold");
	};

	
	function myStack(data) {
		var result = new Array();
		
		if (data.length == 0)
			return result;
		
		var previous = 0;
		for (let secondary = 1; secondary < data[0].secondary.length; secondary++) {
			var newrow = new Array();
			for (let primary = 0; primary < data.length; primary++) {
				if (previous == 0){
					newrow.push([0, data[primary].secondary[secondary], legend_data[secondary-1].secondary, data[primary].count ]);
				}else{
					newrow.push([previous[primary][1], previous[primary][1] + data[primary].secondary[secondary], legend_data[secondary-1].secondary, data[primary].count ]);
				}
			}	
			result.push(newrow);
			previous = newrow;
		}
		return result;
	}

}
</script>
