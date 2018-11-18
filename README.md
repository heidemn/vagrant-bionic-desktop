# Ubuntu 18.04 LTS desktop box (for Vagrant)

Based on [my answer](https://stackoverflow.com/questions/18878117/using-vagrant-to-run-virtual-machines-with-desktop-environment/53363591#53363591) to a StackOverflow question (which is itself based on the other answers).

Only tested on VirtualBox.

## Customize

If you aren't using VirtualBox, or if you're fine with the default disk size of 10 GB:

- Skip the plugin installation.
- Remove the `config.disksize...` line from the Vagrantfile.

## How to run it

```
vagrant plugin install vagrant-disksize

vagrant up
vagrant reload
```

After the reboot, the VM screen should show the LightDM login screen.
Log in as user "vagrant", password "vagrant".
