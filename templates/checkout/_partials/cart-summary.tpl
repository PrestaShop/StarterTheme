<section id="js-checkout-summary" class="js-cart js-checkout-summary" data-refresh-url="{url entity='cart' params=['ajax' => 1]}">
  {hook h='displayCheckoutSummaryTop'}
  {block name='cart_summary_header'}
    <header>
      <h1 class="h3">{l s='Your order' d='Shop.Theme.CustomerAccount'}</h1>
      <p>{$cart.summary_string}</p>
    </header>
  {/block}

  {block name='cart_summary_product_list'}
    <div id="cart-summary-product-list">
      <ul>
        {foreach from=$cart.products item=product}
          <li>{include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}</li>
        {/foreach}
      </ul>
    </div>
  {/block}

  {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}

  {block name='cart_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}
</section>
