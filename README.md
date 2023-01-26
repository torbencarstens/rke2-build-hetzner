# Terraform for rke2 on hetzner

CD is done via terraform cloud (https://app.terraform.io/app/torbencarstens/workspaces/rke2-build-hetzner/runs), set to auto-apply.

## 1. Setup
create env file, e.g.:

```
export TF_VAR_clustername=CLUSTER
export TF_VAR_hcloud_token=HETZNER_TOKEN_WITH_WRITE
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

**clustername**: name of your cluster (e.g. rke2)

**ssh_pub_key**: pub-key which will be distributed to every server
