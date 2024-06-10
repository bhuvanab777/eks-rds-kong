# Kong Hybrid Deployment on EKS Cluster
## Terraform code
### VPC 
  main      
  Subnets 
  Private subnets: private-us-east-1a, private-us-east-1b
  Public subnets: public-us-east-1a, public-us-east-1b

### RDS
  demo-postgres-db
  Db engine: postgresql
  subnets: public-us-east-1a, public-us-east-1b
  Master password – used Secret Manager
  IAM DB authentication – Enabled

### EKS cluster
  demo
  Node group - public-nodes
  subnets: public-us-east-1a, public-us-east-1b

## RDS IAM auth for Kong user
CREATE USER kong;
GRANT rds_iam TO kong;
GRANT ALL PRIVILEGES ON DATABASE postgres TO kong;
GRANT ALL ON SCHEMA public TO kong;
eksctl create iamserviceaccount --name SVCACCNAME --cluster CLUSTERNAME --role-name ROLENAME --attach-policy-arn arn:aws:iam::ACC_ID:policy/rds_iam_auth_policy --approve

## Helm charts
helm repo add kong https://charts.konghq.com
helm repo update
openssl req -x509 -newkey rsa:4096 -keyout ./kong-cluster.key -out ./kong-cluster.crt -sha256 -days 1095 -nodes -subj "//C=IN\CN=kong_clustering“
### Control Plane
  kubectl create namespace kong-cp
  kubectl create secret tls kong-cluster-cert -n kong-cp --cert=kong-cluster.crt --key=kong-cluster.key
  helm install control kong/kong -n kong-cp -f hybrid-cp.yml 
### Data Plane
  kubectl create namespace kong-dp
  kubectl create secret tls kong-cluster-cert -n kong-dp --cert=kong-cluster.crt --key=kong-cluster.key
  helm install data kong/kong -n kong-dp -f hybrid-dp.yml

## Sample Requests
Service - curl -i -s -X POST http://NODE_PUBLIC_IP:ADMIN_API_NODE_PORT/services --data name=service2 --data url='https://www.example.com'

Routes - curl -i -X POST http://NODE_PUBLIC_IP:ADMIN_API_NODE_PORT/services/service2/routes  --data 'paths[]=/route2' --data name=route2

## Reference: 
https://docs.konghq.com/gateway/latest/production/deployment-topologies/hybrid-mode/
https://github.com/kong-tools/hybrid-deployments/blob/main/shared-cert/quickstart.sh
https://tech.aufomm.com/how-to-use-kong-to-authenticate-aws-rds-with-iam/
https://docs.konghq.com/gateway/latest/kong-enterprise/aws-iam-auth-to-rds-database/?_ga=2.96097308.1211095762.1717588411-239096977.1677596060