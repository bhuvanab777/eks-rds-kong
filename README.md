# About
This repository terraform code will create EKS cluster and RDS postgresql instance in AWS cloud. It will also add role to EKS cluster nodes to connect RDS database using IAM authentication.

## How to use?
- Install awscli and terraform in local computer or any server.
- Login to aws with IAM user credentials using 'aws configure' command
- Download this repo code and run below commands in downloaded directory
	- terraform init
 	- terraform validate
  - terraform plan
  - terraform apply
- Post apply complete, you will be able to see the cluster and RDS instance in AWS

## Next step
- Download kubectl to connect to EKS cluster
- Update kubeconfig using "aws eks update-kubeconfig --region us-east-1 --name demo" command
- Run below commands to create sample pod and to test db connectivity with kong user
	 - kubectl run my-shell --rm -i --tty --image ubuntu -- bash
   - apt-get update
   - apt-get install curl postgresql-client unzip -y
   - curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   - unzip awscliv2.zip
   - ./aws/install
   - export PG_HOST="demo-postgres-db.czyu48soivgy.us-east-1.rds.amazonaws.com"
   - export PG_USER="postgres"
   - export PG_DATABASE="postgres"
   - export PG_PASSWORD="postgres"
   - psql "host=$PG_HOST port=5432 dbname=$PG_DATABASE user=$PG_USER password=$PG_PASSWORD"
     - CREATE USER kong;
     - GRANT rds_iam TO kong;
     - exit
   - export PG_USER="kong"
   - export PG_PASSWORD="$(aws rds generate-db-auth-token --hostname $PG_HOST --port 5432 --region us-east-1 --username $PG_USER)"
   - psql "host=$PG_HOST port=5432 dbname=$PG_DATABASE user=$PG_USER password=$PG_PASSWORD"
   - select * from user;

	Note: Update rds security group inbound access to all for testing

## Reference
https://tech.aufomm.com/how-to-use-kong-to-authenticate-aws-rds-with-iam/
