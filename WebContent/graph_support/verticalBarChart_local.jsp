<script>

function localVerticalBarChart(data, domName, barLabelWidth) {
	var barLabel = function(d) { return d.element; };
	var barValue = function(d) { return parseFloat(d.count); };

		var valueLabelWidth = 50; // space reserved for value labels (right)
		var barHeight = 20; // height of one bar
		var barLabelWidth = 10; // space reserved for bar labels
		var barLabelPadding = 5; // padding between bar and bar labels (left)
		var gridLabelHeight = 10; // space reserved for gridline labels
		var gridChartOffset = 3; // space between start of grid and first bar
		var maxBarWidth = 280; // width of the bar with the max value

		data.forEach(function(node) {
			barLabelWidth = Math.max(barLabelWidth,node.element.length * 8);
		    //console.log(node.element + "  " + node.element.length*7. );
		});
		
		var myObserver = new ResizeObserver(entries => {
			entries.forEach(entry => {
				var newWidth = Math.floor(entry.contentRect.width);
				if (newWidth > 0) {
					d3.select(domName).select("svg").remove();
					//console.log('${param.dom_element} width '+newWidth);
					maxBarWidth = newWidth;
					draw();
				}
			});
		});
		myObserver.observe(d3.select(domName).node());

		draw();

		function draw() {
			// set the dimensions and margins of the graph
			var margin = {top: 20, right: 20, bottom: 30, left: 60},
			    width = maxBarWidth - margin.left - margin.right,
			    height = 500 - margin.top - margin.bottom;

			// set the ranges
			var x = d3.scaleBand()
			          .range([0, width])
			          .padding(0.1);
			var y = d3.scaleLinear()
			          .range([height, 0]);
			          
			// append the svg object to the body of the page
			// append a 'group' element to 'svg'
			// moves the 'group' element to the top left margin
			var svg = d3.select(domName).append("svg")
			    .attr("width", width + margin.left + margin.right)
			    .attr("height", height + margin.top + margin.bottom)
			  .append("g")
			    .attr("transform", 
			          "translate(" + margin.left + "," + margin.top + ")");

			  // Scale the range of the data in the domains
			  x.domain(data.map(function(d) { return d.element; }));
			  y.domain([0, d3.max(data, function(d) { return d.count; })]);

			  // append the rectangles for the bar chart
			  svg.selectAll(".bar")
			      .data(data)
			    .enter().append("rect")
			      .attr("class", "bar")
			      .attr('fill', '#376076')
			      .attr("x", function(d) { return x(d.element); })
			      .attr("width", x.bandwidth())
			      .attr("y", function(d) { return y(d.count); })
			      .attr("height", function(d) { return height - y(d.count); });

			  // add the x Axis
			  svg.append("g")
			      .attr("transform", "translate(0," + height + ")")
			      .call(d3.axisBottom(x));

			  // add the y Axis
			  svg.append("g")
			      .call(d3.axisLeft(y));

		}
}
</script>
