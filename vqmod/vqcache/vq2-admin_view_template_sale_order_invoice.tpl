<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link type="text/css" rel="stylesheet" href="http<?php echo ($_SERVER['SERVER_PORT'] == 443) ? 's' : '' ?>://fast.fonts.com/cssapi/7b44fde6-ddb7-482a-b008-2333622810ac.css"/>
<link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />
<style>
.logo
{
	width:400px;
	margin:0 auto 30px;
	font-family:'CopperplateGothicLTW01- 706025';
	color:#000;
	font-size:18px;
	text-align:center;
}
.billing
{
	margin:0px 0px 20px;
}
.billing span
{
	display:inline-block;
	width:100px;
}
td
{
	line-height:18px;
}

.product-data thead td
{
	padding:7px 0px 0px;
	font-size:12px;
	color:#000;
}

.product-data tbody td
{
	font-size:12px;
	vertical-align:top;
}

.social a
{
	border:none;	
}

.mail
{
	color:#000;
}
</style>
</head>
<body>
<?php $iteration=1;
			foreach ($orders as $order) { 
			if ($iteration < count($orders)){?>
<div style="page-break-after: always;">
<?php }else{?>
<div>
<?php }?>
<?php $iteration++;?>

<div style="width: 680px; margin:40px auto;">
  <div class="logo"><img src="<?php echo $logo; ?>" /></div>
  
  <table width="100%" style="border-bottom:solid 1px #000; padding:0px 0px 10px;">
  	<tr>
    	<td>
        	Receipt Number: #<?php echo (int)$order['order_id'] > 10000 ? $order['order_id'] : ((int)$order['order_id'] + 10000); ?><br />
            Date: <?php echo $order['date_added']; ?><br />
            Order Status: <?php echo $order['order_status']; ?><br />
            Payment Method: <?php echo $order['payment_method']; ?><br />
            Delivery Method: <?php echo $order['shipping_method']; ?><br />
        </td>
        <td align="right">
        	891 Robinson Drive, Suite 1<br />
			North Salt Lake, UT 84054<br />
			United States<br />
			Customer Care: 800.558.5449<br />
			<a class="mail" href="mailto:customercare@parkaccessories.com">customercare@parkaccessories.com</a>
        </td>
    </tr>
  </table>
  
  <table width="100%" cellpadding="0" cellspacing="0">
  	<tr>
    	<td style="padding:20px 0px;">Customer eMail: <a class="mail" href="mailto:<?php echo $order['email']; ?>"><?php echo $order['email']; ?></a></td>
     </tr>
  </table>
  
  <table width="100%" class="billing">
  	<thead>
	  	<tr>
    		<td>
        		BILLING ADDRESS	
	        </td>
    	    <td width="40%">
            	SHIPPING ADDRESS
        	</td>
	    </tr>
    </thead>    
    <tbody>
    	<tr>
        	<td>
            	<?php echo $order['payment_address']; ?>
            </td>
            <td>
            	<?php echo $order['shipping_address']; ?>
            </td>
        </tr>
    </tbody>
  </table>
  
  
  
  <table width="100%" class="product-data">
    <thead>
      <tr>
        <td>PRODUCT</td>
        <td>STYLE</td>        
        <td>SKU</td>
        <td align="right">QUANTITY</td>
        <td align="right">UNIT PRICE</td>
        <td align="right">EXT PRICE</td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($order['product'] as $product) { ?>
      <tr>
        <td><?php echo $product['name']; ?>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
          <?php } ?></td>
        <td><?php echo $product['model']; ?></td>
        <td><?php echo $product['sku']; ?></td>
        <td align="right"><?php echo $product['quantity']; ?></td>
        <td align="right"><?php echo $product['price']; ?></td>
        <td align="right"><?php echo $product['total']; ?></td>
      </tr>
      <?php } ?>
      <?php foreach ($order['voucher'] as $voucher) { ?>
      <tr>
        <td style="font-size: 12px;	text-align: left; padding: 7px;"><?php echo $voucher['description']; ?></td>
        <td style="font-size: 12px;	text-align: left; padding: 7px;"></td>
        <td style="font-size: 12px;	text-align: right; padding: 7px;">1</td>
        <td style="font-size: 12px;	text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
        <td style="font-size: 12px;	text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($order['total'] as $total) { ?>
      <tr>
        <td style="font-size: 12px;	text-align: right; vertical-align:top; text-transform:uppercase" colspan="5"><?php echo $total['title']; ?>:</td>
        <td style="font-size: 12px;	text-align: right; vertical-align:top;"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>
  
  <?php if ($order['comment']) { ?>
  <table style="border-collapse: collapse; width: 100%; margin-bottom: 20px;">
    <thead>
      <tr>
        <td style="font-size: 12px; text-align: left;  color: #000000;">ORDER NOTES:</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="font-size: 12px;	text-align: left;"><?php echo $order['comment']; ?></td>
      </tr>
    </tbody>
  </table>
  <?php } ?>
  <table width="200px" class="social" align="center">
  
  	<tr>
    	<td colspan="5" style="padding:90px 0px 0px;">&nbsp;</td>
    </tr>
  
  	<tr>
    
    	<td align="center" colspan="5"> Thank you for your purchase.</td>
    
    </tr>
    
    <tr>    
    	<td align="center" style="padding:20px 15px; text-align:center;"><a href="https://www.facebook.com/parkaccessories"><img src="<?php echo HTTP_SERVER; ?>view/image/facebook.jpg"></a></td>
        <td align="center" style="padding:20px 15px; text-align:center;"><a href="https://twitter.com/parkaccessories"><img src="<?php echo HTTP_SERVER; ?>view/image/twitter.jpg"></a></td>
        <td align="center" style="padding:20px 15px; text-align:center;"><a href="http://pinterest.com/parkaccessories/"><img src="<?php echo HTTP_SERVER; ?>view/image/pinterest.jpg"></a></td>
        <td align="center" style="padding:20px 15px; text-align:center;"><a href="http://instagram.com/amopark#"><img src="<?php echo HTTP_SERVER; ?>view/image/instagram.jpg"></a></td>    
    </tr>
  
  </table>
  
 
  
  
</div>  
</div>
<?php } ?>
</body>
</html>