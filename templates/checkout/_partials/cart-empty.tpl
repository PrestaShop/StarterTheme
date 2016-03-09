{extends file=$layout}

{block name='content'}

  <p>{l s='Oh no! Your shopping cart is empty'}</p>
  <a href="{$allProductsLink}">{l s='Add some products'}</a>
  
{/block}
