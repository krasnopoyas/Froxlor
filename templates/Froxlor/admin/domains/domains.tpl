	<article>
		<header>
			<h2>
				<img src="images/Froxlor/icons/domains.png" alt="" />&nbsp;
				{t}Domains{/t}&nbsp;({$domainscount})
			</h2>
		</header>

		<section>

			<form action="{$linker->getLink(array('section' => 'domains'))}" method="post" enctype="application/x-www-form-urlencoded">

			<div class="overviewsearch">
				{$searchcode}
			</div>

			(if (($user->getData("resources", "domains_used") < $user->getData("resources", "domains")
				|| $user->getData("resources", "domains") == '-1') && 15 < $count && 0 < $countcustomers )
			)
				<div class="overviewadd">
					<img src="images/Froxlor/icons/domain_add.png" alt="" />&nbsp;
					<a href="{$linker->getLink(array('section' => 'domains', 'page' => $page, 'action' => 'add'))}">{$lng['admin']['domain_add']}</a>
				</div>
			(/if)

			<table class="bradiusodd">
				<thead>
					<tr>
						<th>{$lng['domains']['domainname']}&nbsp;{$arrowcode['d.domain']}</th>
						<th>{$lng['admin']['ipsandports']['ip']}&nbsp;{$arrowcode['ip.ip']}&nbsp;:&nbsp;{$lng['admin']['ipsandports']['port']}&nbsp;{$arrowcode['ip.port']}</th>
						<th>{$lng['admin']['customer']}&nbsp;&nbsp;{$arrowcode['c.loginname']}</th>
						<th>{$lng['panel']['options']}</th>
					</tr>
				</thead>
				<tbody>
					(foreach $domains as $domain)
					<tr>
						<td>{$domain.name}</td>
						<td>{$domain.ip}:{$domain.port}</td>
						<td>{$domain.customer}</td>
						<td>TODO: options</td>
					</tr>
					(/foreach)
				</tbody>
			</table>

			<p style="display:none;">
				<input type="hidden" name="s" value="$s" />
				<input type="hidden" name="page" value="$page" />
			</p>

			</form>

			(if $countcustomers == 0)
				<div class="warningcontainer bradius">
					<div class="warningtitle">{$lng['admin']['warning']}</div>
					<div class="warning">
						<a href="{$linker->getLink(array('section' => 'customers', 'page' => 'customers', 'action' => 'add'))}">{$lng['admin']['domain_nocustomeraddingavailable']}</a>
					</div>
				</div>
			(/if)

			(if ($user->getData("resources", "domains_used") < $user->getData("resources", "domains")
				|| $user->getData("resources", "domains") == '-1') && $countcustomers !=0
			)
				<div class="overviewadd">
					<img src="images/Froxlor/icons/domain_add.png" alt="" />&nbsp;
					<a href="{$linker->getLink(array('section' => 'domains', 'page' => $page, 'action' => 'add'))}">{$lng['admin']['domain_add']}</a>
					<br />
					<img src="images/Froxlor/icons/domain_add.png" alt="" />&nbsp;
					<a href="{$linker->getLink(array('section' => 'domains', 'page' => $page, 'action' => 'register'))}">{$lng['domain']['domain_register']}</a>
				</div>
			(/if)

		</section>
	</article>
