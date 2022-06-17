<script>

function localHorizontalBarChart(data, domName, barLabelWidth) {
	var valueLabelWidth = 50; // space reserved for value labels (right)
	var barHeight = 50; // height of one bar
	var barLabelPadding = 5; // padding between bar and bar labels (left)
	var gridLabelHeight = 0; // space reserved for gridline labels
	var gridChartOffset = 3; // space between start of grid and first bar
	var maxBarWidth = 280; // width of the bar with the max value
	var min_height = 300;
	var paddingInside = 0.5
	
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
			.attr('fill', '#205F88');
		
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
	}
}
</script>
