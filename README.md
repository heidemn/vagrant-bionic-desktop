# Ubuntu 18.04 LTS desktop box (for Vagrant)

Based on [my answer](https://stackoverflow.com/questions/18878117/using-vagrant-to-run-virtual-machines-with-desktop-environment/53363591#53363591) to this SO question (which is itself based on the other answers):

## How to run it

Only tested on VirtualBox.

If you're fine with the default disk size of 10 GB, you can skip the plugin installation, and remove the `config.disksize` line from the Vagrantfile.

After the reboot, the VM screen should show the LightDM login screen.
Log in as user "vagrant", password "vagrant".

```
vagrant plugin install vagrant-disksize

vagrant up
vagrant reload
```
