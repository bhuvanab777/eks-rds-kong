//vpc variables
vpc_cidr = "10.0.0.0/16"
private_subnet1_cidr = "10.0.0.0/19"
private_subnet2_cidr = "10.0.32.0/19"
public_subnet1_cidr = "10.0.64.0/19"
public_subnet2_cidr = "10.0.96.0/19"

//eks variables
eks_name = "demo"
eks_role_name = "eks-cluster-demo"
eks_node_role_name = "eks-node-group-role"
eks_node_group_name = "public-nodes"  
eks_node_type = [ "t3.small" ]
eks_nodes_capacity_type = "ON_DEMAND"
eks_node_min_count = 1
eks_node_max_count = 2

//rds variables
rds_name = "demo-postgres-db"
rds_db_engine = "postgres"
rds_db_engine_version = "15.4"
rds_username = "postgres"
#rds_password = "postgres"
rds_db_instance_type = "db.t3.micro"
rds_public_access = true
rds_iam_db_auth = true
rds_iam_db_auth_user = "kong"