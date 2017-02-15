{extends file='page.tpl'}

{block name='page_title'}
  {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content password-form">
    {block name='page_content'}
      <form action="{block name='form_new_password_actionurl'}{$urls.pages.password}{/block}" method="post">

        {block name='form_new_password_header'}
          <header>
            <p>{l s='Please enter the email address you used to register. You will receive a temporary link to reset your password.' d='Shop.Theme.Customeraccount'}</p>
          </header>
        {/block}

        {block name='form_new_password_form_fields'}
          <section class="form-fields">

            <label>
              <span>{l s='Email' d='Shop.Forms.Labels'}</span>
              <input type="email" name="email" id="email" value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}">
            </label>

          </section>
        {/block}

        {block name='form_new_password_footer'}
          <footer class="form-footer">
            <button type="submit" name="submit">
              {l s='Send reset link' d='Shop.Theme.Actions'}
            </button>
          </footer>
        {/block}

      </form>
    {/block}
  </section>
{/block}

{block name='page_footer'}
  <ul>
    <li><a href="{$urls.pages.authentication}">{l s='Back to Login' d='Shop.Theme.Actions'}</a></li>
  </ul>
{/block}
