{extends file='page.tpl'}

{block name='page_title'}
  {l s='Guest Order Tracking' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {block name='guest_login_form'}
    <form id="guestOrderTrackingForm" action="{$urls.pages.guest_tracking}" method="get">
      <header>
        <p>{l s='To track your order, please enter the following information:' d='Shop.Theme.Customeraccount'}</p>
      </header>

    {block name='guest_login_form_fields'}
      <section class="form-fields">

        <label>
          <span>{l s='Order Reference:' d='Shop.Forms.Labels'}</span>
          <input type="text" name="order_reference" value="{if isset($smarty.request.id_order)}{$smarty.request.id_order}{/if}" size="8">
          <i>{l s='For example: QIIXJXNUI or QIIXJXNUI#1' d='Shop.Theme.Customeraccount'}</i>
        </label>

        <label>
          <span>{l s='Email:' d='Shop.Forms.Labels'}</span>
          <input type="email" name="email" value="{if isset($smarty.request.email)}{$smarty.request.email}{/if}">
        </label>

      </section>
    {/block}

      <footer class="form-footer">
        <input type="hidden" name="submitGuestTracking" value="1">

        <button type="submit">{l s='Send' d='Shop.Theme.Actions'}</button>
      </footer>
    </form>
  {/block}
{/block}
