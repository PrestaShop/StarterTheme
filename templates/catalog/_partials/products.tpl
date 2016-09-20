<section id="products">
  {if $listing.products|count}
      <h1>{l s='Products' d='Shop.Theme.Catalog'}</h1>

      {block name='sort_by'}
        {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
      {/block}

      <div class="products">
        {foreach from=$listing.products item="product"}
          {block name='product_miniature'}
            {include file='catalog/_partials/miniatures/product.tpl' product=$product}
          {/block}
        {/foreach}
      </div>

      {block name='pagination'}
        {include file='_partials/pagination.tpl' pagination=$listing.pagination}
      {/block}
  {else}
    {include file='errors/not-found.tpl'}
  {/if}
</section>
