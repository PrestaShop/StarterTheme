{foreach $addresses as $address}
  <article id="{$name|classname}-address-{$address.id}" class="address-item">
    <header class="h4">
      {$address.alias}
    </header>

    <label class="radio-block">
        <input type="radio" name="{$name}" value="{$address.id}" {if $address.id == $selected}checked{/if}>
        {$address.formatted nofilter}
    </label>

    <footer>
      {if $interactive}
        <a  data-link-action="edit-address"
          href="{url entity='order' params=['id_address' => $address.id, 'editAddress' => $type, 'token' => $token]}">
          {l s='Edit' d='Shop.Theme.Actions'}
        </a>
        <a  data-link-action="delete-address"
          href="{url entity='order' params=['id_address' => $address.id, 'deleteAddress' => true, 'token' => $token]}">
          {l s='Delete' d='Shop.Theme.Actions'}
        </a>
      {/if}
    </footer>
  </article>
{/foreach}
{if $interactive}
  <p>
    <button class="ps-hidden-by-js" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
  </p>
{/if}
