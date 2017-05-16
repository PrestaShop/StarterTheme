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
{block name='cart_voucher'}
  {if $cart.vouchers.allowed}
    <div class="cart-voucher">
      {block name='cart_voucher_list'}
        <ul>
          {foreach from=$cart.vouchers.added item=voucher}
            <li>
              {$voucher.name}
              <a href="{$voucher.delete_url}" data-link-action="remove-voucher">{l s='Remove' d='Shop.Theme.Actions'}</a>
            </li>
          {/foreach}
        </ul>
      {/block}

      {block name='cart_voucher_form'}
        <form action="{$urls.pages.cart}" data-link-action="add-voucher" method="post">
          <input type="hidden" name="token" value="{$static_token}">
          <input type="hidden" name="addDiscount" value="1">
          <input type="text" name="discount_name" placeholder="{l s='Promo code' d='Shop.Theme.Checkout'}">
          <button type="submit"><span>{l s='ok' d='Shop.Theme.Actions'}</span></button>
          {if $cart.discounts|count > 0}
            <p>
              {l s='Take advantage of our exclusive offers:' d='Shop.Theme.Actions'}
            </p>
            <ul>
              {foreach from=$cart.discounts item=discount}
                <li class="cart-summary-line">
                  <span class="label"><span class="code">{$discount.code}</span> - {$discount.name}</span>
                </li>
              {/foreach}
            </ul>
          {/if}
        </form>
      {/block}

      {block name='cart_voucher_notifications'}
        <div class="notification notification-error js-error">
          <span class="js-error-text"></span>
        </div>
      {/block}
    </div>
  {/if}
{/block}
