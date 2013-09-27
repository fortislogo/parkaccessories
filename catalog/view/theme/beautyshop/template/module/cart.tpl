<a href="<?php echo HTTP_SERVER; ?>?route=checkout/cart">Bag</a> <a><span id="cart-total" class="cart-total"><?php echo $text_items; ?></span></a>
<div id="cart">   
   <div class="content">
    <?php if ($products || $vouchers) { ?>
    <h2>In Your Cart</h2>
    <div class="mini-cart-info">
      <table>
      	<thead>
        	<tr>
            	<th colspan="2">Item</th>
                <th>Price</th>
                <th>Qty</th>
            </tr>
        </thead>
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image">
          	<?php if ($product['thumb']) { ?>
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
            <?php } ?>
          </td>  
          <td nowrap="nowrap">
          	<a href="<?php echo $product['href']; ?>" class="name"><?php echo $product['name']; ?></a>
              <?php foreach ($product['option'] as $option) { ?>
              <br />- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
              <?php } ?>
          </td>
          <td class="total" nowrap="nowrap"><?php echo $product['total']; ?></td>
          <td class="quantity" nowrap="nowrap">
          	<input type="text" name="qty[<?php echo $product['quantity']; ?>]" size="2" value="<?php echo $product['quantity']; ?>" />
            <a class="update-button">Update</a>
            <!-- <img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" /> -->
          </td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="image"></td>
          <td class="name"><?php echo $voucher['description']; ?></td>
          <td class="quantity">x&nbsp;1</td>
          <td class="total"><?php echo $voucher['amount']; ?></td>
          <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
        </tr>
        <?php } ?>
      </table>      
    </div>
    <!--<div class="mini-cart-total">
      <table>
        <?php foreach ($totals as $total) { ?>
        <tr>
          <td class="right"><b><?php echo $total['title']; ?>:</b></td>
          <td class="right"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </table>
    </div> -->
    <div class="checkout"><a href="/" class="continue-button">Continue Shopping</a>  <a class="checkout-button" href="<?php echo $cart; ?>"><?php echo $text_checkout; ?></a></div>
    <?php } else { ?>
    <div class="empty"><?php echo $text_empty; ?></div>
    <?php } ?>
  </div>
</div>
<script language="javascript1.1">
$(document).ready(function()
{
	$('#cart > .content').show("slow");
	$('#cart > .content a.update-button').bind('click', function()
	{
		$(this).html('Please wait...');
	});										   
});						   
</script>