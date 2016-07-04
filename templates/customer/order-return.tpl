{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order details'}
{/block}

{block name='page_content'}

  {block name='order_return_infos'}
    <div id="order-return-infos">
      <h1>{l s='RE#%number% on %date%' d='Shop.Theme.CustomerAccount' sprintf=['%number%' => $orderRet.return_number, '%date%' => $orderRet.return_date]}</h2>
      <p>{l s='We have logged your return request.'}</p>
      <p>{l s='Your package must be returned to us within %number% days of receiving your order.' d='Shop.Theme.CustomerAccount' sprintf=['%number%' => $nbdaysreturn]}</p</p>
      <p>{l s='The current status of your merchandise return is: %state%' sprintf=['%state%' => $state_name]}</p>
      <p>{l s='List of items to be returned:'}</p>
    </div>
  {/block}

  <table>
    <thead>
      <tr>
        <th>{l s='Reference'}</th>
        <th>{l s='Product'}</th>
        <th>{l s='Quantity'}</th>
      </tr>
    </thead>
    <tbody>
    {foreach from=$products item=product}
      <tr>
        <td>{$product.product_reference}</td>
        <td>{$product.product_name}</td>
        <td>{$product.product_quantity}</td>
      </tr>
      {if $product.customizations}
        {foreach $product.customizations  as $customization}
          <tr>
            <td colspan="2">
              <ul>
                {foreach from=$customization.fields item=field}
                  {if $field.type == 'image'}
                    <li><img src="{$field.image.small.url}" alt=""></li>
                  {elseif $field.type == 'text'}
                    <li>{$field.label} : {if (int)$field.id_module}{$field.text nofilter}{else}{$field.text}{/if}</li>
                  {/if}
                {/foreach}
              </ul>
            </td>
            <td>{$customization.quantity}</td>
          </tr>
        {/foreach}
      {/if}
    {/foreach}
    </tbody>
  </table>

  {if $orderRet.state == 2}
    <section>
      <h3>{l s='Reminder'}</h3>
      <ul>
        <li>{l s='All merchandise must be returned in its original packaging and in its original state.'}</li>
        <li>
          {* [1][/1] is for a HTML tag. *}
          {l
            s='Please print out the [1]PDF return slip[/1] and include it with your package.'
            d='Shop.Theme.CustomerAccount'
            sprintf=[
              '[1]' => '<a href="'|cat:$orderRet.return_pdf_url|cat:'">',
              '[/1]' => '</a>'
            ]
          }
        </li>
        <li>
          {* [1][/1] is for a HTML tag. *}
          {l
            s='Please see the PDF return slip ([1]for the correct address[/1]).'
            d='Shop.Theme.CustomerAccount'
            sprintf=[
              '[1]' => '<a href="'|cat:$orderRet.return_pdf_url|cat:'">',
              '[/1]' => '</a>'
            ]
          }
        </li>
      </ul>
      {l s='When we receive your package, we will notify you by email. We will then begin processing order reimbursement.'}
      <br><br><a href="{$urls.pages.contact}">{l s='Please let us know if you have any questions.'}</a>
      <p>{l s='If the conditions of return listed above are not respected, we reserve the right to refuse your package and/or reimbursement.'}</p>
    </section>
  {/if}

{/block}
