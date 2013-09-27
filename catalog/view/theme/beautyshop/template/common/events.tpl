<?php if ($events): ?>
<div class="events">

<div class="sbHolder">
	<a class="sbToggle"></a>
    <a class="sbSelector"><?php echo $events['event_name']; ?></a>
    <ul class="sbOptions">
    	<li><?php echo html_entity_decode($events['description']); ?></li>
    </ul>
</div>

</div>

<script language="javascript1.1">
$(document).ready(function()
{
	$('.events ul').hide();
	
	var events = 0;
	
	$('.events .sbToggle, .events .sbSelector').bind('click', function()
	{
		if (events == 0)
		{
			$('.events ul').show();
			events = 1;
		}
		else
		{
			$('.events ul').hide();
			events = 0;
		}
	});																   
});						   
</script>

<?php endif; ?>
