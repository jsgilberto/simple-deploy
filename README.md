
# Simple deployment on EC2 with Ansible

Command used for creating inventory file

```sh
aws ec2 describe-instances \
   --query 'Reservations[*].Instances[*].PublicIpAddress' \
   --filters "Name=tag:name,Values=udacity" \
   --output text >> inventory
```


To run locally:
```sh
ansible-playbook ansible/main-remote.yml --verbose --ask-become-pass
```

```sh
/usr/local/bin/pipenv run gunicorn \
   --workers 3 \
   --bind 127.0.0.1:8000 app:app \
   --pythonpath /home/ubuntu/simple-deploy/src/
```
