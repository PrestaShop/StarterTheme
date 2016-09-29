{extends file='customer/page.tpl'}

{block name='page_title'}
  <h1>{l s='Merchandise returns'}</h1>
{/block}

{block name='page_content'}
  <h2>{l s='Here is a list of pending merchandise returns'}</h2>

  {if $ordersReturn && count($ordersReturn)}
    <table>
      <thead>
        <tr>
          <th>{l s='Return'}</th>
          <th>{l s='Order'}</th>
          <th>{l s='Package status'}</th>
          <th>{l s='Date issued'}</th>
          <th>{l s='Returns form'}</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$ordersReturn item=return}
          <tr>
            <td><a href="{$return.return_url}">{$return.return_number}</a></td>
            <td><a href="{$return.details_url}">{$return.reference}</a></td>
            <td>{$return.state_name}</td>
            <td>{$return.return_date}</td>
            <td>
              {if $return.print_url}
                <a href="{$return.print_url}">{l s='Print out'}</a>
              {else}
                --
              {/if}
            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>
  {/if}

{/block}
