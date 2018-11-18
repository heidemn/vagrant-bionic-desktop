Based on my answer to this SO question (which is based on the other answers):
https://stackoverflow.com/questions/18878117/using-vagrant-to-run-virtual-machines-with-desktop-environment/53363591#53363591 

```
# Optional - enlarge disk (default = 10 GB).
# (Will also convert the disk from VMDK to VDI.)
# If you don't want this, comment the corresponding line in the Vagrantfile.
vagrant plugin install vagrant-disksize

vagrant up
vagrant reload

# After reboot, the VM screen should show the LightDM login screen.
# Log in as user "vagrant", password "vagrant".
```
