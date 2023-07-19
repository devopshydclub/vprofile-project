# Variables
CLUSTER_NAME=vprofile-eks-cluster
REGION=us-east-2
NODE_NAME=Linux-nodes
KEY_NAME=vprofile-eks-key

# Set AWS credentials before script execution

aws sts get-caller-identity >> /dev/null
if [ $? -eq 0 ]
then
  echo "Credentials tested, proceeding with the cluster creation."

  # Creation of EKS cluster
  eksctl create cluster \
  --name $CLUSTER_NAME \
  --version 1.20 \
  --region $REGION \
  --nodegroup-name $NODE_NAME \
  --nodes 2 \
  --nodes-min 1 \
  --nodes-max 4 \
  --node-type t3.micro \
  --node-volume-size 8 \
  --ssh-access \
  --ssh-public-key $KEY_NAME \
  --managed
  if [ $? -eq 0 ]
  then
    echo "Cluster Setup Completed with eksctl command."
  else
    echo "Cluster Setup Failed while running eksctl command."
  fi
else
  echo "Please run aws configure & set right credentials."
  echo "Cluster setup failed."
fi

