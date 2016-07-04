{extends "customer/_partials/customer-form.tpl"}

{block "form_field"}
  {if $field.name === 'password' and $guest_allowed}
    <div>
      <p>{l s='Choose a password to create an account and save time on your next order (optional)' d='Shop.Theme.Checkout'}</p>
      {$smarty.block.parent}
    </div>
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block "form_buttons"}
  <button
    class="continue"
    name="continue"
    data-link-action="register-new-customer"
    type="submit"
    value="1"
  >
    {l s='Continue' d='Shop.Theme.Actions'}
  </button>
{/block}
