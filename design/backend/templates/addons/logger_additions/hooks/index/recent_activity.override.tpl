{$_type = "log_type_`$item.type`"}
{$_action = "log_action_`$item.action`"}

{__($_type)}{if $item.action}&nbsp;({__($_action)}){/if}:


{if $item.type == "users" && "profiles.update?user_id=`$item.content.id`"|fn_url|fn_check_view_permissions:"GET"}
	{*{if $item.content.id}<a href="{"profiles.update?user_id=`$item.content.id`"|fn_url}">{/if}{$item.content.user}{if $item.content.id}</a>{/if}<br>*}
	{$item.content.user nofilter}<br>
	
{elseif $item.type == "orders" && "orders.details?order_id=`$item.content.id`"|fn_url|fn_check_view_permissions:"GET"}
	{$item.content.status}<br>
	{*<a href="{"orders.details?order_id=`$item.content.id`"|fn_url}">{__("order")}&nbsp;{$item.content.order}</a><br>*}
	{__("order")}&nbsp;{$item.content.order nofilter}<br>
	
{elseif $item.type == "products" && "products.update?product_id=`$item.content.id`"|fn_url|fn_check_view_permissions:"GET"}
	{*<a href="{"products.update?product_id=`$item.content.id`"|fn_url}">{$item.content.product}</a><br>*}
	{$item.content.product nofilter}<br>

{elseif $item.type == "categories" && "categories.update?category_id=`$item.content.id`"|fn_url|fn_check_view_permissions:"GET"}
	{*<a href="{"categories.update?category_id=`$item.content.id`"|fn_url}">{$item.content.category}</a><br>                        *}
	{$item.content.category nofilter}<br>
	
{/if}

{hook name="index:recent_activity_item"}{/hook}

<span class="date">{$item.timestamp|date_format:"`$settings.Appearance.date_format`, `$settings.Appearance.time_format`"}</span>