%include ./xfce-workstation.ks
%include ./workstation.ks

%packages

-virtualbox-guest-additions

%end

%post --erroronfail

grubby --args="i915.enable_psr=0 i915.mitigations=off i915.disable_power_well=1 i915.enable_fbc=1" --update-kernel=ALL

%end