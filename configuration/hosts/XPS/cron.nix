{ config, pkgs, stablepkgs, attrs, ... }:

{
  services.cron = {
    enable = true; 
    systemCronJobs = [''0 23 * * Fri sh ${./../../../update.sh}''];
  };
}