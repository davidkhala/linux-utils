docker-hub() {
	docker login registry.hub.docker.com
}
ocr() {
	curl https://raw.githubusercontent.com/davidkhala/oracle/main/container/login | bash 
}
ocir() {
	local username=${username:-'davidkhala@gmail.com'}
	local tenancy_namespace=${tenancy_namespace:-cn9yc2hk0gzg}
	local region_key=${region_key:-'ap-singapore-1'}

	echo Please use auth_token as password...
	docker login $region_key.ocir.io --username $tenancy_namespace/$username

}
redhat() {
	docker login registry.redhat.io
}
aws-public() {
	# When authenticating to a public registry, always authenticate to the us-east-1 Region when using the AWS CLI.
	
	aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/davidkhala
}
aws-shared(){
	aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
}
aws-private() {
	aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $aws_account_id.dkr.ecr.$region.amazonaws.com
}
$@
