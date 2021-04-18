
# Simple deployment on EC2 with Ansible

In this project, a flask web app is configured in an EC2 instance using Ansible.


## Running Ansible

### Locally

Change hosts to localhost in `ansible/main-remote.yml`

And run the following command:
```sh
$ ansible-playbook ansible/main-remote.yml --verbose --ask-become-pass
```

### Remote hosts:

First, we need to define an inventory file with all the IP addresses of the 
instances where we want Ansible to connect, and for that, I created a shell
script in the `ansible` directory within this project.

To create the inventory file run the following in your terminal:

```sh
$ ansible/create_inventory.sh
```

Run the following command:

```sh
$ ansible-playbook ansible/main-remote.yml -i $INVENTORY_FILE --private-key $EC2_KEY_PATH
```
