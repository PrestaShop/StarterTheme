<div id="js-product-list">
  <div>
    {foreach from=$listing.products item="product"}
      {block name='product_miniature'}
        {include file='catalog/_partials/miniatures/product.tpl' product=$product}
      {/block}
    {/foreach}
  </div>

  {block name='pagination'}
    {include file='_partials/pagination.tpl' pagination=$listing.pagination}
  {/block}

  <div><a href="#header">{l s='Back to top' d='Shop.Actions'}</a></div>
</div>
