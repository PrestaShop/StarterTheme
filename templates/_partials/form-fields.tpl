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
{if $field.type === 'select'}

  {block name='form_field_item_select'}
    <label class='select-field {if $field.required}required{/if}'>
      <span>{$field.label}</span>
      <select name="{$field.name}" {if $field.required}required{/if}>
        <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
        {foreach from=$field.availableValues item="label" key="value"}
          <option value="{$value}" {if $value eq $field.value}selected{/if}>{$label}</option>
        {/foreach}
      </select>
    </label>
  {/block}

{elseif $field.type === 'countrySelect'}

  {block name='form_field_item_country'}
    <label class='select-field {if $field.required}required{/if}'>
      <span>{$field.label}</span>
      <select class="js-country" name="{$field.name}" {if $field.required}required{/if}>
        <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
        {foreach from=$field.availableValues item="label" key="value"}
          <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
        {/foreach}
      </select>
    </label>
  {/block}

{elseif $field.type === 'radio-buttons'}

  {block name='form_field_item_radio'}
    <label class='radio-field {if $field.required}required{/if}'>
      <span>{$field.label}</span>
      {foreach from=$field.availableValues item="label" key="value"}
        <label>
          <input
            name="{$field.name}"
            type="radio"
            value="{$value}"
            {if $field.required}required{/if}
            {if $value eq $field.value}checked{/if}
          >
          {$label}
        </label>
      {/foreach}
    </label>
  {/block}

{elseif $field.type === 'checkbox'}

  {block name='form_field_item_checkbox'}
    <label class='checkbox-field {if $field.required}required{/if}'>
      <input
        name="{$field.name}"
        type="checkbox"
        value="1"
        {if $field.required}required{/if}
        {if $field.value}checked{/if}
      >
      <span>{$field.label}</span>
    </label>
  {/block}

{elseif $field.type === 'password'}

  {block name='form_field_item_password'}
    <label {if $field.required}class="required"{/if}>
      <span>{$field.label}</span>
      <input
        name="{$field.name}"
        type="password"
        value=""
        pattern=".{literal}{{/literal}5,{literal}}{/literal}"
        {if $field.required}required{/if}
      >
    </label>
  {/block}

{elseif $field.type === 'hidden'}

  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value}">
  {/block}

{else}

  {block name='form_field_item_other'}
    <label {if $field.required}class="required"{/if}>
      <span>{$field.label}</span>
      <input name="{$field.name}" type="{$field.type}" value="{$field.value}" {if $field.required}required{/if}>
    </label>
  {/block}

{/if}

{block name='form_field_errors'}
  {include file='_partials/form-errors.tpl' errors=$field.errors}
{/block}
