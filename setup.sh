#! /bin/bash

# this will create a terraform.tfvars file to be used with cloud shell
cat > terraform.tfvars <<EOF
region          = "us-central1"
zone            = "us-central1-a"
location        = "us-central1-a"
project_id      = "$GOOGLE_CLOUD_PROJECT"
name            = "simple-example"
# Do not change this name it is currently hardcoded in the k8sCreds.sh file
network_name    = "terra-k8s"
subnet_cidr1    = "10.10.0.0/24"
subnet_cidr2    = "10.11.0.0/24"
EOF

terraform init

# enable GCP APIs 
gcloud services enable container.googleapis.com

gcloud services enable compute.googleapis.com
