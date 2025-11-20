extract() {
	local image=$1
	docker save $image >$image.tar
}
load() {
	docker image load --input $1

}
prune() {
	echo WARNING! This will remove all images without at least one container associated to them.
	sleep 5
	docker image prune -a
}
trim(){
	# keep only the latest images
	docker images --format "{{.Repository}} {{.Tag}} {{.ID}} {{.CreatedAt}}" \
	  | sort -k1,1 -k4,4r \
	  | awk '
	    {
	      repo=$1;
	      tag=$2;
	      id=$3;
	      if (!seen[repo]++) {
	        # 第一次出现的镜像（最新），保留
	        print "保留: " repo ":" tag " (" id ")";
	      } else {
	        # 其他的删除
	        print id;
	      }
	    }
	  ' \
	  | grep -v "^保留" \
	  | xargs -r docker rmi

}

build() {
	local imageName=$1
	local buildContext=${2:-.}
	# --progress=plain --no-cache: to display full output during build
	# See in: https://stackoverflow.com/questions/52915701/displaying-help-messages-while-docker-build
	docker build --tag="$imageName" --progress=plain --no-cache "$buildContext"
}

$@
