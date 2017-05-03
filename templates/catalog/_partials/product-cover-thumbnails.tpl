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
<div class="images-container">
  {block name='product_cover'}
    <div class="product-cover">
      <img src="{$product.cover.bySize.medium_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" width="{$product.cover.bySize.medium_default.width}" itemprop="image">
    </div>
  {/block}

  {block name='product_images'}
    <ul class="product-images">
      {foreach from=$product.images item=image}
        <li><img src="{$image.medium.url}" alt="{$image.legend}" title="{$image.legend}" width="100" itemprop="image"></li>
      {/foreach}
    </ul>
  {/block}
</div>
