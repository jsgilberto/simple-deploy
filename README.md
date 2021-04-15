
# Simple deployment on EC2 with Ansible

Command used for creating inventory file

```sh
aws ec2 describe-instances \
   --query 'Reservations[*].Instances[*].PublicIpAddress' \
   --filters "Name=tag:name,Values=udacity" \
   --output text >> inventory
```
