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
{block name='order_products_table'}
  <form action="{$urls.pages.order_follow}" method="post">

    <table id="order-products">
      <thead>
        <tr>
          <th><input type="checkbox"></th>
          <th>{l s='Reference' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Product' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Quantity' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Returned' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Unit price' d='Shop.Theme.Catalog'}</th>
          <th>{l s='Total price' d='Shop.Theme.Catalog'}</th>
        </tr>
      </thead>

      {foreach from=$order.products item=product name=products}
        <tr>
          <td>
            {if !$product.customizedDatas}
              <input type="checkbox" id="cb_{$product.id_order_detail}" name="ids_order_detail[{$product.id_order_detail}]" value="{$product.id_order_detail}">
            {else}
              {foreach $product.customizations  as $customization}
                <input type="checkbox" id="cb_{$product.id_order_detail}" name="customization_ids[{$product.id_order_detail}][]" value="{$customization.id_customization}">
              {/foreach}
            {/if}
          </td>
          <td>{$product.reference}</td>
          <td>{$product.name}
            {if $product.customizations}
              <br />
              {foreach $product.customizations as $customization}
                <ul>
                  {foreach from=$customization.fields item=field}
                    {if $field.type == 'image'}
                      <li><img src="{$field.image.small.url}" alt=""></li>
                    {elseif $field.type == 'text'}
                      <li>{$field.label} : {if (int)$field.id_module}{$field.text nofilter}{else}{$field.text}{/if}</li>
                    {/if}
                  {/foreach}
                </ul>
              {/foreach}
            {/if}
          </td>
          <td>
            {if !$product.customizedDatas}
              {$product.quantity}
              <select name="order_qte_input[{$product.id_order_detail}]">
                {section name=quantity start=1 loop=$product.product_quantity+1}
                  <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                {/section}
              </select>
            {else}
              {foreach $product.customizations as $customization}
                {$customization.quantity}
                <select name="customization_qty_input[{$customization.id_customization}]">
                  {section name=quantity start=1 loop=$customization.quantity+1}
                    <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                  {/section}
                </select>
              {/foreach}
            {/if}
          </td>
          <td>{$product.qty_returned}</td>
          <td>{$product.price}</td>
          <td>{$product.total}</td>
        </tr>
      {/foreach}

      <tfoot>
        {foreach $order.subtotals as $line}
          <tr class="line-{$line.type}">
            <td colspan="5">{$line.label}</td>
            <td colspan="2">{$line.value}</td>
          </tr>
        {/foreach}

        <tr class="line-{$order.totals.total.type}">
          <td colspan="5">{$order.totals.total.label}</td>
          <td colspan="2">{$order.totals.total.value}</td>
        </tr>
      </tfoot>
    </table>

    <header>
      <h1 class="h3">{l s='Merchandise return' d='Shop.Theme.Customeraccount'}</h1>
      <p>{l s='If you wish to return one or more products, please mark the corresponding boxes and provide an explanation for the return. When complete, click the button below.' d='Shop.Theme.Customeraccount'}</p>
    </header>

    <section class="form-fields">

      <label>
        <textarea cols="67" rows="3" name="returnText"></textarea>
      </label>

    </section>

    <footer class="form-footer">
      <input type="hidden" name="id_order" value="{$order.details.id}">
      <button type="submit" name="submitReturnMerchandise">
        {l s='Request a return' d='Shop.Theme.Customeraccount'}
      </button>
    </footer>
  </form>
{/block}
