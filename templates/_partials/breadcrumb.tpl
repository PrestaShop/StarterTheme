<nav data-depth="{$breadcrumb.count}">
  <ol itemscope itemtype="http://schema.org/BreadcrumbList">
    {foreach from=$breadcrumb.links item=path name=breadcrumb}
      {block name='breadcrumb_item'}
        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
          <a itemprop="item" href="{$path.url}">
            <span itemprop="name">{$path.title}</span>
          </a>
          <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
        </li>
      {/block}
    {/foreach}
  </ol>
</nav>
