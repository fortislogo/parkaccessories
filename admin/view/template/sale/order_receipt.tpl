<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $title; ?></title>
<style type="text/css">
<!--
BODY {
    FONT-FAMILY: Verdana, Arial, Helvetica, Sans-serif;
    FONT-SIZE: 11px;
    MARGIN: 10px;
    PADDING: 10px;
}
-->
</style>
</head>
<body>

<table cellspacing="0" cellpadding="0"  style="width:600px; background-color: #ffffff;" summary="Order details">
  <tr>
    <td>

      <table cellspacing="0" cellpadding="0"  style="width: 100%; border: none;" summary="Summary">
        <tr>
          <td style="vertical-align: top; padding-top: 30px;">
            <a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a>
          </td>

          <td style="width: 100%; padding-left: 30px;">

            <table cellspacing="0" cellpadding="2" width="100%" summary="Details">
              <tr>
                <td valign="top">
                  <strong  style="font-size: 28px; text-transform: uppercase;">Receipt</strong>
                  <br />
                  <br />
                  <strong>Date:</strong> <?php echo $date_added; ?><br />
                  <strong>Order id:</strong> <?php echo $order_id; ?><br />
                  <strong>Order status:</strong> <?php echo $order_status; ?> <br />
                  <strong>Payment method:</strong><br />
                  <?php echo $payment_method; ?>
                </td>
                <td valign="bottom" align="right">
                  <strong><?php echo $store_name; ?></strong><br />
                  <?php echo $store_address; ?><br />
                  
                                      CALL US: <?php echo $store_phone; ?><br />
                                                                          Fax: <?php echo $store_fax; ?><br />
                                                        Email: <?php echo $store_name; ?> <<?php echo $store_email; ?>><br />
                                                    </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <hr  style="border: 0px none; border-bottom: 2px solid #58595b; margin: 2px 0px 17px 0px; padding: 0px; height: 0px;"/>

      <table cellspacing="0" cellpadding="0" style="width:45%; border: 0px none; margin-bottom: 15px;" summary="Address">
        
        <tr>
          <td><strong>Email:</strong></td>
          <td><?php echo $email; ?></td>
        </tr>

        
        
        
        
        
        
                                  <tr style="display: none;"><td colspan="2">&nbsp;</td></tr>
      </table>

    	<table cellspacing="0" cellpadding="0" style="width: 100%; border: 0px none; margin-bottom: 30px;" summary="Addresses">
      	<tr>
      		<td style="width:45%; height: 25px;"><strong>Billing address</strong></td>
          <td width="10%">&nbsp;</td>
          <td style="width: 45%; height: 25px;"><strong>Shipping address</strong></td>
      	</tr>
      	<tr>
      		<td height="4"><img src="/skin/common_files/images/spacer.gif" style="height: 2px; width: 100%; background: #58595b none;max-height: 2px;" alt="" /></td>
          <td><img height="2" src="/skin/common_files/images/spacer.gif" width="1" alt="" /></td>
          <td height="4"><img src="/skin/common_files/images/spacer.gif" style="height: 2px; width: 100%; background: #58595b none;max-height: 2px;" alt="" /></td>
        </tr>
        <tr>
          <td>

            <table cellspacing="0" cellpadding="0" style="width: 100%; border: none;" summary="Billing address">

              
                              <tr>
                  <td><strong>First name:</strong> </td>
                  <td><?php echo $payment_firstname; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Last name:</strong> </td>
                  <td><?php echo $payment_lastname; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Address:</strong> </td>
                  <td><?php echo $payment_address_1; ?><br /><?php echo $payment_address_2; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>City:</strong> </td>
                  <td><?php echo $payment_city; ?></td>
                </tr>
              
              
                              <tr>
                  <td><strong>State:</strong> </td>
                  <td><?php echo $payment_zone; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Country:</strong> </td>
                  <td><?php echo $payment_country; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Zip/Postal code:</strong> </td>
                  <td><?php echo $payment_postcode; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Phone:</strong> </td>
                  <td><?php echo $payment_phone; ?></td>
                </tr>
              
              
                                            
            </table>

          </td>
           <td>&nbsp;</td>
           <td>

            <table cellspacing="0" cellpadding="0" width="100%" border="0" summary="Shipping address">

              
                              <tr>
                  <td><strong>First name:</strong> </td>
                  <td><?php echo $shipping_firstname; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Last name:</strong> </td>
                  <td><?php echo $shipping_lastname; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Address:</strong> </td>
                  <td><?php echo $shipping_address_1; ?><br /><?php echo $shipping_address_2; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>City:</strong> </td>
                  <td><?php echo $shipping_city; ?></td>
                </tr>
              
              
                              <tr>
                  <td><strong>State:</strong> </td>
                  <td><?php echo $shipping_zone; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Country:</strong> </td>
                  <td><?php echo $shipping_country; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Zip/Postal code:</strong> </td>
                  <td><?php echo $shipping_postcode; ?></td>
                </tr>
              
                              <tr>
                  <td><strong>Phone:</strong> </td>
                  <td><?php echo $shipping_phone; ?></td>
                </tr>
              
              
                                            
            </table>
          </td>
        </tr>

                                  
        
        
        
      </table>

      <p style="font-size: 14px; font-weight: bold; text-align: center">Products ordered</p>

<table cellspacing="0" cellpadding="3" width="100%" border="1" summary="Products">

  <tr>
    <th width="60" bgcolor="#cccccc">SKU</th>
    <th bgcolor="#cccccc">Product</th>
        <th nowrap="nowrap" width="100" bgcolor="#cccccc" align="center">Item price</th>
    <th width="60" bgcolor="#cccccc">Quantity</th>
    <th width="60" bgcolor="#cccccc">Total</th>
  </tr>
  
  <?php foreach ($products as $product) { ?>

	<tr>
      <td align="center"><?php echo $product['model']; ?></td>
      
      <td><span style="font-size: 11px;"><?php echo $product['name']; ?></span></td>
      <td align="right" nowrap="nowrap"><span class="currency"><?php echo $product['price']; ?></span>&nbsp;&nbsp;</td>
       <td align="center"><?php echo $product['quantity']; ?></td>
      <td align="right" nowrap="nowrap" style="padding-right: 5px;">
        
        <span class="currency"><?php echo $product['total']; ?></span>
      </td>
	
  
   <?php } ?>
  
</table>

<table cellspacing="0" cellpadding="0" width="100%" border="0" summary="Total">

	<?php foreach($totals as $total) { ?>
    
    <?php if ($total['title'] == 'Total') { ?>
    
    <tr>
    	<td style="background:#ccc; border-top:solid 2px #000; padding-right: 3px; height: 20px; width: 100%; text-align: right;"><strong><?php echo $total['title']; ?>:</strong></td>
    	<td style="background:#ccc; border-top:solid 2px #000; white-space: nowrap; padding-right: 5px; height: 20px; text-align: right;"><span class="currency"><?php echo $total['text']; ?></span></td>
  	</tr>
    
    <?php } else { ?>
    
    <tr>
    	<td style="padding-right: 3px; height: 20px; width: 100%; text-align: right;"><strong><?php echo $total['title']; ?>:</strong></td>
    	<td style="white-space: nowrap; padding-right: 5px; height: 20px; text-align: right;"><span class="currency"><?php echo $total['text']; ?></span></td>
  	</tr>
    
    <?php } ?>
    
    <?php } ?>
    
  
</table>




    </td>
  </tr>
  
  
  
  <tr>
    <td style="text-align: center; padding-top: 30px; font-size: 12px;">
      Thank you for your purchase!
    </td>
  </tr>

</table>


</body>
</html>
