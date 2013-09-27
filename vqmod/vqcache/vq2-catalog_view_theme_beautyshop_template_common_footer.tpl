</div>
<div id="footer-container">
 
<div id="footer">
	
    <div class="links">
        <a href="/contact-us">Customer Service</a>
        <a href="/press">Press</a>
    	<a href="/our-story">Our Story</a>
        <a href="/wholesale">Wholesale</a>
        <a href="/contact-us">Contact Us</a>
        
        	<a href="https://www.facebook.com/parkaccessories" class="social facebook"></a>
            <a href="https://twitter.com/parkaccessories" class="social twitter"></a>
            <a href="http://pinterest.com/parkaccessories/" class="social pinterest"></a>
            <a href="http://instagram.com/amopark#" class="social instagram"></a>
        
    </div>
    
    <div class="copyright">Copyright &copy; <?php echo date("Y"); ?>, PARK Luxury Sporting Accessories  530 Seventh Avenue Floor M1 New York NY. 10018 <a class="sizzle" href="http://www.sizzlefactor.com" target="_blank"></a></div>
  
  
</div>


</div>

</div>

<!--BOF Product Color Option-->
			<style>
			.product-color-options span
			{
				display:inline-block;
				width:12px;
				height:12px;
				margin-right:0px;
				border:1px solid lightgrey;
			}

			.image .product-color-options
			{
				display: none;
			}
			
			a.color-option {
				display:inline-block;
				width:15px;
				height:15px;
				margin:3px;
				padding: 0;
				border:1px solid lightgrey;
				vertical-align: bottom;
				cursor: pointer;
			}
			
			a.color-option.color-active, a.color-option:hover {
				margin: 0;
				padding: 3px;
			}
			.hidden {
				display: none;
			}
			</style>
			<script type="text/javascript"><!--
			
			
			$(".colors .arrow").click(function()
			{
				$(".colors ul").show();
			});
			$("li.color-option").click(function(event)
			{
				$this = $(this);
				
				var color = $this.css('background-color');
				
				//$this.parent().find('a.color-option').removeClass('color-active');
				//$this.addClass('color-active');
				
				$this.parent().parent().find('select').val($this.attr('option-value'));
				
				$('#' + $this.attr('option-text-id')).html($this.attr('title'));
				
				change_color(color,$this.attr('title'));
				$(".colors ul").hide();
				
				//option redux
				if(typeof updatePx == 'function') {
					updatePx();
				}
				
				//option boost
				if(typeof obUpdate == 'function') {
					obUpdate($($this.parent().find('select option:selected')), useSwatch);
				}
				event.preventDefault();
			});
			
			function change_color(color, textColor)
			{
				$('.colors .selected .color').css('background-color', color);
				if ($('#selected-color')) 
				{
					$('#selected-color').html('SELECTED: ' + textColor.toUpperCase());
					$('.optionChoice').trigger('change');
				}	
			}
			//--></script> 
			<!--EOF Product Color Option-->
</body></html>