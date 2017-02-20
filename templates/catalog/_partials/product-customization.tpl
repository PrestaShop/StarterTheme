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
