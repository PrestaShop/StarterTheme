{extends 'customer/page.tpl'}

{block name='page_title'}
  {l s='Your personal information'}
{/block}

{block name='page_content'}
  {render file='customer/_partials/customer-form.tpl' ui=$customer_form}
{/block}
