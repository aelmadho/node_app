# node_app
Development environment for provisioning and deployment of NodeJS application.

### Requirements:

- VirtualBox 5.1.2
- Vagrant 1.8.5
- [Vagrant LandRush Plugin](https://github.com/vagrant-landrush/landrush)
- Python 2.7
- Pip & virtualenv
- Sudo on host - explicitly setup NFS for sharing application code, can be chagned to rsync in Vagrantfile

### Setup Instructions:

Assuming python and pip environment (virtualenv) is installed, install the required python packages for Ansible by running the following command:

```
pip install -r requirements.txt
```

If you do not have *virtualenv* tool, you can install Ansible under your user site-packages dir (~/.local), but you must add and adjust your PATH and PYTHONPATH accordingly to map to "$PATH:~/.local/bin" and "PYTHONPATH=$PYTHONPATH:~/.local/lib" respectively.  The command below can acheive that:

```
pip install -r requirements.txt --user
```

This will install Ansible, which you can use as part of the Vagrant provisioning process, as well as ad-hoc provisioning, or orchestrated provisioning utilziing the "ansible-playbook" command.  In order to launch the environment, run the command below to statisfy any vagrant plugin requiremnts:

```
vagrant plugin install landrush
```


### Run it!

Then follow by launching the virtual environment:

```
vagrant up
```

Navigate your browser to [web.vm](http://web.vm:8000).  


### Reference/Other:

Another example of how I utilized vagrant can be found in another github repo [vagrant-openstack](https://github.com/aelmadho/vagrant-openstack).  I utilize private networ to simulate a true cloud enviornment using Vagrant (NATed IP along with private IPs, ie host-only network).


Example Image:
![Openstack Setup](https://github.com/aelmadho/vagrant-openstack/blob/master/docs/openstack_vagrant_vbox.jpg)


### Notes:

Utilizing systemd as part of recent CentOS to utilize the concept of deploying applciations as services, and ensure consistency and idompotency.
