# KcpTun for Mac

## Download source
``` shell
wget https://github.com/xtaci/kcptun/releases/download/v20170308/kcptun-darwin-amd64-20170308.tar.gz
```

## Extract
``` shell
tar -xvf kcptun-darwin-amd64-20170308.tar.gz
```

## Launch kcptun
``` shell
sudo ./client_darwin_amd64 -l ":port" -mode server-mode -r "host:port" --crypt crypt_method
```
