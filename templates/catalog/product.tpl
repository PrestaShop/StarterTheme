{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
  <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
  <meta property="product:price:amount" content="{$product.price_amount}">
  <meta property="product:price:currency" content="{$currency.iso_code}">
  {if isset($product.weight) && ($product.weight != 0)}
    <meta property="product:weight:value" content="{$product.weight}">
    <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    {block name='product_activation'}
      {include file='catalog/_partials/product-activation.tpl'}
    {/block}

    {block name='page_header_container'}
      <header class="page-header">
        {block name='page_header'}
          <h1 itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
        {/block}
      </header>
    {/block}

    {block name='page_content_container'}
      <section id="content" class="page-content">
        {block name='page_content'}
          {block name='product_flags'}
            <ul class="product-flags">
              {foreach from=$product.flags item=flag}
                <li>{$flag.label}</li>
              {/foreach}
            </ul>
          {/block}

          {block name='product_cover_tumbnails'}
            {include file='catalog/_partials/product-cover-thumbnails.tpl'}
          {/block}

          <div class="product-information">
            {block name='product_reference'}
              {if $product.reference}
                <p id="product-reference">
                  <label>{l s='Reference' d='Shop.Theme.Catalog'}</label>
                  <span itemprop="sku">{$product.reference}</span>
                </p>
              {/if}
            {/block}

            {block name='product_condition'}
              {if $product.condition}
                <p id="product-condition">
                  <label>{l s='Condition' d='Shop.Theme.Catalog'}</label>
                  <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
                  <span>{$product.condition.label}</span>
                </p>
              {/if}
            {/block}

            {block name='product_description_short'}
              <div id="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
            {/block}

            {block name='product_description'}
              <div id="product-description">{$product.description nofilter}</div>
            {/block}

            {block name='product_quantities'}
              {if $product.show_quantities}
                <p id="product-quantities">{$product.quantity} {$product.quantity_label}</p>
              {/if}
            {/block}

            {block name='product_availability'}
              {if $product.show_availability}
                <p id="product-availability">{$product.availability_message}</p>
              {/if}
            {/block}

            {block name='product_availability_date'}
              {if $product.availability_date}
                <p id="product-availability-date">
                  <label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
                  <span>{$product.availability_date}</span>
                </p>
              {/if}
            {/block}

            {block name='product_out_of_stock'}
              <div class="product-out-of-stock">
                {hook h='actionProductOutOfStock' product=$product}
              </div>
            {/block}
          </div>

          <div class="product-actions">
            {block name='product_buy'}
              <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                {block name='product_prices'}
                  {include file='catalog/_partials/product-prices.tpl'}
                {/block}

                {block name='product_variants'}
                  {include file='catalog/_partials/product-variants.tpl'}
                {/block}


                {block name='product_add_to_cart'}
                  {include file='catalog/_partials/product-add-to-cart.tpl'}
                {/block}

                {block name='product_refresh'}
                  <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" value="{l s='Refresh' d='Shop.Theme.Actions'}">
                {/block}
              </form>
            {/block}
          </div>

          {block name='product_discounts'}
            {include file='catalog/_partials/product-discounts.tpl'}
          {/block}

          {if $product.is_customizable && count($product.customizations.fields)}
            {block name='product_customization'}
              {include file='catalog/_partials/product-customization.tpl' customizations=$product.customizations}
            {/block}
          {/if}

          {block name='product_features'}
            {if $product.features}
              <section class="product-features">
                <h3>{l s='Data sheet' d='Shop.Theme.Catalog'}</h3>
                <ul>
                  {foreach from=$product.features item=feature}
                    <li>{$feature.name} - {$feature.value}</li>
                  {/foreach}
                </ul>
              </section>
            {/if}
          {/block}

          {block name='product_pack'}
            {if $packItems}
              <section class="product-pack">
                <h3>{l s='Pack content' d='Shop.Theme.Catalog'}</h3>
                {foreach from=$packItems item="product_pack"}
                  {block name='product_miniature'}
                    {include file='catalog/_partials/pack-product.tpl' product=$product_pack}
                  {/block}
                {/foreach}
              </section>
            {/if}
          {/block}

          {block name='product_accessories'}
            {if $accessories}
              <section class="product-accessories">
                <h3>{l s='Accessories' d='Shop.Theme.Catalog'}</h3>
                {foreach from=$accessories item="product_accessory"}
                  {block name='product_miniature'}
                    {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
                  {/block}
                {/foreach}
              </section>
            {/if}
          {/block}

          {block name='product_footer'}
            {hook h='displayFooterProduct' product=$product category=$category}
          {/block}

          {block name='product_attachments'}
            {if $product.attachments}
              <section class="product-attachments">
                <h3>{l s='Download' d='Shop.Theme.Actions'}</h3>
                {foreach from=$product.attachments item=attachment}
                  <div class="attachment">
                    <h4>
                      <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                        {$attachment.name}
                      </a>
                    </h4>
                    <p>{$attachment.description}</p>
                    <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                      {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                    </a>
                  </div>
                {/foreach}
              </section>
            {/if}
          {/block}
          {foreach from=$product.extraContent item=extra key=extraKey}
            <div class="{$extra.attr}" id="extra-{$extraKey}">
              {$extra.content nofilter}
            </div>
          {/foreach}
        {/block}
      </section>
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}

  </section>

{/block}
