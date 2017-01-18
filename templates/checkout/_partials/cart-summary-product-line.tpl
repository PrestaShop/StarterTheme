{block name='cart_summary_product_line'}
  <span class="product-quantity">{$product.quantity}</span>
  <span class="product-name">{$product.name}</span>
  <span class="product-price">{$product.price}</span>
  {hook h='displayProductPriceBlock' product=$product type="unit_price"}
{/block}
