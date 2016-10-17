<div id="js-product-list-top" class="products-selection">
  {if $listing.products|count > 1}
    <p>{l s='There are %product_count% products.' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.products|count]}</p>
  {else}
    <p>{l s='There is %product_count% product.' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.products|count]}</p>
  {/if}

  {block name='sort_by'}
    {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
  {/block}

  {l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=[
  '%from%' => $listing.pagination.items_shown_from ,
  '%to%' => $listing.pagination.items_shown_to,
  '%total%' => $listing.pagination.total_items
  ]}
</div>
