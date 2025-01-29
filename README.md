Notes:

This config file will build a single VM on my Proxmox host by cloning a saved template.


Issues:

Cloned VM is stuck in a bootloop and has duplicate hard drives.

Fixed: Config file had a HD size that was different than the template. Making the size match the clone resulted in a successful boot. Suspcecting this is related to the Full vs Linked clone.
         Confirmed. Proxmox Documentation shows this is an issue with Full vs Linked clones. Full clones MUST have the same HD size as the template. https://pve.proxmox.com/wiki/VM_Templates_and_Clones
