{if $product.is_customizable}
  <section class="product-customization">
    {if !$configuration.is_catalog}
      <h3>{l s='Product customization'}</h3>
      <form method="post" action="{$urls.current_url}" enctype="multipart/form-data">
        <ul>
          {foreach from=$customizations.fields item="field"}
            <li>
              <label>{$field.label}</label>
              {if $field.type == 'text'}
                <textarea {if $field.required} required {/if} name="{$field.input_name}">{$field.text}</textarea>
              {elseif $field.type == 'image'}
                {if $field.is_customized}
                  <img src="{$field.image.small.url}">
                  <a class="remove-image" href="{$field.remove_image_url}" rel="nofollow">{l s='Remove Image'}</a>
                {/if}
                <input {if $field.required} required {/if} type="file" name="{$field.input_name}">
              {/if}
            </li>
          {/foreach}
        </ul>
        <button name="submitCustomizedData">{l s='Save Customization'}</button>
      </form>
    {/if}
  </section>
{/if}
