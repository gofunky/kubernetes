FROM alpine:3.11.6
MAINTAINER matfax <mat@fax.fyi>

ARG KUBE_LATEST_VERSION

WORKDIR /app

ADD https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/
RUN chmod +x /usr/local/bin/kubectl

ENTRYPOINT ["kubectl"]
