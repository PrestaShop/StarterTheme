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
  <table id="order-products">
    <thead>
      <tr>
        <th>{l s='Reference' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Product' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Quantity' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Unit price' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Total price' d='Shop.Theme.Catalog'}</th>
      </tr>
    </thead>

    {foreach from=$order.products item=product}
      <tr>
        <td>{$product.reference}</td>
        <td>
          {$product.name}
          {if $product.customizations}
            <br />
            {foreach $product.customizations  as $customization}
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
        {if $product.customizations}
          {foreach $product.customizations  as $customization}
            {$customization.quantity}
          {/foreach}
        {else}
          {$product.quantity}
        {/if}
        </td>
        <td>{$product.price}</td>
        <td>{$product.total}</td>
      </tr>
    {/foreach}

    <tfoot>
      {foreach $order.subtotals as $line}
        <tr class="line-{$line.type}">
          <td colspan="4">{$line.label}</td>
          <td>{$line.value}</td>
        </tr>
      {/foreach}

      <tr class="text-xs-right line-{$order.totals.total.type}">
        <td colspan="4">{$order.totals.total.label}</td>
        <td>{$order.totals.total.value}</td>
      </tr>
    </tfoot>
  </table>
{/block}
