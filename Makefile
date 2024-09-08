IMAGE_NAME = ubuntu-aws-cli

include .env.local

USER_ID=$(shell id -u)
GROUP_ID=$(shell id -g)

build:
	docker build --build-arg AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
	             --build-arg AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
	             --build-arg AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
				 --build-arg USER_ID=$(USER_ID) \
	             --build-arg GROUP_ID=$(GROUP_ID) \
	             -t $(IMAGE_NAME) .

run:
	docker run --rm -it \
	-v $(PWD):/root \
	-u $(USER_ID):$(GROUP_ID) \
	$(IMAGE_NAME) \
	-c "chmod -R +x /root/src/ && bash" 