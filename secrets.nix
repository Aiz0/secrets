let
  hosts = [
    "frieren"
    "holo"
    "miyabi"
    "sakurasou"
  ];

  users = [
    "aiz_frieren"
    "aiz_miyabi"
    "aiz_sakurasou"
  ];

  systemKeys = builtins.map (host: builtins.readFile ./publicKeys/root_${host}.pub) hosts;
  userKeys = builtins.map (user: builtins.readFile ./publicKeys/${user}.pub) users;
  keys = systemKeys ++ userKeys;
in {
  "tailscale/auth.age".publicKeys = keys;
  "tailscale/caddyAuth.age".publicKeys = keys;
  "arr/bazarrApiKey.age".publicKeys = keys;
  "arr/lidarrApiKey.age".publicKeys = keys;
  "arr/prowlarrApiKey.age".publicKeys = keys;
  "arr/radarrApiKey.age".publicKeys = keys;
  "arr/sonarrApiKey.age".publicKeys = keys;
  "kavita/tokenKey.age".publicKeys = keys;
  "git/workConfig.age".publicKeys = keys;
  "pds/holo.age".publicKeys = keys;
  "grafana/secretKey.age".publicKeys = keys;
  "multiScrobbler/environment.age".publicKeys = keys;
  "acme/environment.age".publicKeys = keys;
}
