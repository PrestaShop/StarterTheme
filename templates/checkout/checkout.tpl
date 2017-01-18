<!doctype html>
<html lang="{$language.iso_code}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    <header id="header">
      {block name='header'}
        {include file='checkout/_partials/header.tpl'}
      {/block}
    </header>

    {block name='notifications'}
      {include file='_partials/notifications.tpl'}
    {/block}

    {block name='content'}
      <section id="content">

        {block name='cart_summary'}
          {include file='checkout/_partials/cart-summary.tpl' cart=$cart}
        {/block}

        {block name='cart_summary'}
          {render file='checkout/checkout-process.tpl' ui=$checkout_process}
        {/block}

      </section>
    {/block}

    <footer id="footer">
      {block name='footer'}
        {include file='checkout/_partials/footer.tpl'}
      {/block}
    </footer>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

  </body>

</html>
