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
{if $product.is_customizable}
  <section class="product-customization">
    {if !$configuration.is_catalog}
      <h3>{l s='Product customization' d='Shop.Theme.Catalog'}</h3>

      {block name='product_customization_form'}
        <form method="post" action="{$urls.current_url}" enctype="multipart/form-data">
          <ul>
            {foreach from=$customizations.fields item="field"}
              <li>
                <label>{$field.label}</label>
                {if $field.type == 'text'}
                  <textarea {if $field.required} required {/if} name="{$field.input_name}">{$field.text}</textarea>
                  <small>{l s='250 char. max' d='Shop.Forms.Help'}</small>
                  {if $field.text !== ''}
                    <h6>{l s='Your customization:' d='Shop.Theme.Catalog'} <label>{$field.text}</label></h6>
                  {/if}
                {elseif $field.type == 'image'}
                  {if $field.is_customized}
                    <img src="{$field.image.small.url}">
                    <a class="remove-image" href="{$field.remove_image_url}" rel="nofollow">{l s='Remove Image' d='Shop.Theme.Actions'}</a>
                  {/if}
                {/if}
              </li>
            {/foreach}
          </ul>
          <button name="submitCustomizedData">{l s='Save Customization' d='Shop.Theme.Actions'}</button>
        </form>
      {/block}

    {/if}
  </section>
{/if}
