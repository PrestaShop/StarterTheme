{block name='cart_detailed_actions'}
  <div class="checkout cart-detailed-actions">
    {if $cart.minimalPurchaseRequired}
      <div class="alert alert-warning" role="alert">
        {$cart.minimalPurchaseRequired}
      </div>
      <button type="button" disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
    {else}
      <a href="{$urls.pages.order}">{l s='Checkout' d='Shop.Theme.Actions'}</a>
      {hook h='displayExpressCheckout'}
    {/if}
  </div>
{/block}
