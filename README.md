# NetApp Ansible Container

This is a Docker container with the most current Ansible and the most current NetApp modules.

## Build Image on your own
```sh
docker build -t ntap-ansible .
```

## Pull the container from hub.docker.com
```sh
docker pull pixelchrome/ntap-ansible-container
```

## Run with Home Directory and `/etc/ansible`
```sh
docker run -d -it -v <your_ansible_home_directory>:/home/ansible -v <your_ansible_etc_directory>:/etc/ansible --name=ansible ntap-ansible
```

# Use as user *ansible*
```sh
docker exec -it ansible bash
```

# Use as *root*
```sh
docker exec -it --user root ansible bash
```