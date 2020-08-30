ARG GOLANG_TAG=1.14.4-alpine3.12
ARG ALPINE_TAG=3.12

# ssm agenet builder
FROM golang:$GOLANG_TAG as ssm-agent-builder

ARG SSM_AGENT_VERSION=2.3.1205.0

RUN apk add --no-cache \
         'make~=4.3-r0' \
         'git~=2.26.2-r0' \
         'gcc~=9.3.0-r2' \
         'libc-dev~=0.7.2-r3' \
         'bash~=5.0.17-r0'

RUN wget -q https://github.com/aws/amazon-ssm-agent/archive/${SSM_AGENT_VERSION}.tar.gz && \
    mkdir -p /go/src/github.com && \
    tar xzf ${SSM_AGENT_VERSION}.tar.gz && \
    mv amazon-ssm-agent-${SSM_AGENT_VERSION} /go/src/github.com/amazon-ssm-agent && \
    echo ${SSM_AGENT_VERSION} > /go/src/github.com/amazon-ssm-agent/VERSION

WORKDIR /go/src/github.com/amazon-ssm-agent

RUN gofmt -w agent && make checkstyle || ./Tools/bin/goimports -w agent && \
    make build-linux

# merge image
FROM alpine:$ALPINE_TAG

RUN apk add --no-cache \
      'jq~=1' \
      'aws-cli~=1.18.55-r0' \
      'sudo~=1.9.0-r0'

RUN adduser -D ssm-user && \
    echo "Set disable_coredump false" >> /etc/sudo.conf && \
    echo "ssm-user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ssm-agent-users && \
    mkdir -p /etc/amazon/ssm

COPY --from=ssm-agent-builder /go/src/github.com/amazon-ssm-agent/bin/linux_amd64/ /usr/bin
COPY --from=ssm-agent-builder /go/src/github.com/amazon-ssm-agent/bin/amazon-ssm-agent.json.template /etc/amazon/ssm/amazon-ssm-agent.json
COPY --from=ssm-agent-builder /go/src/github.com/amazon-ssm-agent/bin/seelog_unix.xml /etc/amazon/ssm/seelog.xml

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["amazon-ssm-agent"]
