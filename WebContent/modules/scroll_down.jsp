<div id="scroll_down_arrow">
	<i class="fas fa-angle-double-down"></i>
</div>


<script>
$(window).scroll(function() {
	   if($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
		   $( "#scroll_down_arrow" ).addClass("display-none");
	   }
});
</script>