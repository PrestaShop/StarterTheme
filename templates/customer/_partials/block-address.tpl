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
{block name='address_block_item'}
  <article id="address-{$address.id}" class="address" data-id-address="{$address.id}">
    <header>
      <h1 class="h4">{$address.alias}</h1>
    </header>

    <p>{$address.formatted nofilter}</p>

    {block name='address_block_item'}
      <footer class="actions address-actions">
        <ul class="action-list">
          <li>
            <a href="{url entity=address id=$address.id}" data-link-action="edit-address">
              {l s='Update' d='Shop.Theme.Actions'}
            </a>
          </li>
          <li>
            <a href="{url entity=address id=$address.id params=['delete' => 1, 'token' => $token]}" data-link-action="delete-address">
              {l s='Delete' d='Shop.Theme.Actions'}
            </a>
          </li>
        </ul>
      </footer>
    {/block}
  </article>
{/block}
