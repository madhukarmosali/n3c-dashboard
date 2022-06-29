<script>

function localHorizontalBarChart(data, domName, barLabelWidth, min_height, ordered, colorscale, noseq) {
	
	
	var word_length = 3;
	
	if (data.length > 0){
		var longest_word = data.reduce(
			    function (a, b) {
			        return a.element.length > b.element.length ? a : b;
			    }
		);
		word_length =  longest_word.element.length;
		
	}
	
	var valueLabelWidth = 50; // space reserved for value labels (right)
	var barHeight = 50; // height of one bar
	var barLabelPadding = 5; // padding between bar and bar labels (left)
	var gridLabelHeight = 0; // space reserved for gridline labels
	var gridChartOffset = 3; // space between start of grid and first bar
	var maxBarWidth = 280; // width of the bar with the max value
	var paddingInside = 0.5
	
	if (min_height === undefined){
		min_height = 300;
	}
	
	if ((ordered != undefined) && (ordered == 1) ){
		data.sort(function(a, b) {
			console.log(a);
		    return parseFloat(b.count) - parseFloat(a.count);
		});
	}
	
	var margin = { top: 40, right: 50, bottom: 30, left: barLabelWidth },
		width = 1200 - margin.left - margin.right,
		height = width/3 - margin.top - margin.bottom;

	//accessor functions
	var barLabel = function(d) { return d.element; };
	var barValue = function(d) { return parseFloat(d.count); };

	var myObserver = new ResizeObserver(entries => {
		entries.forEach(entry => {
			var newWidth = Math.floor(entry.contentRect.width);
			if (newWidth > 0) {
				d3.select(domName).select("svg").remove();
				width = newWidth - margin.left - margin.right;
				height = width/3;
				maxBarWidth = width - barLabelWidth - barLabelPadding - valueLabelWidth;
				if (height < min_height) {
					height = min_height;
				};
				draw();
			}
		});
	});
	
	myObserver.observe(d3.select(domName).node());

	draw();

	function draw() {
		
		var y = d3.scaleBand()			
			.range([0, height-margin.bottom])	
			.paddingInner(paddingInside)
			.align(0.1)
			.domain(data.map(function(d) { return d.element; }));
		
		var yText = function(d, i) { return y(d, i) + y.bandwidth() / 2; };
		
		var x = d3.scaleLinear()
			.domain([0, d3.max(data, function(d){ return d.count; })])
			.range([0, width - margin.right]);
		
		var svg = d3.select(domName).append("svg")
			.attr("width", width + margin.left + margin.right)
			.attr("height", Number(height) + margin.top + margin.bottom);
		
		var svgDefs = svg.append('defs');

        var mainGradient = svgDefs.append('linearGradient')
            .attr('id', domName.replace('#', '') + 'mainGradient');

        // Create the stops of the main gradient.
        mainGradient.append('stop')
            .style('stop-color', "#445098")
            .attr('offset', '0');

        mainGradient.append('stop')
            .style('stop-color', "#4661a4")
            .attr('offset', '99%');
		
	
		var g = svg.append("g")
			.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		g.append("g")
			.attr("class", "axis")
			.attr("transform", "translate(0,0)") 						
			.call(d3.axisLeft(y));	

		// axis labels & ticks
		var axisContainer = g.append('g')
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
		
		// bars		
		var barsContainer = g.append('g')
			.selectAll("rect")
			.data(data)
			.enter().append("rect")
			.attr("class", "bar")
			.attr("y", function(d) { return y(d.element); })
			.attr('height', y.bandwidth())
			.attr('width', function(d) { return x(d.count); })
			.attr('stroke', 'white')
			.attr('fill', function(d, i){
				if (colorscale != undefined){
					if (noseq != 1){
						return colorscale[(d.seq-1)];
					} else {
						console.log(colorscale);
						console.log(d);
						return colorscale[i];
					}
				}else{
					return 'url(' + domName +'mainGradient)';
				}
			})
			.on("mouseover", function() { 
				tooltip.style("display", null); 
			})
			.on("mouseout", function() {
				tooltip.style("display", "none");
			})
			.on("mousemove", function(d) {	
				tooltip.selectAll("tspan").remove();
				var xPosition = d3.mouse(this)[0];
		     	var yPosition = d3.mouse(this)[1];
		     	var count2 = d.count;
		     	tooltip.attr("transform", "translate(" + xPosition + "," + yPosition + ")")
		     	.selectAll("text")
		     		.append("tspan")
		     		.text(d.element)
		     		.attr('x', 10)
  					.attr('dy', 13)
		     		.append("tspan")
		     		.text(count2.toLocaleString())
		     		.attr('fill', 'black')
		     		.attr('x', 10)
  					.attr('dy', 20)
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
		
		// bar value labels
		g.append('g').selectAll("text").data(data).enter().append("text")
			.attr("x", function(d) { return x(barValue(d)) + 5; })
			.attr("y", function(d,i) { return (y(d.element)) + ((y.bandwidth()*paddingInside)/4) + (y.bandwidth()/2) ; })
			.attr("class", "secondary")
			.style("text-anchor", "start")
			.style("font-size", "12px")
			.style("fill", "#a5a2a2")
			.text(function(d) { return nFormatter(barValue(d), 2); });
		
		// Tooltip ////// 
		var tooltip = g.append("g")
    		.attr("class", "graph_tooltip")
    		.style("display", "none");
      
  		tooltip.append("rect")
    		.attr("width", function(d){
    			var cal_width = 10 + word_length * 7;
    			var min_width = 80;
    			if (cal_width > min_width){
    				return cal_width;
    			}else{
    				return min_width;
    			}
    		})
    		.attr("height", 40)
    		.attr("fill", "white")
    		.style("opacity", 0.7);

  		tooltip.append("text")
    		.style("text-anchor", "start")
    		.attr("font-size", "12px")
    		.attr("font-weight", "bold");

	}
}
</script>
