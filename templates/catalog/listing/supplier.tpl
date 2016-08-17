{*
 * With this file, we display all product from a supplier the same way than any other page
 * but we want a different header so we give more details about the supplier.
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
  <h1>
    {l s='List of products by supplier %supplier_name%' sprintf=['%supplier_name%' => $supplier.name] d='Shop.Theme.Catalog'}
  </h1>
  <div id="supplier-description">{$supplier.description nofilter}</div>
{/block}
