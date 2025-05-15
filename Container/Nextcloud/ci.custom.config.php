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

$ciDefaultapp = getenv('CI_DEFAULTAPP');
if ($ciDefaultapp) {
  $CONFIG['defaultapp'] = $ciDefaultapp;
}

$ciMaintenanceWindowStart = getenv('CI_MAINTENANCE_WINDOW_START');
if ($ciMaintenanceWindowStart) {
  $CONFIG['maintenance_window_start'] = $ciMaintenanceWindowStart;
}


$ciTrashbinRetentionObligation = getenv('CI_TRASHBIN_RETENTION_OBLIGATION');
if ($ciTrashbinRetentionObligation) {
  $CONFIG['trashbin_retention_obligation'] = $ciTrashbinRetentionObligation;
} 

$ciVersionsRetentionObligation = getenv('CI_VERSIONS_RETENTION_OBLIGATION');
if ($ciVersionsRetentionObligation) {
  $CONFIG['versions_retention_obligation'] = $ciVersionsRetentionObligation;
}

$ciFilelockingEnabled = getenv('CI_FILELOCKING_ENABLED');
if ($ciFilelockingEnabled) {
  $CONFIG['filelocking.enabled'] = $ciFilelockingEnabled;
} 
