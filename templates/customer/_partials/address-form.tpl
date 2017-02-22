{block name="address-form"}
  <div class="js-address-form">
    {include file='_partials/form-errors.tpl' errors=$errors['']}

    <form
      method="POST"
      action="{url entity='address' params=['id_address' => $id_address]}"
      data-id-address="{$id_address}"
      data-refresh-url="{url entity='address' params=['ajax' => 1, 'action' => 'addressForm']}"
    >
      {block name="address-form-fields"}
        <section class="form-fields">
          {block name='form_fields'}
            {foreach from=$formFields item="field"}
              {block name='form_field'}
                {form_field field=$field}
              {/block}
            {/foreach}
          {/block}
        </section>
      {/block}

      {block name="address-form-footer"}
        <footer class="form-footer">
          <input type="hidden" name="submitAddress" value="1">
          {block name='form_buttons'}
            <button type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
          {/block}
        </footer>
      {/block}
    </form>
  </div>
{/block}
