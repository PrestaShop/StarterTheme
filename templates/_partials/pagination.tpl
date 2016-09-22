<nav class="pagination">
  {l s='Showing %from%-%to% of %total% item(s)' sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items] d='Shop.Theme.Catalog'}
  <ul>
    {foreach from=$pagination.pages item="page"}
      <li {if $page.current} class="current" {/if}>
        {if $page.type === 'spacer'}
          <span class="spacer">&hellip;</span>
        {else}
          <a
            rel="{if $page.type === 'previous'}prev{elseif $page.type === 'next'}next{else}nofollow{/if}"
            href="{$page.url}"
            class="{['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
          >
            {if $page.type === 'previous'}
              {l s='Previous' d='Shop.Theme.Actions'}
            {elseif $page.type === 'next'}
              {l s='Next' d='Shop.Theme.Actions'}
            {else}
              {$page.page}
            {/if}
          </a>
        {/if}
      </li>
    {/foreach}
  </ul>
</nav>
