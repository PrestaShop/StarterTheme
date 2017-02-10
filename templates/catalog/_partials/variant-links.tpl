{block name='variant_links'}
  <div class="variant-links">
    {foreach from=$variants item=variant}

      {block name='variant_link_item'}
        <a href="{$variant.url}"
           class="{$variant.type}"
          {if $variant.type === "color"} style="background-color: {$variant.html_color_code}" {/if}
        >
          {$variant.name}
        </a>
      {/block}

    {/foreach}
  </div>
{/block}
