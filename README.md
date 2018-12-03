# cisco-ansible-dc
This repository is meant to be a companion to the Cisco Live session DEVNET-2190 on design patterns for Cisco DC infrastructure automation using Ansible.

# What is the goal of this repo?
The main goal is teaching you how to leverage Ansible as an automation tool for Cisco DC infrastructure. What are the tricks we can use? What Ansible features would make more sense? How to set-up your inventory? And what are some examples on how to leverage Ansible roles with Cisco infra? Is Ansible for ACI the same as Ansible for NX-OS? And what about servers? These are some of the questions I aim to help answer!

The goal here is NOT teaching you, in depth, the details of each Ansible modules for Cisco DC infrastructure - but I'll of course point where you can learn more about each of them and where to exercise them independently.

Finally, this is a living and evolving repository. I'll be, as time permits, adding more examples and design patterns - so check the repo often! And of course, feel free to branch it and create your own stuff!


# What additional resources can be leveraged? Is there any testing gear I can leverage?
If we are talking about automation, you'll need something to automate :) Therefore, you can use your own real or virtual gear - NX-OS switches, UCS Manager and ACI APICs are what we focus on with our code here.

If you don't have the resources right now, or just want to learn/have a feeling on how Cisco DC automation with Ansible works, you can reserver them in Cisco's demo environment called dCloud - dcloud.cisco.com. To have access to it, you'll need a CEC ID (Cisco.com ID). Also, you can request your Cisco Account team or Partner to share a demo session with you!

The specific demo environment we use is called "Cisco DevNet Express Data Center v2". Whenever you are on the dCloud website, make sure to login and then search for this demo environment. Then book it, and dCloud will give you all the details on how to access your virtual resources (VPN credentials, Guacamole credentials, etc).

What is included in the dCloud environment?
 - 2x NXOSv instances
 - 1x UCSM (UCS Platform Emulator)
 - 1x virtual APIC
 
This lab was chosen since it can give us several flavors of Cisco DC infrastructure (switches, SDN and servers) - and therefore, we can exercise our design patterns more easily. 
 
Another good resources is the Cisco DevNet Sandbox - https://developer.cisco.com/site/sandbox/ . You can have on-demand access to virtual Nexus 9Ks, more recent versions of ACI, UCS, Intersight...the only 'caveat' is that the majority of them are for one piece of the infrastructure only - but very good for exercising your Ansible skills nonetheless!

# Understood. What do I need to install to get rolling?
You can leverage your own Ansible installation - many of the playbooks here are assuming Ansible 2.5 or greater. Also, you'll need [ucsmsdk](https://github.com/CiscoUcs/ucsmsdk) - as it is needed in your Ansible control station for running UCS playbooks.

BUT - if you are lazy just like myself, I've created [a container in DockerHub with everyhing you need](https://hub.docker.com/r/carlosmscabral/cisco-ansible-dc/) - Ansible, ucsmsdk, the correct version of Python, etc. The goal here is NOT having all the source code / Ansible playbooks embedded into the container, but rather a consistent running environment.  I like to use a simple [bind mount](https://docs.docker.com/storage/bind-mounts/) so I can share the contents of my laptop (where the code I've got from GitHub is) with the container runtime. Why? Because I like to have my native IDE (I use VSCode, but pick yours, of course!) to edit things, and also use all the binaries from the container without messing up with my local stuff. 

This is the look-and-feel I personally like working on - integrated IDE, terminal, etc.

![ide-picture](https://github.com/carlosmscabral/cisco-ansible-dc/blob/master/docs/ide_snapshot.png)

And this is the command I use (assumes *nix environment).

```bash
docker run -d -it --name dc --mount type=bind,source="$(pwd)"/,target=/ansible carlosmscabral/cisco-dc-ansible
```

The 'source' directory on the above command is where I've cloned this repository to. So, assuming you are using the container I provided and have already cloned the code from this repo, all you need to do is attach to your running container (`docker attach dc` as per the example above), get to your bind mount directory (`/ansible` as per the example as well) and then you can start having your Ansible fun with Cisco DC infrastructure!

# Resources / Links / Additional Content
 

 
