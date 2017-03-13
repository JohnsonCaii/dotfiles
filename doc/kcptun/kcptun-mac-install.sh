# download source
wget https://github.com/xtaci/kcptun/releases/download/v20170308/kcptun-darwin-amd64-20170308.tar.gz

tar -xvf kcptun-darwin-amd64-20170308.tar.gz

rm kcptun-darwin-amd64-20170308.tar.gz server_darwin_amd64

echo "echo your-password | sudo -S ./client_darwin_amd64 -l :port -mode mode -r ip:port --crypt crypt_method" >> start_kcptun.sh

chmod +x start_kcptun.sh

echo "install kcptun successful, please fill your config in start_kcptun.sh file"
