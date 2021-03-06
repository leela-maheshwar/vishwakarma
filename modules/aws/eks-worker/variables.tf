variable "aws_region" {
  type        = "string"
  default     = "us-west-2"
  description = "The AWS region"
}

variable "aws_az_number" {
  description = "How many AZs want to use"
  type    = "string"
  default = "3"
}

variable "cluster_name" {
  type        = "string"
  description = "the eks cluster name"
}

variable "enable_autoscaler" {
  default     = false
  description = "enable autoscaler or not"
}

variable "kube_node_labels" {
  type        = "list"
  default     = []
  description = "Labels to add when registering the node in the cluster. Labels must be key=value pairs."
}

variable "kube_node_taints" {
  type    = "list"
  default = []

  description = <<EOF
Register the node with the given list of taints ("<key>=<value>:<effect>").
EOF
}

variable "load_balancer_ids" {
  type        = "list"
  default     = []
  description = "A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. For ALBs, use target_group_arns instead."
}

variable "security_group_ids" {
  type    = "list"
  default = []

  description = <<EOF
    List of security group IDs for the cross-account elastic network interfaces
    to use to allow communication between your worker nodes and the Kubernetes control plane.
EOF
}

variable "subnet_ids" {
  type    = "list"
  default = []

  description = <<EOF
    List of subnet IDs. Must be in at least two different availability zones.
    Cross-account elastic network interfaces will be created in these subnets to allow
    communication between your worker nodes and the Kubernetes control plane.
EOF
}

variable "ssh_key" {
  type        = "string"
  default     = ""
  description = "The key name that should be used for the instance."
}

variable "target_group_arns" {
  type        = "list"
  default     = []
  description = "A list of aws_alb_target_group ARNs, for use with Application Load Balancing."
}

variable "extra_worker_policy_arns" {
  type        = "list"
  default     = []
  description = "The extra policy need to be attached to worker"
}

variable "worker_config" {
  type = "map"

  default = {
    instance_count   = "1"
    ec2_type_1       = "t3.medium"
    ec2_type_2       = "t2.medium"
    name             = "general"
    root_volume_iops = "100"
    root_volume_size = "256"
    root_volume_type = "gp2"

    on_demand_base_capacity                  = 0
    on_demand_percentage_above_base_capacity = 100
    spot_instance_pools                      = 1
  }

  description = "Desired worker nodes configuration."
}

variable "extra_tags" {
  type        = "map"
  default     = {}
  description = "Extra AWS tags to be applied to created resources."
}