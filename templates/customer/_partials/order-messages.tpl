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
{block name='order_messages_table'}
  {if $order.messages}
    <h3>{l s='Messages' d='Shop.Theme.Customeraccount'}</h3>
    <table>
      <thead>
        <tr>
          <th>{l s='From' d='Shop.Forms.Labels'}</th>
          <th>{l s='Message' d='Shop.Forms.Labels'}</th>
        </tr>
      </thead>
      <tbody>
      {foreach from=$order.messages item=message}
        <tr>
          <td>
            {$message.name}<br>
            {$message.message_date}
          </td>
          <td>{$message.message nofilter}</td>
        </tr>
      {/foreach}
      </tbody>
    </table>
  {/if}
{/block}

{block name='order_message_form'}
  <section class="order-message-form">
    <form action="{$urls.pages.order_detail}" method="post">

      <header>
        <h1 class="h3">{l s='Add a message' d='Shop.Theme.Customeraccount'}</h1>
        <p>{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Customeraccount'}</p>
      </header>

      <section class="form-fields">

        <label>
          <span>{l s='Product' d='Shop.Forms.Labels'}</span>
          <select name="id_product">
            <option value="0">{l s='-- Choose --' d='Shop.Forms.Labels'}</option>
            {foreach from=$order.products item=product}
              <option value="{$product.product_id}">{$product.product_name}</option>
            {/foreach}
          </select>
        </label>

        <label>
          <textarea cols="67" rows="3" name="msgText"></textarea>
        </label>

      </section>

      <footer class="form-footer">
        <input type="hidden" name="id_order" value="{$order.details.id}">
        <button type="submit" name="submitMessage">
          {l s='Send' d='Shop.Theme.Actions'}
        </button>
      </footer>

    </form>
  </section>
{/block}
