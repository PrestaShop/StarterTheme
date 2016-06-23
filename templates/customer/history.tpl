{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order history'}
{/block}

{block name='page_content'}
  <h2>{l s='Here are the orders you\'ve placed since your account was created.'}</h2>

  {if $orders}
    <table>
      <thead>
        <tr>
          <th>{l s='Order reference'}</th>
          <th>{l s='Date'}</th>
          <th>{l s='Total price'}</th>
          <th>{l s='Payment'}</th>
          <th>{l s='Status'}</th>
          <th>{l s='Invoice'}</th>
          <th>&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$orders item=order}
          <tr>
            <td>{$order.details.reference}</td>
            <td>{$order.details.order_date}</td>
            <td>{$order.totals.total.value}</td>
            <td>{$order.details.payment}</td>
            <td>
              <span
                class="order-status-label {$order.history.current.contrast}"
                style="background-color:{$order.history.current.color}"
              >
                {$order.history.current.ostate_name}
              </span>
            </td>
            <td>
              {if $order.details.invoice_url}
                <a href="{$order.details.invoice_url}" class="order-invoice-link">{l s='PDF'}</a>
              {else}
                -
              {/if}
            </td>
            <td>
              <a href="{$order.details.details_url}" data-link-action="view-order-details">
                {l s='Details'}
              </a>
              {if $order.details.reorder_url}
                <a href="{$order.details.reorder_url}" class="order-reorder-link">{l s='Reorder'}</a>
              {/if}
            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  {/if}

{/block}
