<aside id="notifications">

  {if $notifications.error}
    {block name='notifications_error'}
      <article class="notification notification-danger" role="alert" data-alert="danger">
        <ul>
          {foreach $notifications.error as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </article>
    {/block}
  {/if}

  {if $notifications.warning}
    {block name='notifications_warning'}
      <article class="notification notification-warning" role="alert" data-alert="warning">
        <ul>
          {foreach $notifications.warning as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </article>
    {/block}
  {/if}

  {if $notifications.success}
    {block name='notifications_success'}
      <article class="notification notification-success" role="alert" data-alert="success">
        <ul>
          {foreach $notifications.success as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </article>
    {/block}
  {/if}

  {if $notifications.info}
    {block name='notifications_info'}
      <article class="notification notification-info" role="alert" data-alert="info">
        <ul>
          {foreach $notifications.info as $notif}
            <li>{$notif}</li>
          {/foreach}
        </ul>
      </article>
    {/block}
  {/if}

</aside>
