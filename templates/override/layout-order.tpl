{extends "layout.tpl"}

{block name="header"}
    {include file="_partials/header-order.tpl"}
{/block}

{block name="content"}
    {include file="checkout/order.tpl"}
{/block}

{block name="footer"}
    {include file="_partials/footer-order.tpl"}
{/block}
