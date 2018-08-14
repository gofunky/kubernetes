FROM alpine:3.8

ARG KUBE_LATEST_VERSION

ADD https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl /bin/
RUN chmod +x /bin/kubectl
