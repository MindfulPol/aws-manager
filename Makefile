IMAGE_NAME = ubuntu-aws-cli

include .env.local

build:
	docker build --build-arg AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
	             --build-arg AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
	             --build-arg AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
	             -t $(IMAGE_NAME) .

run:
	docker run --rm -it $(IMAGE_NAME)

stop:
	docker stop $(CONTAINER_NAME)

configure-aws:
	docker run --rm -it --env-file .env.local $(IMAGE_NAME) -c "\
		aws configure set aws_access_key_id '$$AWS_ACCESS_KEY_ID' && \
		aws configure set aws_secret_access_key '$$AWS_SECRET_ACCESS_KEY' && \
		aws configure set default.region '$$AWS_DEFAULT_REGION' \
	"
