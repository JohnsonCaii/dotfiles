FROM ubuntu:latest

ENV BCH_VERSION 0.18.2
ENV BCH_URL https://download.bitcoinabc.org/${BCH_VERSION}/linux/bitcoin-abc-${BCH_VERSION}-x86_64-linux-gnu.tar.gz
ENV BCH_DATA /data
ENV BCH_BIN_DIR /usr/local/bitcoin-cash

COPY entrypoint /entrypoint.sh

ADD $BCH_URL /tmp/bitcoin-cash.tar.gz

RUN cd /tmp \
    && mkdir "$BCH_BIN_DIR" \
	&& tar -xzvf bitcoin-cash.tar.gz -C "$BCH_BIN_DIR" --strip-components=1 --exclude=*-qt \
	&& rm bitcoin-cash.tar.gz \
	&& addgroup bitcoin && adduser --gecos "" --home /home/bitcoin --disabled-password --ingroup bitcoin bitcoin \
	&& mkdir "$BCH_DATA" \
	&& chown -R bitcoin:bitcoin "$BCH_DATA" \
	&& ln -sfn "$BCH_DATA" /home/bitcoin/.bitcoin \
	&& chown -h bitcoin:bitcoin /home/bitcoin/.bitcoin \
	&& chmod +x /entrypoint.sh \
	&& apt-get update -y \
	&& apt-get install curl lsof -y

USER bitcoin

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8332 8333 18332 18333


