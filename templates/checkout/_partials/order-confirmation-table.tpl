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
{block name='order_confirmation_table'}
  <div id='order-items'>

    <h3>{l s='Order items' d='Shop.Theme.Checkout'}</h3>

    <table>
      {foreach from=$products item=product}
        <tr>
          <td>
            <span class="product-image media-middle">
              <img class="" src="{$product.cover.medium.url}">
            </span>
          </td>
          <td>
            {$product.name}
            {foreach from=$product.attributes key="attribute" item="value"}
              - <span class="value">{$value}</span>
            {/foreach}
            {if is_array($product.customizations) && $product.customizations|count}
              <div class="customizations">
                <ul>
                  {foreach from=$product.customizations item="customization"}
                    <li>
                      {if $customization.down_quantity_url}
                        <a href="{$customization.down_quantity_url}" data-link-action="update-quantity">-</a>
                      {/if}
                      <span class="product-quantity">{$customization.quantity}</span>
                      {if $customization.up_quantity_url}
                        <a href="{$customization.up_quantity_url}" data-link-action="update-quantity">+</a>
                      {/if}
                      <a href="{$customization.remove_from_cart_url}" class="remove-from-cart" rel="nofollow">
                        {l s='Remove' d='Shop.Theme.Actions'}
                      </a>
                      <ul>
                        {foreach from=$customization.fields item="field"}
                          <li>
                            <label>{$field.label}</label>
                            {if $field.type == 'text'}
                              {if (int)$field.id_module}
                                <span>{$field.text nofilter}</span>
                              {else}
                                <span>{$field.text}</span>
                              {/if}
                            {elseif $field.type == 'image'}
                              <img src="{$field.image.small.url}">
                            {/if}
                          </li>
                        {/foreach}
                      </ul>
                    </li>
                  {/foreach}
                </ul>
              </div>
            {/if}
            {hook h='displayProductPriceBlock' product=$product type="unit_price"}
          </td>
          <td>{$product.quantity}</td>
          <td>{$product.price}</td>
        </tr>
      {/foreach}
    </table>

    <hr>

    <table>
      {foreach $subtotals as $subtotal}
        {if $subtotal.type !== 'tax' && $subtotal.label !== null}
          <tr>
            <td>{$subtotal.label}</td>
            <td>{$subtotal.value}</td>
          </tr>
        {/if}
      {/foreach}

      <tr>
        <td>{$totals.total.label} {$labels.tax_short}</td>
        <td>{$totals.total.value}</td>
      </tr>
      <tr>
        <td>{$subtotals.tax.label}</td>
        <td>{$subtotals.tax.value}</td>
      </tr>
    </table>

  </div>
{/block}
