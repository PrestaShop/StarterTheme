{block name="tos_display"}
  {if !$override_tos_display}
    {include file="_partials/tos.tpl"}
  {else}
    {$override_tos_display}
  {/if}
{/block}

