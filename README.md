# Ansible
Ansible containerization playbook


## Usage
**You will likely need to mount required directories into your container to make it run 

### Basic 

```
docker pull tbola45/ansible:latest
docker run --rm -it tbola45/ansible:latest bash
```
### Mount local directory and ssh key

```
docker run --rm -t -v $(pwd):/ansible -v ~/.ssh:/root/.ssh tbola45/ansible:latest bash
```

### Parse in env variable, mount local directory and ssh key

```
docker run --rm -t -v $(pwd):/ansible -v ~/.ssh:/root/.ssh -e ANSIBLE_STDOUT_CALLBACK=debug -e AWS_ACCESS_KEY_ID=<AWS ACCESS KEY> -e AWS_SECRET_ACCESS_KEY=<AWS SECRET ACCESS KEY> -e AWS_DEFAULT_REGION="us-east-1" -e WORKSPACE=/ansible tbola45/ansible:latest bash
```

## Deployment Sample

```
docker run --rm -t -v $(pwd):/ansible -v ~/.ssh:/root/.ssh -e ANSIBLE_STDOUT_CALLBACK=debug -e AWS_ACCESS_KEY_ID=<AWS ACCESS KEY> -e AWS_SECRET_ACCESS_KEY=<AWS SECRET ACCESS KEY> -e AWS_DEFAULT_REGION="us-east-1" -e WORKSPACE=/ansible tbola45/ansible:latest bash -c 'ansible-playbook playbook.yml -i ec2.py -l "tag_Env_staging:&tag_App_box1" -f 5 -u ec2-user -e env=staging'
```
