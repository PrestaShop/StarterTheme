<section id="content" class="page-content page-not-found">
  {block name='page_content'}
    <p>{l s='Sorry for the inconvenience.' d='Shop.Theme'}</p>

    {block name='search'}
      {hook h='displaySearch'}
    {/block}

    {block name='hook_not_found'}
      {hook h='displayNotFound'}
    {/block}
  {/block}
</section>
