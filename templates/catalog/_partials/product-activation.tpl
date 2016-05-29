{if $page.admin_notifications}
  <div role="alert">
    {foreach $page.admin_notifications as $notif}
      <p>{$notif.message}</p>
    {/foreach}
  </div>
{/if}
