# EC2-Docker-Git-Setup
A Bash script that installs Git, Docker engine, Docker-compose, runs Docker services and adds them to run at AMI boot time.
It also moves your id_rsa ssh keypair for github to ~/.ssh/ and adds it to the agent so you can access verificated.
## How to use it
Copy the .sh file to your EC2 instance and run with
```bash
sh name_of_bash_file.sh
```
If you want to manage your ssh keypair, you will need to enter 'y' when the prompt comes up and have you id_rsa and id_rsa.pub stored in the same directory with .sh initialization file.

