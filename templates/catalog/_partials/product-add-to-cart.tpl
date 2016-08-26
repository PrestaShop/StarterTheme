<div class="product-add-to-cart">
  {if !$configuration.is_catalog}

    {block name='product_quantity'}
      <p class="product-quantity">
        <label for="quantity_wanted">{l s='Quantity'}</label>
        <input
          type="number"
          name="qty"
          id="quantity_wanted"
          value="{$product.quantity_wanted}"
          class="input-group"
          min="{$product.minimal_quantity}"
        >
      </p>
    {/block}

    {block name='product_minimal_quantity'}
      <p class="product-minimal-quantity">
      {if $product.minimal_quantity > 1}
          {l
            s='The minimum purchase order quantity for the product is %quantity%.'
            d='Shop.Theme.Checkout'
            sprintf=['%quantity%' => $product.minimal_quantity]
          }
      {/if}
      </p>
    {/block}

    <button class="add-to-cart" type="submit" name="add" data-button-action="add-to-cart" {if !$product.add_to_cart_url}disabled{/if}>
      {l s='Add to cart' d='Shop.Theme.Actions'}
    </button>

    {hook h='displayProductButtons' product=$product}
  {/if}
</div>
