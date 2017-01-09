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
<div class="product-price {if $product.has_discount}has-discount{/if}">
  {if $product.has_discount}
    <div class="product-discount">
      <span class="regular-price">{$product.regular_price}</span>
      {if $product.discount_type === 'percentage'}
        <span class="discount-percentage">
          -{$product.discount_percentage_absolute}
        </span>
      {else}
        <span class="discount-amount">
          -{$product.discount_to_display}
        </span>
      {/if}
    </div>
  {/if}
  <div>
    <span class="current-price">{$product.price}</span>
    {if $product.unit_price_full}
      <div class="sub">{$product.unit_price_full}</div>
    {/if}
  </div>
</div>

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
