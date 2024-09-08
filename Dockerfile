FROM ubuntu:latest

WORKDIR /root

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    groff \
    less \
    jq \
    && apt-get clean

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws

ARG USER_ID
ARG GROUP_ID
RUN if ! getent group ${GROUP_ID}; then groupadd -g ${GROUP_ID} dockeruser; fi && \
    if ! id -u ${USER_ID}; then useradd -l -u ${USER_ID} -g dockeruser -m dockeruser; fi
USER dockeruser

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION

ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
    AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
    AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
    AWS_CLI_AUTO_PROMPT=on-partial  

ENTRYPOINT ["/bin/bash"]
