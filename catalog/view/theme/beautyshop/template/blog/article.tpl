<?php echo $header; ?>
<div id="content" class="blog-page"><div class="wrapper">
   
   <div class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?>
   </div>
   
   <?php echo $content_top; ?>   
   <?php echo $column_left; ?><?php echo $column_right; ?>
   
    <h1>Blog</h1>
   
   <div id="blogArticle" itemscope itemtype="http://schema.org/Article">
      <div class="articleHeader">
         
         <?php if($image): ?>
         <div class="image">
         	<img src="<?php echo $image; ?>" style="width:100%; height:auto;">
         </div>
         <?php endif; ?>
         
         <div class="product-links">
                <ul>
                	<li><!-- AddThis Button BEGIN -->
          <div class="addthis_default_style"><a class="addthis_button_compact">Share</a></div>
          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
          <!-- AddThis Button END --> </li>
                    <li><a class="send-to-friend">Send To A Friend</a></li>
                    
                </ul>
                
                <div id="send-to-friend">
                <form method="post" action="">
                	<input type="hidden" name="productid" value="<?php echo $product_id; ?>">
                	<table cellpadding="0" cellspacing="0" border="0" width="100%">
                    	<tr>
                        	<td><label>Your Name</label><input type="text" name="name"></td>
                            <td><label>Your Email</label><input type="text" name="email"></td>
                        </tr>
                        <tr>
                        	<td><label>Recipients Email</label><input type="text" name="recipients"></td>
                            <td><label>Captcha</label><img src="index.php?route=information/contact/captcha" alt="" align="top" style="margin-right:10px;" /><input type="text" name="captcha" style="width:115px;"></td>
                        </tr>
                        <tr>
                        	<td colspan="2" style="padding:20px 0px;">
                            	<input type="checkbox" name="personal_message"> Add A Personal Message<br />
                                
                                <textarea name="message" rows="10" style="width:99%; display:none"></textarea>
                            </td>                            
                        </tr>
                        <tr>
                        	<td colspan="2" align="right" style="padding:20px 0px;"><input type="submit" value="Send"></td>
                        </tr>
                    </table>
                </form>    
                </div>
          </div>
         
         
      </div>      
      <div class="articleContent" itemprop="articleBody">
      	
        <?php if ($art_infoName || $art_infoCategory || $art_infoDate || $art_infoComment) { ?>
            <span class="info-date">
               <?php echo $art_infoDate; ?>
            </span>
         <?php }?>
         <h1 itemprop="headline"><?php echo $title; ?></h1>
         
         <a href="<?php echo $link; ?>" itemprop="url" style="display:none" title=""></a>	
      
         <?php echo $description; ?>
      </div>      
      <?php if ($socMedia || $artRelateds || $prodRelateds) { ?>
         <div class="articleBottom">
            
            <?php if ($artRelateds) { ?>
               <div id="articleRelated">
                  <h4><?php echo $text_related; ?></h4>
                  <?php if (count($artRelateds) <= 5) { ?>
                     <ul>
                     <?php foreach ($artRelateds as $artRelated) { ?>
                        <li><a href="<?php echo $this->url->link('blog/article', 'article_id=' . $artRelated['article_id']); ?>"><?php echo $artRelated['title']; ?></a></li>
                     <?php } ?>
                     </ul>
                  <?php } else { ?>
                     <?php for ($i = 0; $i < count($artRelateds);) { ?>
                        <ul>
                        <?php $j = $i + ceil(count($artRelateds) / 2); ?>
                        <?php for (; $i < $j; $i++) { ?>
                           <?php if (isset($artRelateds[$i])) { ?>
                              <li><a href="<?php echo $this->url->link('blog/article', 'article_id=' . $artRelateds[$i]['article_id']); ?>"><?php echo $artRelateds[$i]['title']; ?></a></li>
                           <?php } ?>
                        <?php } ?>
                        </ul>
                     <?php } ?>
                  <?php } ?>
               </div>
            <?php } ?>
            <?php if ($prodRelateds && $relProductRelated) { ?>
               <div id="productRelated">
                  <h4><?php echo $text_related_product; ?></h4>
                  <div class="box-product">
                  <?php foreach ($prodRelateds as $prodRelated) { ?>
                  <?php if ($prodRelated['status']==1) { ?>
                     <div class="relProduct" style="width:<?php echo (100/$prodPerRow)-0.5 . '%';?>">
                        <?php if ($prodRelated['thumb']) { ?>
                           <div class="image"><a href="<?php echo $prodRelated['href']; ?>"><img src="<?php echo $prodRelated['thumb']; ?>" alt="<?php echo $prodRelated['name']; ?>" /></a></div>
                        <?php } ?>
                        <div class="name"><a href="<?php echo $prodRelated['href']; ?>"><?php echo $prodRelated['name']; ?></a></div>
                        <?php if ($prodRelated['price']) { ?>
                           <div class="price">
                              <?php if (!$prodRelated['special']) { ?>
                                 <?php echo $prodRelated['price']; ?>
                              <?php } else { ?>
                                 <span class="price-old"><?php echo $prodRelated['price']; ?></span> <span class="price-new"><?php echo $prodRelated['special']; ?></span>
                              <?php } ?>
                           </div>
                        <?php } ?>
                        <?php if ($prodRelated['rating']) { ?>
                           <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $prodRelated['rating']; ?>.png" alt="<?php echo $prodRelated['reviews']; ?>" /></div>
                        <?php } ?>
                        <div class="cart"><a onclick="addToCart('<?php echo $prodRelated['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>
                     </div>
                  <?php } ?>
                  <?php } ?>
                  </div>
               </div>
            <?php } ?>
         </div>
      <?php } ?>      
      <?php echo $content_bottom; ?>      
      <a name="articleComments"></a>
      <?php if ($commentStatus) { ?>
         <div id="articleComments">
            <h4><?php echo $heading_comment; ?> <span><?php echo $replies; ?></span></h4>
            <div id="comments"></div>            
            <div id="commentRespond">
					<?php if ($guestCommentDisallow) { ?><div class="attention"><?php echo $text_login_comment; ?></div><?php } ?>
					<?php if (!$guestCommentDisallow) { ?>
						
						<div id="commentInput">
							<table>
								<tr>
									<td>
									<?php if ($customerID) { ?>
										<input type="text" name="commentName" value="<?php echo $customerName; ?>" class="inputName" tabindex="1" disabled="disabled" />
									<?php } else { ?>
                                    	<label>Name</label>
										<input type="text" name="commentName" value="" class="inputName" tabindex="1" />
									<?php } ?>										
									</td>
                                    <td>
									<?php if ($customerID) { ?>
										<input type="text" name="commentMail" value="<?php echo $customerMail; ?>" class="inputMail" tabindex="2" disabled="disabled" />
									<?php } else { ?>
                                    	<label>Email</label>
										<input type="text" name="commentMail" value="" class="inputMail" tabindex="2"  />
									<?php } ?>
									</td>
								</tr>
								
								<tr>
									<td colspan="2">
                                    	<label>Comment</label>
										<textarea name="commentContent" cols="50" rows="8" class="inputContent" tabindex="4" ></textarea>
									</td>
								</tr>
								<?php if ($commentCaptha) { ?>
									<tr>
										<td colspan="2" class="captcha">
											<div class="inputCaptcha">
                                                	<img id="captcha"  src="index.php?route=blog/article/captcha" alt="" /> 
													<input type="text" name="commentCaptcha" value="" tabindex="5" style="background-image:" />
											</div>											
                                            <a id="submitComment" class="button"><?php echo $button_submit; ?></a>
										</td>
									</tr>
								<?php } ?>
							</table>
							<input type="hidden" name="comment_parent_id" id="parent_id" value="0" />
						</div>
					<?php } ?>
            </div>
         </div>
      <?php } ?>
   </div></div>
<?php if ($commentStatus) { ?>
<script type="text/javascript"><!--
	$('#commentRespond input[type=text], #commentRespond textarea').each(function()
   {
	   if ($(this).val() != '') $(this).parent().find('label').hide();
    }); 	
	
   $('#commentRespond input[type=text], #commentRespond textarea').bind('keyup', function()
   {
	   if ($(this).val() == '')
	   	$(this).parent().find('label').show();
	   else
		   $(this).parent().find('label').hide();
    }); 	 																					   
   $('#comments').load('index.php?route=blog/article/comment&article_id=<?php echo $article_id; ?>');
   $('#comments .pagination a').live('click', function() {
      $('#articleComments').slideUp(1000).after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /><?php echo $text_wait; ?></div>');
      $('#comments').load(this.href);
      setTimeout(function(){
         $('.attention').remove();
         $('#articleComments').slideDown(2000)
      },2500);
      return false;
   });	
	<?php if (!$guestCommentDisallow) { ?>
		$('#submitComment').bind('click', function() {
			$.ajax({
				type: 'POST',
				url: 'index.php?route=blog/article/write&article_id=<?php echo $article_id; ?>',
				dataType: 'json',
				data: 'name=' + encodeURIComponent($('input[name=\'commentName\']').val()) + '&email=' + encodeURIComponent($('input[name=\'commentMail\']').val()) + '&website=' + encodeURIComponent($('input[name=\'commentSite\']').val()) + '&content=' + encodeURIComponent($('textarea[name=\'commentContent\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'commentCaptcha\']').val()) + '&customer_id=' + encodeURIComponent($('input[name=\'customer_id\']').val()) + '&parent_id=' + encodeURIComponent($('input[name=\'comment_parent_id\']').val()),
				beforeSend: function() {
					$('.success, .warning, .error').remove();
					$('#submitComment').attr('disabled', true);
					$('#commentInput').before('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /><?php echo $text_wait; ?></div>');
				},
				complete: function() {
					$('#submitComment').attr('disabled', false);
					$('.attention').remove();
				},
				success: function(json) {
					if (json['error']) {					 
						$('#commentInput').before('<div class="warning">' + json['error']['common'] + '</div>');						
						if (json['error']['name']) {
							$('.inputName').after('<span class="error">' + json['error']['name'] + '</span>');
						}
						if (json['error']['email']) {
							$('.inputMail').after('<span class="error">' + json['error']['email'] + '</span>');
						}
						if (json['error']['content']) {
							$('.inputContent').after('<span class="error">' + json['error']['content'] + '</span>');
						}
						if (json['error']['captcha']) {
							$('.inputCaptcha input').after('<span class="error">' + json['error']['captcha'] + '</span>');
								d = new Date();
						$("#captcha").attr("src", "index.php?route=blog/article/captcha/?"+d.getTime());
					
						}
					}					
					if (json['success']) {
						<?php if (!$customerID) { ?>
							$('input[name=\'commentName\']').val('');
							$('input[name=\'commentMail\']').val('');
						<?php } ?>
						$('input[name=\'commentSite\']').val('');
						$('textarea[name=\'commentContent\']').val('');
						$('input[name=\'commentCaptcha\']').val('');					
						$('#commentInput').before('<div class="success">' + json['success'] + '</div>');
						setTimeout(function(){
							$('.success').fadeOut(300).delay(450).remove();
							<?php if ($autoApprove) { ?>
								$('#cancelCommentReply').trigger('click');
								$('#comments').delay(1000).load('index.php?route=blog/article/comment&article_id=<?php echo $article_id; ?>');
							<?php } ?>
						},2500);
					d = new Date();
						$("#captcha").attr("src", "index.php?route=blog/article/captcha/?"+d.getTime());					
					}
				}
			});
		});		
		addComment={
			moveForm:
			function(d,f,i){
				document.getElementById(i).style.display="block";
				var m=this,
				a,
				h=m.I(d),
				b=m.I(i),
				l=m.I("cancelCommentReply"),
				j=m.I("parent_id");				
				if(!h||!b||!l||!j){
					return
				}
				m.respondId=i;
				if(!m.I("tempCommentRespond")){
					a=document.createElement("div");
					a.id="tempCommentRespond";
					a.style.display="none";
					b.parentNode.insertBefore(a,b)
				}
				h.parentNode.insertBefore(b,h.nextSibling);
				j.value=f;
				l.style.display="";
				l.onclick=function(){
					var n=addComment,e=n.I("tempCommentRespond"),o=n.I(n.respondId);
					document.getElementById(i).style.display="";
					if(!e||!o){
						return
					}
					n.I("parent_id").value="0";
					e.parentNode.insertBefore(o,e);
					e.parentNode.removeChild(e);
					this.style.display="none";
					this.onclick=null;
					return false
				};
				try{
					m.I("comment").focus()
				}
				catch(g){}
				return false
			}
			,I:function(a){
				return document.getElementById(a)
			}
		};
	<?php } ?>	
   //--></script>
<?php } ?>
</div>

<script language="javascript1.1">
var send_to_friend_status = 'close';
$('#send-to-friend input[type=checkbox]').bind('change', function()
{
	if ($(this).is(':checked'))
	{
		$('#send-to-friend textarea[name=message]').show();		
	}
	else
	{
		$('#send-to-friend textarea[name=message]').hide();		
	}
});	
$('.send-to-friend').bind('click', function()
{
	if (send_to_friend_status == 'close')
	{
		$(this).parent().attr('class', 'active');
		send_to_friend_status = 'open';
		$('#send-to-friend').show();
	}
	else
	{
		send_to_friend_status = 'close';
		$(this).parent().removeAttr('class');
		$('#send-to-friend').hide();
	}
});	
$('#send-to-friend input[type=submit]').bind('click', function()
{
	var params = $('#send-to-friend form').serialize();
	$('#send-to-friend span.error').remove();
	$(this).after('<img id="loading" src="/newstore/catalog/view/theme/default/image/loading.gif">');
	$.ajax(
	{
		url: '/newstore/index.php?route=product/product/tellafriend',
		data: params,
		type: 'post',
		dataType: 'json',
		success: function(data)
		{
			$('#loading').remove();
			
			if (data.success)
			{
				alert(data.success);
				send_to_friend_status = 'close';
				$('.send-to-friend').parent().removeAttr('class');
				$('#send-to-friend').hide();
			}
			
			if (data.error_name)
			{
				$('input[name=name]').after('<span class="error">' + data.error_name + '</span>');
			}
			
			if (data.error_email)
			{
				$('input[name=email]').after('<span class="error">' + data.error_email + '</span>');
			}
			
			if (data.error_recipients)
			{
				$('input[name=recipients]').after('<span class="error">' + data.error_recipients + '</span>');
			}
			
			if (data.error_captcha)
			{
				$('input[name=captcha]').after('<span class="error">' + data.error_captcha + '</span>');
			}
		}
	});
	return false;
});		

</script>


<?php echo $footer; ?> 