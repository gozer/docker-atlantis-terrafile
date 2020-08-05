FROM runatlantis/atlantis:v0.14.0

ARG TERRAFILE_VERSION=0.6

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN wget -O- https://github.com/coretech/terrafile/releases/download/v${TERRAFILE_VERSION}/terrafile_${TERRAFILE_VERSION}_Linux_x86_64.tar.gz | tar zxvf - \
  && mv terrafile /usr/local/bin/terrafile

RUN terrafile version 2>/dev/null || true
RUN terraform version
