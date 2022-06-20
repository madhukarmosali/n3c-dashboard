<!DOCTYPE html>
<meta charset="utf-8">
<!-- /* Code adapted from https://bost.ocks.org/mike/hive/ 's simple example- for use with d3v4' */ -->

<style>

	.axis {
	  stroke: #000;
	  stroke-width: 1.5px;
	}

	.link {
	  fill: none;
	  stroke-width: 1.5px;
	}
	
	.link.active {
	  stroke: red;
	  stroke-width: 5px;
	  stroke-opacity: 1;
	}
	
	.node {
	  stroke: #000;
	  stroke-width: 1.5px;
	}

	.node.active {
	  stroke: red;
	  stroke-width: 3px;
	}
div.tooltip {
    position: absolute;
    background-color: white;
    max-width; 200px;
    height: auto;
    padding: 1px;
    border-style: solid;
    border-radius: 4px;
    border-width: 1px;
    box-shadow: 3px 3px 10px rgba(0, 0, 0, .5);
    pointer-events: none;
  }
</style>
<body>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="../resources/d3.hive.min.js"></script>
<script>
d3.json("../feeds/hive_data.jsp", function(error, data) {	
	if (error) throw error;
	console.log(data)

	var tooltip = d3.select("body")
		.append("div")
		.attr("class", "tooltip")
		.style("opacity", 0);

	var width = window.innerWidth,
	  height = window.innerHeight,
	  innerRadius = 40,
	  outerRadius = 400;
	var word_length = 50;
	
	var nodes = data.nodes;
	var node_map = d3.map(nodes, d => d.mapping);
	console.log("nodes", nodes);
	console.log("map", node_map.get("0-1"));
	
	var links = data.edges;
	
	var nodeScale = d3.scaleLinear()
	 .domain([0, d3.max(nodes, function(d) { return d.weight; })])
	 .range([2, 15]);
	
	var linkScale = d3.scaleLinear()
	 .domain([0, d3.max(links, function(d) { return d.weight; })])
	 .range([0.15, 1]);
	
	var groupings = d3.max(nodes, function(d) { return d.x; }) + 1; ///number of groups
	
	var angle = d3
	  .scalePoint()
	  .domain(d3.range(groupings + 1))
	  .range([0, 2 * Math.PI]),
	  radius = d3.scaleLinear().range([innerRadius, outerRadius]),
	  color = d3.scaleOrdinal(d3.schemeCategory10).domain(d3.range(20));
	
	var svg = d3
	  .select("body")
	  .append("svg")
	  .attr("width", width)
	  .attr("height", height)
	  .append("g")
	  .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
	
	svg
	  .selectAll(".axis")
	  .data(d3.range(groupings))
	  .enter()
	  .append("line")
	  .attr("class", "axis")
	  .attr("transform", function(d) {
	    return "rotate(" + degrees(angle(d)) + ")";
	  })
	  .attr("x1", radius.range()[0])
	  .attr("x2", radius.range()[1]);
	
	svg
	  .selectAll(".link")
	  .data(links)
	  .enter()
	  .append("path")
	  .attr("class", "link")
	  .attr(
	    "d",
	    d3.hive
	      .link()
	      .angle(function(d) {
	        return angle(node_map.get(d).x);
	      })
	      .radius(function(d) {
	        return radius(node_map.get(d).y);
	      })
	  )
	  .on("mouseover", linkMouseover)
	  .on("mouseout", mouseout)
	  .style("stroke", function(d) {
	    return color(node_map.get(d.source).x);
	  })
	  .style("stroke-opacity", function(d) {
		  return linkScale(d.weight);
	  });
	

	svg
	  .selectAll(".node")
	  .data(nodes)
	  .enter()
	  .append("circle")
	  .attr("class", "node")
	  .on("mouseover", nodeMouseover)
	  .on("mouseout", mouseout)
	  .attr("transform", function(d) {
	    return "rotate(" + degrees(angle(d.x)) + ")";
	  })
	  .attr("cx", function(d) {
	    return radius(d.y);
	  })
	  .attr("r", function(d) {
		  return nodeScale(d.weight);
	  })
	  .style("fill", function(d) {
	    return color(d.x);
	  })
			.on('mouseover.tooltip', function(d) {console.log(d)
      			tooltip.transition()
        			.duration(300)
        			.style("opacity", .8);
      			tooltip.html("<p>x</p>")
        			.style("left", (d3.event.pageX) + "px")
        			.style("top", (d3.event.pageY + 10) + "px");
    			})
    		.on("mouseout.tooltip", function() {
        		tooltip.transition()
	        		.duration(100)
	        		.style("opacity", 0);
	    		})
		;	
	
	var legend_text = svg
	.selectAll("labels")
	  .data(d3.range(groupings))
	  .enter()
	.append("g")
	.attr("transform", function(d) {
	    return "rotate(" + degrees(angle(d)) + ") translate(" + radius(1.15) + ",0)";
	  })
	  .attr("x1", radius.range()[0])
	  .attr("x2", radius.range()[1])
	.attr("font-family", "sans-serif")
	.attr("font-size", '24px')
	.attr("font-weight", "bold")
	.attr("text-anchor", "middle")
	.append("text")
	.attr("transform", function(d) {
	    return "rotate(" + -degrees(angle(d)) + ")";
	  })
	.text(function(d) { return data.axes[d]});

	function degrees(radians) {
	  return radians / Math.PI * 180 - 90;
	}

	  // Highlight the link and connected nodes on mouseover.
	  function linkMouseover(d) {
	    svg.selectAll(".link").classed("active", function(p) {
	      return p === d;
	    });
	    svg.selectAll(".node").classed("active", function(p) {
	      return p.mapping === d.source || p.mapping === d.target;
	    });
	  }

	  // Highlight the node and connected links on mouseover.
	  function nodeMouseover(d) {
	    svg.selectAll(".link").classed("active", function(p) {
	      return p.source === d.mapping || p.target === d.mapping;
	    });
	    d3.select(this).classed("active", true);
	  }

	  // Clear any highlighted nodes or links.
	  function mouseout() {
	    svg.selectAll(".active").classed("active", false);
	  }

	  // Tooltip ////// 
		var tooltip = svg.append("g")
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
});
</script>
