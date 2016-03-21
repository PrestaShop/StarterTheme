{extends file='checkout/cart.tpl'}

{block name='content' append}
  {hook h='displayCrossSellingShoppingCart'}
{/block}

{block name='cart_overview' append}
  <a href="{$urls.pages.index}">
    {l s='Continue shopping'}
  </a>
{/block}

{block name='cart_actions'}
  <div class="checkout">
    <a href="{$urls.pages.order}">{l s='Checkout'}</a>
  </div>
{/block}

{block name='continue_shopping'}{/block}
{block name='cart_voucher'}{/block}
{block name='display_reassurance'}{/block}
