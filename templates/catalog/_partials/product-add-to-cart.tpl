<div class="product-add-to-cart">
  {if $product.add_to_cart_url}

    {block name='product_quantity'}
        <p class="product-quantity">
            <label for="quantity_wanted">{l s='Quantity'}</label>
            <input type="number" min="1" name="qty" id="quantity_wanted" value="{$product.quantity_wanted}" />
        </p>
    {/block}

    {block name='product_minimal_quantity'}
        {if $product.minimal_quantity > 1}
            <p class="product-minimal-quantity">
                {l s='The minimum purchase order quantity for the product is %s.' sprintf=$product.minimal_quantity}
            </p>
        {/if}
    {/block}

    <button class="add-to-cart" type="submit" name="add" data-button-action="add-to-cart">{l s='Add to cart'}</button>

    {hook h='displayProductButtons' product=$product}
  {/if}
</div>
