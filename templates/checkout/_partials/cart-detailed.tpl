{block name='cart_detailed'}
  <div class="cart-overview js-cart" data-refresh-url="{url entity='cart' params=['ajax' => 1, 'action' => 'refresh']}">
    <div class="body">
      <ul>
        {foreach from=$cart.products item=product}
          <li class="cart-item">{include file='checkout/_partials/cart-detailed-product-line.tpl' product=$product}</li>
        {/foreach}
      </ul>
    </div>
  </div>
{/block}
