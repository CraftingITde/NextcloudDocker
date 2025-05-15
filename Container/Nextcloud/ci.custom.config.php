<?php

$ciTrustedDomains = getenv('CI_TRUSTED_DOMAINS');
if ($ciTrustedDomains) {
  $CONFIG['trusted_domains'] = array_filter(array_map('trim', explode(' ', $ciTrustedDomains)));
}

$ciAllowLocalRemoteServers = getenv('CI_ALLOW_LOCAL_REMOTE_SERVERS');
if ($ciAllowLocalRemoteServers) {
  $CONFIG['allow_local_remote_servers'] = $ciAllowLocalRemoteServers;
}

$ciDatadirectory = getenv('CI_DATADIRECTORY');
if ($ciDatadirectory) {
  $CONFIG['datadirectory'] = $ciDatadirectory;
}