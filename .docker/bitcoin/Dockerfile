FROM ubuntu:latest

ENV BTC_URL "https://bitcoin.org/bin/bitcoin-core-0.18.0/bitcoin-0.18.0-x86_64-linux-gnu.tar.gz"
ENV BTC_DATA /data
ENV BTC_BIN_DIR /usr/local/bitcoin

COPY entrypoint /entrypoint.sh

ADD bitcoin-0.18.0-x86_64-linux-gnu.tar.gz /tmp/bitcoin.tar.gz

RUN cd /tmp \
    && mkdir "$BTC_BIN_DIR" \
	&& tar -xzvf bitcoin.tar.gz -C "$BTC_BIN_DIR" --strip-components=1 --exclude=*-qt \
	&& rm bitcoin.tar.gz \
	&& addgroup bitcoin && adduser --gecos "" --home /home/bitcoin --disabled-password --ingroup bitcoin bitcoin \
	&& mkdir "$BTC_DATA" \
	&& chown -R bitcoin:bitcoin "$BTC_DATA" \
	&& ln -sfn "$BTC_DATA" /home/bitcoin/.bitcoin \
	&& chown -h bitcoin:bitcoin /home/bitcoin/.bitcoin \
	&& chmod +x /entrypoint.sh \
	&& apt-get update -y \
	&& apt-get install curl lsof -y

USER bitcoin

ENTRYPOINT ["/entrypoint.sh"]

