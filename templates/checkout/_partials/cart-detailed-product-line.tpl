<span class="product-image"><img src="{$product.cover.small.url}"></span>
<span class="product-name"><a href="{$product.url}">{$product.name}</a></span>
{foreach from=$product.attributes key="attribute" item="value"}
  <span class="product-attributes">
    <span class="label">{$attribute}:</span>
    <span class="value">{$value}</span>
  </span>
{/foreach}
{if $product.customizations|count}
  {foreach from=$product.customizations item="customization"}
    {foreach from=$customization.fields item="field"}
      <span class="product-line-info">
        <span class="label">{$field.label}:</span>
        <span class="value">
          {if $field.type == 'text'}
            {if $field.id_module}
              {$field.text nofilter}
            {else}
             {$field.text}
            {/if}
          {elseif $field.type == 'image'}
            <img src="{$field.image.small.url}">
          {/if}
        </span>
      </span>
    {/foreach}
  {/foreach}
{/if}

<span class="product-availability">{$product.availability}</span>
<span class="product-price">{$product.price}</span>
{if $product.unit_price_full}
  <small class="sub">{$product.unit_price_full}</small>
{/if}

{if $product.down_quantity_url}
  <a href="{$product.down_quantity_url}" class="js-decrease-product-quantity" data-link-action="update-quantity">-</a>
{/if}
<span class="product-quantity">{$product.quantity}</span>
{if $product.up_quantity_url}
  <a href="{$product.up_quantity_url}" class="js-increase-product-quantity" data-link-action="update-quantity">+</a>
{/if}
<a
  class="remove-from-cart"
  data-link-action="remove-from-cart"
  data-id-product="{$product.id_product|escape:'javascript'}"
  data-id-product-attribute="{$product.id_product_attribute|escape:'javascript'}"
  href="{$product.remove_from_cart_url}"
  rel="nofollow"
 >
  {l s='Remove' d='Shop.Theme.Actions'}
</a>

{hook h='displayCartExtraProductActions' product=$product}

<span class="product-price">{$product.total}</span>
