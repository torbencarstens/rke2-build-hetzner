# Terraform for rke2 on hetzner

CD is done via terraform cloud (https://app.terraform.io/app/torbencarstens/workspaces/rke2-build-hetzner/runs), set to auto-apply.

## 1. Setup
create env file, e.g.:

```
export TF_VAR_clustername=CLUSTER
export TF_VAR_domain=YOURDOMAIN
export TF_VAR_hcloud_token=HETZNER_TOKEN_WITH_WRITE
export TF_VAR_api_token=HETZNER_TOKEN
export TF_VAR_rke2_cluster_secret=SOMESECRETTOJOINNODES
```

Then source it
```bash
source file
```

## 2. Initialize terraform
```bash
terraform init
```

## 3. Create cluster
```bash
terraform apply
```

**Optional**: Adjust number of workers in main.tf, check vars.tf

Now wait until load balancer is all green.

## 4. Setup kubectl
```bash
ssh -l root <anymasterip> cat /etc/rancher/rke2/rke2.yaml
```

Replace `127.0.0.1` of the output with either your domain that you point to the lb external ip, or with the lb external ip directly, and place to `~/.kube/config`.

Check
```bash
kubectl get nodes
```

## Generate terraform variables

**api_token** (`hcloud_token`): goto your hetzner cloud project -> `Security` -> `API TOKENS` (`https://console.hetzner.cloud/projects/{project_id}/security/token`)

**domain**: whereever your k8s cluster should be accessible at (e.g. k8s.example.com)

**clustername**: name of your cluster (e.g. rke2)

**rke2_cluster_secret**: secret token for your cluster (generate random password)

**ssh_pub_key**: pub-key which will be distributed to every server

