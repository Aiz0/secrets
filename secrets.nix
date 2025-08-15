let
  hosts = [
    "sakurasou"
  ];

  users = [
    "aiz_sakurasou"
  ];

   systemKeys = builtins.map (host: builtins.readFile ./publicKeys/root_${host}.pub) hosts;
   userKeys = builtins.map (user: builtins.readFile ./publicKeys/${user}.pub) users;
   keys = systemKeys ++ userKeys;
 in {
   "tailscale/auth.age".publicKeys = keys;
 }
