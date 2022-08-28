customer_name=$1
working_dir=$2
customer_env=$3
create_customer_folder=$4
tfc_api_url="https://app.terraform.io/api/v2/organizations/monisra/workspaces"

function tf-plan () {
  cd $1
  tfc_ws_full_name="vas-$2-workspaces-$3"
  mkdir .terraform && echo "$2-workspaces-$3" > .terraform/environment

  terraform init -input=false

  workspace_count=$(terraform workspace list | grep -i "$2-workspaces-$3" | wc -l)
  if [ "$workspace_count" == '0' ]; then
    terraform workspace new "$2-workspaces-$3"

    curl \
    -X PATCH --url "${tfc_api_url}/${tfc_ws_full_name}" \
    -H "Authorization: Bearer ${TF_API_TOKEN}" \
    -H "Content-Type: application/vnd.api+json" \
    -d '{"data":{"attributes":{"name":"'"${tfc_ws_full_name}"'","execution-mode":"local"},"type":"workspaces"}}';

  else
    terraform workspace select "$2-workspaces-$3"
  fi

  terraform -version
  terraform fmt -check -recursive
  terraform init
  terraform validate

  if [ "$4" == "true" ]; then
    terraform plan -input=false -lock=false -var-file="../customers/$2/$2.tfvars" -var-file="../customers/$2/$3/$3.tfvars"
  else
    terraform plan -input=false -lock=false -var-file="../customers/$2/$3/$3.tfvars"
  fi
}

tf-plan $working_dir $customer_name $customer_env $create_customer_folder