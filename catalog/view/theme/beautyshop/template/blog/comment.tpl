<?php if ($comments) { ?>
   <?php $class = 'odd'; ?>
   <ul class="commentList">
   <?php foreach ($comments as $comment) { ?>
      <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
      <li class="<?php echo $class; ?>">
         <div id="comment-<?php echo $comment['comment_id'];?>" itemprop="comment" itemscope itemtype="http://schema.org/UserComments">
            <?php echo $comment['avatar']; ?>            
            <div class="name">
               <?php echo $comment['name'];?>
            </div>
            <p class="commentText" itemprop="commentText"><?php echo $comment['content']; ?><span class="quote-end"></span></p>            
				
         </div>         
         <?php if ($comment['replyComments']) { ?>
            <?php $class2 = 'odd'; ?>
            <ul class="commentList replyComment">
            <?php foreach ($comment['replyComments'] as $replyComment) { ?>
               <?php $class2 = ($class2 == 'even' ? 'odd' : 'even'); ?>
               <li class="<?php echo $class2; ?>">
                  <?php echo $replyComment['avatar']; ?>
                  <div class="name">
                     <?php if($replyComment['website']) { echo '<a href="'.$replyComment['website'].'">'.$replyComment['name'].'</a>'; } else { echo $replyComment['name']; }?>
                  </div>
                  <div class="created">
                     <?php if ($replyComment['badge']) { ?>
                        <span class="badge" style="background-color:#<?php echo $replyComment['badgeColor']; ?>">
                           <?php echo $replyComment['badge']; ?>
                        </span>
                     <?php } ?>
                     <?php echo $replyComment['created']; ?>
                  </div>
                  <p><?php echo $replyComment['content']; ?></p>
               </li>
            <?php } ?>
            </ul>
         <?php } ?>         
      </li>
   <?php } ?>
   </ul>

<?php } ?>