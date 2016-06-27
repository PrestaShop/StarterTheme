{extends file='page.tpl'}

{block name='page_title'}
  {l s='Order confirmation'}
{/block}

{block name='page_content_container' prepend}
  <section id="content-hook_payment_return">
    {$HOOK_PAYMENT_RETURN nofilter}
  </section>

  <section id="content-hook_order_confirmation">
    <h3>{l s='Your order is confirmed'}</h3>
    <p>
      {l s='An email has been sent to your mail address %s.' sprintf=$customer.email}
      {if $order.details.invoice_url !== ''}{l s='You can also [1]download your invoice[/1]' tags=["<a href='{$order.details.invoice_url}'>"]}{/if}
      {if $order.details.invoice_url}
        {l
          s='You can also [1]download your invoice[/1]'
          tags=["<a href='{$order.details.invoice_url}'>"]
        }
      {/if}
    </p>
    {$HOOK_ORDER_CONFIRMATION nofilter}
  </section>
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-order-confirmation">

    {block name='order_confirmation_table'}
      {include
        file='checkout/_partials/order-confirmation-table.tpl'
        products=$order.products
        subtotals=$order.subtotals
        totals=$order.totals
        labels=$order.labels
      }
    {/block}

    <div id='order-details'>
        <h3>{l s='Order details'}</h3>
        <ul>
          <li>{l s='Order reference %s' sprintf=$order.details.reference}</li>
          <li>{l s='Payment method %s' sprintf=$order.details.payment}</li>
          {if !$order.details.is_virtual}
            <li>{l s='Shipping method %s' sprintf=$order.carrier.name}</li>
          {/if}
        </ul>
    </div>

    {if $customer.is_guest}
    <div id='registration-form'>
        <h4>{l s='Save time on your next order, sign up now'}</h4>
        {render file='customer/_partials/customer-form.tpl' ui=$register_form}
    </div>
    {/if}

    {hook h='displayOrderConfirmation1'}
  </section>
{/block}

{block name='page_content_container' append}
  <section id="content-hook-order-confirmation-footer">
    {hook h='displayOrderConfirmation2'}
  </section>
{/block}
