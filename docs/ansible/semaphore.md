<figure markdown="span">
![HEADER](/images/semaphore.png){ width="108" height="128" }
<figcaption> Automation the ez way. 🚀 </figcaption>
</figure>

## Intro

Are you tired of manually remoting into your servers and updating them? Well today I have a treat for you. We're going to set up Ansible but with a GUI. Because everyone loves GUI's.

## Setting up Semaphore

We're going to use the docker approach here. As It's quick and easy and can be easily managed and updated.

### Installing Docker

You can follow the docs [here](https://docs.docker.com/engine/install/) to install docker. I also have a really nice script that I made that installs docker and also portainer if you like to manage docker with a GUI as well.

```shell
curl -ssL https://raw.githubusercontent.com/coloredbytes/ez-docker-installer/master/install.sh | bash
```
Once this step is all done we can get to the fun part of installing Semaphore

### Installing Semaphore

```yaml
---
version: '3'
services:
  semaphore:
    image: semaphoreui/semaphore:v2.10.22
    container_name: semaphore
    hostname: semaphore
    ports:
      - "3000:3000"
    environment:
      - SEMAPHORE_DB_DIALECT=bolt
      - SEMAPHORE_ADMIN=admin
      - SEMAPHORE_ADMIN_PASSWORD=changeme
      - SEMAPHORE_ADMIN_NAME=Admin
      - SEMAPHORE_ADMIN_EMAIL=admin@localhost
    volumes:
      - semaphore_data:/var/lib/semaphore
      - semaphore_config:/etc/semaphore
      - tmp_config:/tmp/semaphore
    restart: unless-stopped

volumes:
  semaphore_data:
  semaphore_config:
  tmp_config:
```

How ever you spin up docker containers. Wether it's with `docker-compose` from the cli or using portainer to setup the stack itself once that is all done you should be able to access the application at `IP:3000`.

