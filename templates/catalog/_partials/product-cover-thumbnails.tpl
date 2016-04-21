<div class="images-container">
  {block name='product_cover'}
    <div class="product-cover">
      <img src="{$product.cover.bySize.medium_default.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" width="{$product.cover.bySize.medium_default.width}" itemprop="image">
    </div>
  {/block}

  {block name='product_images'}
    <ul class="product-images">
      {foreach from=$product.images item=image}
        <li><img src="{$image.medium.url}" alt="{$image.legend}" title="{$image.legend}" width="100" itemprop="image"></li>
      {/foreach}
    </ul>
  {/block}
</div>
