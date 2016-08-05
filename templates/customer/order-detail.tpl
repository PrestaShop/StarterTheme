{extends file='page.tpl'}

{block name='page_title'}
  {l s='Order details' d='Shop.Theme.CustomerAccount'}
{/block}

{block name='page_content'}

  {block name='order_infos'}
    <div id="order-infos">
      <p>
        {l
          s='Order Reference %reference% - placed on %date%'
          d='Shop.Theme.CustomerAccount'
          sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
        }
      </p>
      {if $order.details.reorder_url}
        <a href="{$order.details.reorder_url}">{l s='Reorder' d='Shop.Theme.Actions'}</a>
      {/if}

      <p>{l s='Carrier' d='Shop.Theme.Checkout'} {$order.carrier.name}</p>
      <p>{l s='Payment method' d='Shop.Theme.Checkout'} {$order.details.payment}</p>

      {if $order.details.invoice_url}
        <p><a href="{$order.details.invoice_url}">{l s='Download your invoice as a PDF file.' d='Shop.Theme.CustomerAccount'}</a></p>
      {/if}

      {if $order.details.recyclable}
        <p>{l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.CustomerAccount'}</p>
      {/if}

      {if $order.details.gift_message}
        <p>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.CustomerAccount'}</p>
        <p>{l s='Message' d='Shop.Theme.CustomerAccount'} {$order.details.gift_message nofilter}</p>
      {/if}
    </div>
  {/block}

  {block name='order_history'}
    <section id="order-history">
      <h1>{l s='Follow your order\'s status step-by-step' d='Shop.Theme.CustomerAccount'}</h1>
      <table>
        <thead>
          <tr>
            <th>{l s='Date' d='Shop.Theme'}</th>
            <th>{l s='Status' d='Shop.Theme'}</th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$order.history item=state}
            <tr>
              <td>{$state.history_date}</td>
              <td><span class="order-status-label {$state.contrast}" style="background-color:{$state.color}">{$state.ostate_name}</span></td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    </section>
  {/block}

  {if $order.follow_up}
    <p>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.CustomerAccount'}</p>
    <a href="{$order.follow_up}">{$order.follow_up}</a>
  {/if}

  {block name='addresses'}
    {if $order.addresses.delivery}
      <article id="delivery-address" class="address">
        <header>
          <h1 class="h4">{l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.delivery.alias]}</h1>
        </header>

        <p>{$order.addresses.delivery.formatted nofilter}</p>
      </article>
    {/if}

    <article id="invoice-address" class="address">
      <header>
        <h1 class="h4">{l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}</h1>
      </header>

      <p>{$order.addresses.invoice.formatted nofilter}</p>
    </article>
  {/block}

  {$HOOK_DISPLAYORDERDETAIL}

  {block name='order_detail'}
    {if $order.details.is_returnable}
      {include file='customer/_partials/order-detail-return.tpl'}
    {else}
      {include file='customer/_partials/order-detail-no-return.tpl'}
    {/if}
  {/block}

  {block name='order_carriers'}
    {if $order.shipping}
      <table>
        <thead>
          <tr>
            <th>{l s='Date' d='Shop.Theme'}</th>
            <th>{l s='Carrier' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Weight' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Shipping cost' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Tracking number' d='Shop.Theme.Checkout'}</th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$order.shipping item=line}
            <tr>
              <td>{$line.shipping_date}</td>
              <td>{$line.carrier_name}</td>
              <td>{$line.shipping_weight}</td>
              <td>{$line.shipping_cost}</td>
              <td>{$line.tracking}</td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    {/if}
  {/block}

  {block name='order_messages'}
    {include file='customer/_partials/order-messages.tpl'}
  {/block}

{/block}
