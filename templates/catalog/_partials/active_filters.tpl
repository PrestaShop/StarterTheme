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
<section id="js-active-search-filters" class="active_filters">
  <h3 class="h3">{l s='Active filters' d='Shop.Theme.Global'}</h3>
  {if $activeFilters|count}
    <ul>
      {foreach from=$activeFilters item="filter"}
        <li>{l s='%facet_label%: %facet_value%' sprintf=['%facet_label%' => $filter.facetLabel, '%facet_value%' => $filter.label] d='Shop.Theme.Catalog'} <a  class="js-search-link" href="{$filter.nextEncodedFacetsURL}">{l s='Remove' d='Shop.Theme.Actions'}</a></li>
      {/foreach}
    </ul>
  {/if}
  <p><a href="{$clear_all_link}">{l s='Reset all filter' d='Shop.Theme.Actions'}</a></p>
</section>
