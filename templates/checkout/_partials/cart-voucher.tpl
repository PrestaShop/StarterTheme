{if $cart.vouchers.allowed}
  <div class="cart-voucher">
    {foreach from=$cart.vouchers.added item=voucher}
      <li>
        {$voucher.name}
        <a href="{$voucher.delete_url}" data-link-action="remove-voucher">{l s='Remove' d='Shop.Theme.Actions'}</a>
      </li>
    {/foreach}
    <form action="{$urls.pages.cart}" data-link-action="add-voucher" method="post">
      <input type="hidden" name="token" value="{$static_token}">
      <input type="hidden" name="addDiscount" value="1">
      <input type="text" name="discount_name" placeholder="{l s='Promo code' d='Shop.Theme.Checkout'}">
      <button type="submit"><span>{l s='ok' d='Shop.Theme.Actions'}</span></button>
      {if $cart.discounts|count > 0}
        <p>
          {l s='Take advantage of our exclusive offers:' d='Shop.Theme.Actions'}
        </p>
        <ul>
          {foreach from=$cart.discounts item=discount}
            <li class="cart-summary-line">
              <span class="label"><span class="code">{$discount.code}</span> - {$discount.name}</span>
            </li>
          {/foreach}
        </ul>
      {/if}
    </form>
    <div class="notification notification-error js-error">
      <span class="js-error-text"></span>
    </div>
  </div>
{/if}
