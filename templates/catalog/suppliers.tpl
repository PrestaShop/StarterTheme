{*
 * This is an example of supplier page, extending the brand page. We changed the title and
 * used a different template for each supplier miniature.
 * If you want the page to look the same as brands, just remove this file.
 *}
{extends file='catalog/brands.tpl'}

{block name='brand_header'}
  <h1>{l s='Suppliers' d='Shop.Theme.Catalog'}</h1>
{/block}

{block name='brand_miniature'}
  <ul>
    {foreach from=$brands item=brand}
      {include file='catalog/_partials/miniatures/supplier.tpl' brand=$brand}
    {/foreach}
  </ul>
{/block}
