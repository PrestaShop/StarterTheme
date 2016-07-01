{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  {if $customer.is_logged && !$customer.is_guest}

    <p class="identity">{l s='Connected as %first_name% %last_name%.' sprintf=['%first_name%' => $customer.firstname, '%last_name%' => $customer.lastname] d='Shop.Theme.CustomerAccount'}</p>
    <p>{l s='Not you? [1]Log out[/1]' tags=["<a href='{$urls.actions.logout}'>"] d='Shop.Theme.CustomerAccount'}</p>
    <p><small>{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</small></p>

  {elseif $show_login_form}

    <a href="{$urls.pages.order}">{l s='No account?' d='Shop.Theme.CustomerAccount'}</a>
    {render file='checkout/_partials/login-form.tpl' ui=$login_form}

  {else}

    <a data-link-action="show-login-form" href="{$urls.pages.order_login}">{l s='Already have an account?' d='Shop.Theme.CustomerAccount'} </a>
    {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}

  {/if}
{/block}
