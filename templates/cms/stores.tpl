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
  {l s='Our stores' d='Shop.Theme.Global'}
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-stores">

    {foreach $stores as $store}
      <article id="store-{$store.id}" class="store-item">
        <header>
          <h3>{$store.name}</h3>
        </header>

        <div>
          <div class="store-picture">
            <img src="{$store.image.bySize.stores_default.url}" alt="{$store.image.legend}">
          </div>
          <ul>
            <li>{$store.address.formatted nofilter}</li>
            {if $store.phone}
              <li>{l s='Phone:' d='Shop.Theme.Global'} {$store.phone}</li>
            {/if}
            {if $store.fax}
              <li>{l s='Fax:' d='Shop.Theme.Global'} {$store.fax}</li>
            {/if}
            {if $store.email}
              <li>{l s='Email:' d='Shop.Theme.Global'} {$store.email}</li>
            {/if}
          </ul>
          <p>{l s='Opening hours' d='Shop.Theme.Global'}</p>
          <table>
            {foreach $store.business_hours as $day}
            <tr>
              <td>{$day.day}</td>
              <td>
                <ul>
                {foreach $day.hours as $h}
                  <li>{$h}</li>
                {/foreach}
                </ul>
              </td>
            </tr>
            {/foreach}
          </table>
        </div>

      </article>
    {/foreach}

  </section>
{/block}
