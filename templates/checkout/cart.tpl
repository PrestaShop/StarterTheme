{extends file=$layout}

{block name='content'}

  <section id="main">
    <h1>{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>

    {block name='cart_overview'}
      {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
    {/block}

    {block name='continue_shopping'}
      <a href="{$urls.pages.index}">
        {l s='Continue shopping' d='Shop.Theme.Actions'}
      </a>
    {/block}

    <div>
      {hook h='displayShoppingCartFooter'}
    </div>

    {block name='cart_summary'}
        {block name='cart_summary_line'}
          {include file='checkout/_partials/cart-summary-items-subtotal.tpl' cart=$cart}
        {/block}

        {block name='cart_voucher'}
          {include file='checkout/_partials/cart-voucher.tpl'}
        {/block}

        {hook h='displayShoppingCart'}

        {block name='cart_totals'}
          {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
        {/block}

        {block name='cart_actions'}
          <div>
            {if $cart.minimalPurchaseRequired}
              <div class="notification notification-warning" role="alert" data-alert="warning">
                {$cart.minimalPurchaseRequired}
              </div>
              <button disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
            {elseif empty($cart.products)}
              <button disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
            {else}
              <a href="{$urls.pages.order}">{l s='Checkout' d='Shop.Theme.Actions'}</a>
              {hook h='displayExpressCheckout'}
            {/if}
          </div>
        {/block}

    {/block}

    {block name='display_reassurance'}
      {hook h='displayReassurance'}
    {/block}
  </section>
{/block}
