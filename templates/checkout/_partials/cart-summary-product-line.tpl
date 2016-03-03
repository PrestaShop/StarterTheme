<span class="product-quantity">{$product.quantity}</span>
<span class="product-name">{$product.name}</span>
<span class="product-price">{$product.price}</span>

{if $product.customizations|count}
    <div class="customizations">
        <ul>
            {foreach from=$product.customizations item="customization"}
                <li>
                    {if $customization.down_quantity_url}<a href="{$customization.down_quantity_url}" data-link-action="update-quantity">-</a>{/if}
                    <span class="product-quantity">{$customization.quantity}</span>
                    {if $customization.up_quantity_url}<a href="{$customization.up_quantity_url}" data-link-action="update-quantity">+</a>{/if}
                    <a href="{$customization.remove_from_cart_url}" class="remove-from-cart" rel="nofollow" data-link-action="delete-from-cart">{l s='Remove'}</a>
                    <ul>
                        {foreach from=$customization.fields item="field"}
                            <li>
                                <label>{$field.label}</label>
                                {if $field.type == 'text'}
                                    <span>{$field.text}</span>
                                {else if $field.type == 'image'}
                                    <img src="{$field.image.small.url}">
                                {/if}
                            </li>
                        {/foreach}
                    </ul>
                </li>
            {/foreach}
        </ul>
    </div>
{/if}

