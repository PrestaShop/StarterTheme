{extends file='customer/_partials/address-form.tpl'}

{block name='form_field'}
  {if $field.name eq "alias"}
    {* we don't ask for alias here *}
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block name='form_fields' append}
  <input type="hidden" name="saveAddress" value="{$type}">
  {if $type === "delivery"}
      {form_field field=[
      'type' => 'checkbox',
      'name' => 'use_same_address',
      'value' => $use_same_address,
      'label' => {l s='Use this address for invoice too' d='Shop.Theme.Checkout'}
      ]}
  {/if}
{/block}

{block name='form_buttons'}
  {if !$form_has_continue_button}
    <a href="{url entity=order params=['cancelAddress' => $type]}">{l s='Cancel' d='Shop.Theme.Actions'}</a>
    <button type="submit">{l s='Save Address' d='Shop.Theme.Actions'}</button>
  {else}
    {if $customer.addresses|count > 0}
      <a href="{url entity=order params=['cancelAddress' => $type]}">{l s='Cancel' d='Shop.Theme.Actions'}</a>
    {/if}
    <button type="submit" class="continue" name="confirm-addresses" value="1">
      {l s='Continue' d='Shop.Theme.Actions'}
    </button>
  {/if}
{/block}
