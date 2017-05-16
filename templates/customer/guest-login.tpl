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
