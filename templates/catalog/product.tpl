{extends file=$layout}

{block name='head_seo' prepend}
    <link rel="canonical" href="{$product.canonical_url}" />
{/block}

{block name='head' append}
    <meta property="og:type" content="product" />
    <meta property="og:url" content="{$urls.current_url}" />
    <meta property="og:title" content="{$page.title}" />
    <meta property="og:site_name" content="{$shop.name}" />
    <meta property="og:description" content="{$page.description}" />
    <meta property="og:image" content="{$product.cover.large.url}" />
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}" />
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}" />
    <meta property="product:price:amount" content="{$product.price_amount}" />
    <meta property="product:price:currency" content="{$currency.iso_code}" />
    {if isset($product.weight) && ($product.weight != 0)}
        <meta property="product:weight:value" content="{$product.weight}" />
        <meta property="product:weight:units" content="{$product.weight_unit}" />
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
                    {block name='product_labels'}
                        <ul class="product-labels">
                            {foreach from=$product.labels item=label}
                                <li>{$label.label}</li>
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
                                    <label>{l s='Reference'}:</label>
                                    <span itemprop="sku">{$product.reference}</span>
                                </p>
                            {/if}
                        {/block}

                        {block name='product_condition'}
                            {if $product.condition}
                                <p id="product-condition">
                                    <label>{l s='Condition'}:</label>
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
                            {if $display_quantities}
                                <p id="product-quantities">{$product.quantity} {$quantity_label}</p>
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
                                    <label>{l s='Availability date:'} </label>
                                    <span>{$product.availability_date}</span>
                                </p>
                            {/if}
                        {/block}

                        {block name='product_out_of_stock'}
                            <div class="product-out-of-stock">
                                {hook h='actionProductOutOfStock' product=$product}
                            </div>
                        {/block}

                        {block name='product_extra_right'}
                            <div class="product-extra-right">
                                {hook h='displayRightColumnProduct'}
                            </div>
                        {/block}

                        {* StarterTheme: Content Only *}
                        {block name='product_extra_left'}
                            <div class="product-extra-left">
                                {hook h='displayLeftColumnProduct'}
                            </div>
                        {/block}
                        {* StarterTheme: Content Only End *}
                    </div>

                    <div class="product-actions">
                        {block name='product_buy'}
                            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                                <input type="hidden" name="token" value="{$static_token}" />
                                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id" />

                                {block name='product_prices'}
                                    {include file='catalog/_partials/product-prices.tpl'}
                                {/block}

                                {block name='product_variants'}
                                    {include file='catalog/_partials/product-variants.tpl'}
                                {/block}

                                {block name='product_add_to_cart'}
                                    {if $product.add_to_cart_url}
                                        {*<form class="add-to-cart" action="{$urls.pages.cart}" method="post">*}

                                        {block name='product_quantity'}
                                            <p class="product-quantity">
                                                <label for="quantity_wanted">{l s='Quantity'}</label>
                                                <input type="number" min="1" name="qty" id="quantity_wanted" value="{$product.quantity_wanted}" />
                                            </p>
                                        {/block}

                                        {block name='product_minimal_quantity'}
                                            {if $product.minimal_quantity > 1}
                                                <p class="product-minimal-quantity">
                                                    {l s='The minimum purchase order quantity for the product is %s.' sprintf=$product.minimal_quantity}
                                                </p>
                                            {/if}
                                        {/block}

                                        <button class="add-to-cart" type="submit" name="add" data-button-action="add-to-cart">{l s='Add to cart'}</button>

                                        {hook h='displayProductButtons' product=$product}
                                        {*</form>*}
                                    {/if}
                                {/block}

                                {block name='product_refresh'}
                                    <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" value="{l s='Refresh'}" />
                                {/block}
                            </form>
                        {/block}
                    </div>

                    {* StarterTheme: Content Only *}

                    {block name='product_discounts'}
                        {if $quantity_discounts}
                            <section class="product-discounts">
                                <h3>{l s='Volume discounts'}</h3>
                                <table class="table-product-discounts">
                                    <thead>
                                    <tr>
                                        <th>{l s='Quantity'}</th>
                                        <th>{if $display_discount_price}{l s='Price'}{else}{l s='Discount'}{/if}</th>
                                        <th>{l s='You Save'}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
                                        <tr data-discount-type="{$quantity_discount.reduction_type}" data-discount="{$quantity_discount.real_value}" data-discount-quantity="{$quantity_discount.quantity}">
                                            <td>{$quantity_discount.quantity}</td>
                                            <td>{$quantity_discount.discount}</td>
                                            <td>{l s='Up to %s' sprintf=$quantity_discount.save}</td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </section>
                        {/if}
                    {/block}

                    {block name='product_customization'}
                        {include file='catalog/_partials/product-customizations.tpl' customizations=$product.customizations}
                    {/block}

                    {block name='product_features'}
                        {if $product.features}
                            <section class="product-features">
                                <h3>{l s='Data sheet'}</h3>
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
                                <h3>{l s='Pack content'}</h3>
                                {foreach from=$packItems item="product_pack"}
                                    {block name='product_miniature'}
                                        {include file='catalog/pack-product-miniature.tpl' product=$product_pack}
                                    {/block}
                                {/foreach}
                            </section>
                        {/if}
                    {/block}

                    {block name='product_accessories'}
                        {if $accessories}
                            <section class="product-accessories">
                                <h3>{l s='Accessories'}</h3>
                                {foreach from=$accessories item="product_accessory"}
                                    {block name='product_miniature'}
                                        {include file='catalog/product-miniature.tpl' product=$product_accessory}
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
                                <h3>{l s='Download'}</h3>
                                {foreach from=$product.attachments item=attachment}
                                    <div class="attachment">
                                        <h4><a href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")}">{$attachment.name}</a></h4>
                                        <p>{$attachment.description}</p>
                                        <a href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")}">
                                            {l s='Download'} ({Tools::formatBytes($attachment.file_size, 2)})
                                        </a>
                                    </div>
                                {/foreach}
                            </section>
                        {/if}
                    {/block}
                    {* StarterTheme: Content Only End *}
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
