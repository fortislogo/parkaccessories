
		<div class="box">
			<div class="box-content followme">
            
            		<?php if($instagram) { ?>
                    
                    	<p>Instagram</p>
                        
                        <?php if ($instagram_image): ?>
                        
                        <img src="<?php echo $instagram_image; ?>">
                        
                        <?php endif; ?>
				
						<a href="http://www.instagram.com/<?php echo $instagram_url; ?>" title="Follow <?php echo $store; ?> on instagram" target="_blank" class="instagram">Follow Us</a>
                        
                        
					<?php } ?>
				
					<?php if($face) { ?>
                    
                    	<p>Facebook</p>
                        
                        <?php if ($facebook_image): ?>
                        
                        <img src="<?php echo $facebook_image; ?>">
                        
                        <?php endif; ?>
				
						<a href="http://www.facebook.com/<?php echo $facebook_url; ?>" title="Follow <?php echo $store; ?> on facebook" target="_blank" class="facebook">Follow Us</a>
				
					<?php } ?>
					
                    
					<?php if($pin) { ?>
                    
                    	<p>Pinterest</p>
                        
                        <?php if ($pinterest_image): ?>
                        
                        <img src="<?php echo $pinterest_image; ?>">
                        
                        <?php endif; ?>
				
						<a href="http://pinterest.com/<?php echo $pinterest_url; ?>" title="Follow <?php echo $store; ?> on pinterest" target="_blank" class="pinterest">Follow Us</a>
                        
                        
				
					<?php } ?>
					
                    
				
			</div>
		</div>
			

