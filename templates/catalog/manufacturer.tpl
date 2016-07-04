{extends file=$layout}

{block name='content'}
  <section id="main">

    {block name='manufacturer_header'}
      <h1>{l s='List of products by brand %brand_name%' sprintf=['%brand_name%'=> $manufacturer.name] d='Shop.Theme.Catalog'}</h1>
      <div id="manufacturer-short_description">{$manufacturer.short_description nofilter}</div>
      <div id="manufacturer-description">{$manufacturer.description nofilter}</div>
    {/block}

    {block name='manufacturer_products'}
      {include file='catalog/products.tpl' products=$products}
    {/block}

  </section>
{/block}
