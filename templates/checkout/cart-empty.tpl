{extends file=$layout}

{block name='content'}

  <section id="main" class="cart-empty">
    <!-- cart products detailed -->
    <div>
      <div>
        <h1>{l s='Shopping Cart'}</h1>
      </div>
      <hr>
      {block name='cart_overview'}
        {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
      {/block}
      <a href="{$urls.pages.index}">
        {l s='Continue shopping'}
      </a>
    </div>
    <!-- shipping informations -->
    <div>
      {hook h='displayShoppingCart'}
    </div>

    <div class="cart-summary">
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

      <div class="checkout">
        <ul>
          <li>
            <a href="{$urls.pages.order}">{l s='Checkout'}</a>
          </li>
        </ul>
        {hook h='displayExpressCheckout'}
      </div>
    </div>

    {hook h='displayCrossSellingShoppingCart'}
  </section>

{/block}
