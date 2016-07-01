<section id="products">
  {if $products|count}
      <h1>{l s='Products' d='Shop.Theme.Catalog'}</h1>

      {block name='sort_by'}
        {include file='catalog/_partials/sort-orders.tpl' sort_orders=$sort_orders}
      {/block}

      <div class="products">
        {foreach from=$products item="product"}
          {block name='product_miniature'}
            {include file='catalog/_partials/miniatures/product.tpl' product=$product}
          {/block}
        {/foreach}
      </div>

      {block name='pagination'}
        {include file='catalog/_partials/pagination.tpl' pagination=$pagination}
      {/block}
  {/if}
</section>
