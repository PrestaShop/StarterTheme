{block name='login_form'}

  {block name='login_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form id="login-form" action=" {block name='login_form_actionurl'}{$action}{/block}" method="post">

    <section class="form-fields">
      {block name='form_fields'}
        {foreach from=$formFields item="field"}
          {block name='form_field'}
            {form_field field=$field}
          {/block}
        {/foreach}
      {/block}

      <p class="lost_password">
        <a href="{$urls.pages.password}" rel="nofollow">
          {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
        </a>
      </p>
    </section>

    {block name='login_form_footer'}
      <footer class="form-footer">
        <input type="hidden" name="submitLogin" value="1">
        {block name='form_buttons'}
          <button data-link-action="sign-in" type="submit">{l s='Sign in' d='Shop.Theme.Actions'}</button>
        {/block}
      </footer>
    {/block}

  </form>
{/block}
