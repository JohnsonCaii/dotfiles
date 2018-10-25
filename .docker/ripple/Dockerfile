FROM ubuntu:latest

RUN export LANGUAGE=C.UTF-8; export LANG=C.UTF-8; export LC_ALL=C.UTF-8; export DEBIAN_FRONTEND=noninteractive

COPY entrypoint /entrypoint.sh

RUN apt-get update -y && \
    apt-get install yum-utils alien ssh openssl nano curl -y && \
    cd /tmp && \
    wget https://mirrors.ripple.com/ripple-repo-el7.rpm && \
    rpm -Uvh ripple-repo-el7.rpm && \
    yumdownloader --enablerepo=ripple-stable --releasever=el7 rippled && \
    wget https://mirrors.ripple.com/rpm/RPM-GPG-KEY-ripple-release && \
    rpm --import RPM-GPG-KEY-ripple-release && rm RPM-GPG-KEY-ripple-release && rpm -K rippled*.rpm && \
    alien -i --scripts rippled*.rpm && rm rippled*.rpm && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh

EXPOSE 80 443 5005 5006 6006 51235

ENTRYPOINT [ "/entrypoint.sh" ]