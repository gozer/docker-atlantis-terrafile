FROM runatlantis/atlantis:v0.16.1

ARG TERRAFILE_VERSION=0.6
ARG AWS_IAM_AUTHENTICATOR_VERSION=0.5.1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN wget -O- https://github.com/coretech/terrafile/releases/download/v${TERRAFILE_VERSION}/terrafile_${TERRAFILE_VERSION}_Linux_x86_64.tar.gz | tar zxvf - \
  && mv terrafile /usr/local/bin/terrafile

RUN wget -O/usr/local/bin/aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${AWS_IAM_AUTHENTICATOR_VERSION}/aws-iam-authenticator_${AWS_IAM_AUTHENTICATOR_VERSION}_linux_amd64 && \
  chmod 755 /usr/local/bin/aws-iam-authenticator
