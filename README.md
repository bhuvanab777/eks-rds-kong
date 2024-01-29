update kubeconfig
=================
aws eks update-kubeconfig --region us-east-1 --name demo

ubuntu shell pod
================
kubectl run my-shell --rm -i --tty --image ubuntu -- bash

apt-get update
apt-get install curl postgresql-client unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

export PG_HOST="demo-postgres-db.czyu48soivgy.us-east-1.rds.amazonaws.com"
export PG_USER="postgres"
export PG_DATABASE="postgres"
export PG_PASSWORD="postgres"
psql "host=$PG_HOST port=5432 dbname=$PG_DATABASE user=$PG_USER password=$PG_PASSWORD"

CREATE USER kong;
GRANT rds_iam TO kong;

export PG_USER="kong"
export PG_PASSWORD="$(aws rds generate-db-auth-token --hostname $PG_HOST --port 5432 --region us-east-1 --username $PG_USER)"

psql "host=$PG_HOST port=5432 dbname=$PG_DATABASE user=$PG_USER password=$PG_PASSWORD"

rds security group update inbound access to all

reference
=========
https://tech.aufomm.com/how-to-use-kong-to-authenticate-aws-rds-with-iam/
