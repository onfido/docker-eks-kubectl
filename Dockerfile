FROM alpine:latest

RUN apk add --update curl jq

RUN cd /usr/local/bin \
    && curl -k -sS -O https://storage.googleapis.com/kubernetes-release/release/v1.11.5/bin/linux/amd64/kubectl \
    && chmod 755 /usr/local/bin/kubectl

RUN cd /usr/local/bin \
    && curl -k -sS -O https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator \
    && chmod 755 /usr/local/bin/aws-iam-authenticator

ENTRYPOINT ["kubectl"]
