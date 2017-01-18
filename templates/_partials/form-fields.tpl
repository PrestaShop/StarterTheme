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
