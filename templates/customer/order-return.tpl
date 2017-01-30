{extends file='customer/page.tpl'}

{block name='page_title'}
  <h1>{l s='Return details' d='Shop.Theme.Customeraccount'}</h1>
{/block}

{block name='page_content'}

  {block name='order_return_infos'}
    <div id="order-return-infos">
      <h3>
        {l
          s='%number% on %date%'
          d='Shop.Theme.Customeraccount'
          sprintf=['%number%' => $return.return_number, '%date%' => $return.return_date]
        }
      </h3>
      <p>{l s='We have logged your return request.' d='Shop.Theme.Customeraccount'}</p>
      <p>
        {l
          s='Your package must be returned to us within %number% days of receiving your order.'
          d='Shop.Theme.Customeraccount'
          sprintf=['%number%' => $configuration.number_of_days_for_return]
        }
      </p>
      <p>
        {* [1][/1] is for a HTML tag. *}
        {l
          s='The current status of your merchandise return is: [1] %status% [/1]'
          d='Shop.Theme.Customeraccount'
          sprintf=[
            '[1]' => '<strong>',
            '[/1]' => '</strong>',
            '%state%' => $return.state_name
          ]
        }
      </p>
      <p>{l s='List of items to be returned:' d='Shop.Theme.Customeraccount'}</p>
    </div>
  {/block}

  <table>
    <thead>
      <tr>
        <th>{l s='Reference' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Product' d='Shop.Theme.Catalog'}</th>
        <th>{l s='Quantity' d='Shop.Theme.Checkout'}</th>
      </tr>
    </thead>
    <tbody>
    {foreach from=$products item=product}
      <tr>
        <td>{$product.product_reference}</td>
        <td>{$product.product_name}
          {if $product.customizations}
            <br />
            {foreach $product.customizations as $customization}
              <ul>
                {foreach from=$customization.fields item=field}
                  {if $field.type == 'image'}
                    <li><img src="{$field.image.small.url}" alt=""></li>
                  {elseif $field.type == 'text'}
                    <li>{$field.label} : {if (int)$field.id_module}{$field.text nofilter}{else}{$field.text}{/if}</li>
                  {/if}
                {/foreach}
              </ul>
            {/foreach}
          {/if}
        </td>
        <td>
          {if $product.customizations}
            {$product.product_quantity}
          {else}
            {foreach $product.customizations as $customization}
              {$customization.quantity}
            {/foreach}
          {/if}
        </td>
      </tr>

    {/foreach}
    </tbody>
  </table>

  {if $return.state == 2}
    <section>
      <h3>{l s='Reminder' d='Shop.Theme.Customeraccount'}</h3>
      <ul>
        <li>
          {l
            s='All merchandise must be returned in its original packaging and in its original state.'
            d='Shop.Theme.Customeraccount'
          }
        </li>
        <li>
          {* [1][/1] is for a HTML tag. *}
          {l
            s='Please print out the [1]returns form[/1] and include it with your package.'
            d='Shop.Theme.Customeraccount'
            sprintf=[
              '[1]' => '<a href="'|cat:$return.print_url|cat:'">',
              '[/1]' => '</a>'
            ]
          }
        </li>
        <li>
          {* [1][/1] is for a HTML tag. *}
          {l
            s='Please check the [1]returns form[/1] for the correct address.'
            d='Shop.Theme.Customeraccount'
            sprintf=[
              '[1]' => '<a href="'|cat:$return.print_url|cat:'">',
              '[/1]' => '</a>'
            ]
          }
        </li>
      </ul>
      {l
        s='When we receive your package, we will notify you by email. We will then begin processing order reimbursement.'
        d='Shop.Theme.Customeraccount'
      }
      <br><br>
      <a href="{$urls.pages.contact}">
        {l
          s='Please let us know if you have any questions.'
          d='Shop.Theme.Customeraccount'
        }
      </a>
      <p>
        {l
          s='If the conditions of return listed above are not respected, we reserve the right to refuse your package and/or reimbursement.'
          d='Shop.Theme.Customeraccount'
        }
      </p>
    </section>
  {/if}

{/block}
