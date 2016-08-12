{extends file='page.tpl'}

{block name='page_title'}
  {l s='Guest Order Tracking'}
{/block}

{block name='page_content'}
  <form id="guestOrderTrackingForm" action="{$urls.pages.guest_tracking}" method="get">
    <header>
      <p>{l s='To track your order, please enter the following information:'}</p>
    </header>

    <section class="form-fields">

      <label>
        <span>{l s='Order Reference:'}</span>
        <input type="text" name="order_reference" value="{if isset($smarty.request.id_order)}{$smarty.request.id_order}{/if}" size="8">
        <i>{l s='For example: QIIXJXNUI or QIIXJXNUI#1'}</i>
      </label>

      <label>
        <span>{l s='Email:'}</span>
        <input type="email" name="email" value="{if isset($smarty.request.email)}{$smarty.request.email}{/if}">
      </label>

    </section>

    <footer class="form-footer">
      <input type="hidden" name="submitGuestTracking" value="1">

      <button type="submit">{l s='Send'}</button>
    </footer>
  </form>
{/block}
