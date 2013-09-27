<?php if ($banners): ?>
<div class="top-banners">
<?php foreach($banners as $banner): ?>
<div>
<?php if ($banner['link']): ?>
<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>"></a>
<?php else: ?>
<img src="<?php echo $banner['image']; ?>">
<?php endif; ?>
<div class="title"><?php echo $banner['title']; ?></div>
</div>
<?php endforeach; ?>
</div>
<?php endif; ?>