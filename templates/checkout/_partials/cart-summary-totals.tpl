<div class="cart-summary-totals">
  {block name='cart_summary_body'}
    <div id="cart-summary">
      {foreach from=$cart.subtotals item="subtotal"}
        <div class="{$subtotal.type}">
          <span class="label">{$subtotal.label}</span>
          <span class="value">{$subtotal.value}</span>
        </div>
      {/foreach}
    </div>
  {/block}

  {block name='cart_summary_totals'}
    <div class="cart-summary-totals">
      <span class="label">{$cart.totals.total.label}</span>
      <span class="value">{$cart.totals.total.value}</span>
    </div>
  {/block}
</div>
