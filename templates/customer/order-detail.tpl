{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Order details' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}

  {block name='order_infos'}
    <div id="order-infos">
      <p>
        {l
          s='Order Reference %reference% - placed on %date%'
          d='Shop.Theme.Customeraccount'
          sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
        }
      </p>
      {if $order.details.reorder_url}
        <a href="{$order.details.reorder_url}">{l s='Reorder' d='Shop.Theme.Actions'}</a>
      {/if}

      <p>{l s='Carrier' d='Shop.Theme.Checkout'} {$order.carrier.name}</p>
      <p>{l s='Payment method' d='Shop.Theme.Checkout'} {$order.details.payment}</p>

      {if $order.details.invoice_url}
        <p><a href="{$order.details.invoice_url}">{l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}</a></p>
      {/if}

      {if $order.details.recyclable}
        <p>{l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}</p>
      {/if}

      {if $order.details.gift_message}
        <p>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</p>
        <p>{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}</p>
      {/if}
    </div>
  {/block}

  {block name='order_history'}
    <section id="order-history">
      <h1>{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</h1>
      <table>
        <thead>
          <tr>
            <th>{l s='Date' d='Shop.Theme.Global'}</th>
            <th>{l s='Status' d='Shop.Theme.Global'}</th>
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

  {block name='order_follow_up'}
    {if $order.follow_up}
      <p>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</p>
      <a href="{$order.follow_up}">{$order.follow_up}</a>
    {/if}
  {/block}

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

  {block name='order_detail'}
    {$HOOK_DISPLAYORDERDETAIL nofilter}
  {/block}

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
            <th>{l s='Date' d='Shop.Theme.Global'}</th>
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
              <td>{$line.tracking nofilter}</td>
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
