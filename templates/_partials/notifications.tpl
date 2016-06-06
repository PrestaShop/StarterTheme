<aside id="notifications">

  {if $notifications.error}
    <article class="notification notification-danger" role="alert" data-alert="danger">
      <ul>
        {foreach $notifications.error as $notif}
          <li>{$notif}</li>
        {/foreach}
      </ul>
    </article>
  {/if}

  {if $notifications.warning}
    <article class="notification notification-warning" role="alert" data-alert="warning">
      <ul>
        {foreach $notifications.warning as $notif}
          <li>{$notif}</li>
        {/foreach}
      </ul>
    </article>
  {/if}

  {if $notifications.success}
    <article class="notification notification-success" role="alert" data-alert="success">
      <ul>
        {foreach $notifications.success as $notif}
          <li>{$notif}</li>
        {/foreach}
      </ul>
    </article>
  {/if}

  {if $notifications.info}
    <article class="notification notification-info" role="alert" data-alert="info">
      <ul>
        {foreach $notifications.info as $notif}
          <li>{$notif}</li>
        {/foreach}
      </ul>
    </article>
  {/if}

</aside>
