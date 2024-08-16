<figure markdown="span">
![HEADER](./images/tux.png){ width="108" height="128" }
<figcaption> Mounting an NFS share. 🚀 </figcaption>
</figure>


# Welcome :wave: 


## Intro

Hello Folks, Today We're going to learn one of the cool things in linux and that is mounting an external Network share.


## Setting up the Share

Provided you have the share itself setup. I'll be showing here how to mount the share.

### CLI
    
First you'll want to make sure you have NFS Client installed.

- **Debian/Ubuntu**:

```shell
sudo apt update
sudo apt install nfs-common
```

- **CentOS/RHEL:**

```shell
sudo yum install nfs-utils
```

Once that is done we'll need to make a Mount Point for this.

- That can be done like this

```shell
sudo mkdir -p /mnt/nfs_share
```
- Once the Mount Point is made. We can Mount it

```shell
sudo mount -t nfs nfs_server_ip:/path/to/nfs_share /mnt/nfs_share
```
I'll break down this commands for you here.

- `mount -t nfs` - Issue's the mount command with the type of `nfs`.
- `nfs_server_ip` - The IP of the server.
- `/path/to/nfs_share` - Path on the target server.
- `/mnt/nfs_share` - Where the Share will be mounted on the server.

Once that is done we can test to make sure the share is mounted correctly by running a 

```shell
df -h | grep nfs
```
If all looks good then we have mounted the share at least for this session. But we want this to happen on evrey boot. Thaat can be done by adding a simmple line to the `/etc/fstab`.

```shell
echo "192.168.1.100:/export/shared /mnt/nfs_share nfs defaults 0 0" | sudo tee -a /etc/fstab
```

Running that snippet will add it to that file but please change the varibles as most likely you're mount is not the exact same as the example.

After that is done go ahead and run a `tail /etc/fstab` to make sure the line has been added to the file. If you see the line you added you're all set then just issue a `mount -a` and you'll be all set. If you have any lines that you don't want re mounted make sure they are commented out or just run `sudo mount /mnt/nfs_share` to mount that specific entry.

After that is all done the mount sould stay persistnet even after reboots.

### Cockpit 

<iframe width="560" height="315" src="https://www.youtube.com/embed/PGCBda3Le9Y?si=ccmR-BPg5JssM-1Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

I've shared this video here found on youtube to better show how it'd done. While it is old the only diffrence is instead of the `+` in storage there is a hamburger menu instead.


## Epilouge
With all that being said, this is how you can mount shares in Linux. I hope you learned something here, and make sure to come back for more tutorials. 









