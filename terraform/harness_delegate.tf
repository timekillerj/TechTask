data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
  depends_on = [module.eks]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
  depends_on = [module.eks]
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    token                  = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  }
}

module "delegate" {
  source  = "harness/harness-delegate/kubernetes"
  version = "0.1.8"

  account_id       = var.harness_account_id
  delegate_token   = var.harness_delegate_token
  delegate_name    = "techtaskdel"
  deploy_mode      = "Kubernetes"
  namespace        = "harness-delegate-ng"
  manager_endpoint = var.harness_manager_endpoint
  delegate_image   = "harness/delegate:yy.mm.verno"
  replicas         = 1
  upgrader_enabled = false

  values = yamlencode({
    javaOpts = "-Xms64M"
  })
}