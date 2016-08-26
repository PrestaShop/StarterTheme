<div class="cart-detailed-totals">
  <div class="cart-subtotals">
    {foreach from=$cart.subtotals item="subtotal"}
      <div class="{$subtotal.type}">
        <span class="label">{$subtotal.label}</span>
        <span class="value">{$subtotal.amount}</span>
      </div>
    {/foreach}
  </div>

  <div class="cart-total">
    <span class="label">{$cart.totals.total.label}</span>
    <span class="value">{$cart.totals.total.amount}</span>
    {if $subtotal.type === 'shipping'}
        {hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}
    {/if}
  </div>
</div>
