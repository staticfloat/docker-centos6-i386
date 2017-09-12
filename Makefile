IMG_NAME=staticfloat/centos-i386:centos6

# Default is to build the image, including the bootstrap image
all: build

build_out/centos6.tar.gz: bootstrap.sh
	mkdir -p build_out
	docker run --rm -ti -v $(shell pwd):/src -v /var/run/docker.sock:/var/run/docker.sock -w /src centos:6 ./bootstrap.sh

build: build_out/centos6.tar.gz
	docker build --squash -t $(IMG_NAME) .

push: build
	docker push $(IMG_NAME)

clean:
	rm -rf build_out
	docker rmi -f $(IMG_NAME)
