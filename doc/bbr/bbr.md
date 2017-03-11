## 版权
Copying from [here](https://github.com/iMeiji/shadowsocks_install/wiki/%E5%BC%80%E5%90%AFTCP-BBR%E6%8B%A5%E5%A1%9E%E6%8E%A7%E5%88%B6%E7%AE%97%E6%B3%95)

## 正文

BBR 目的是要尽量跑满带宽, 并且尽量不要有排队的情况, 效果并不比速锐差

Linux kernel 4.9 已支持 tcp_bbr 下面简单讲述基于KVM架构VPS如何开启  

更新:  
[OpenVZ 架构VPS开启BBR](https://www.91yun.org/archives/4996)

## Debian 8 / Ubuntu 14

- 下载最新内核,最新内核查看[这里](http://kernel.ubuntu.com/~kernel-ppa/mainline)  
```
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/linux-image-4.10.0-041000-generic_4.10.0-041000.201702191831_amd64.deb
```

- 安装内核
```
dpkg -i linux-image-4.10.0*.deb
```

-  删除旧内核(可选)
```
dpkg -l|grep linux-image 
apt-get purge 旧内核
```

- 更新 grub 系统引导文件并重启
```
update-grub
reboot
```

## CentOS 6

- 下载更换内核  
最新内核查看[这里](http://elrepo.org/linux/kernel/el6/x86_64/RPMS/)
```
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml -y
```

- 查看内核是否安装成功  
```
rpm -qa | grep kernel
```

- 删除旧内核(可选)  
```
rpm -ev 旧内核  
```

- 更新 grub 系统引导文件并重启
```
sed -i 's:default=.*:default=0:g' /etc/grub.conf
reboot
```
开不了机的打开vps后台控制面板的vnc, 开机卡在 grub 引导, 只需要手动选择内核就可以了


## CentOS 7

- 下载更换内核  
最新内核查看[这里](http://elrepo.org/linux/kernel/el7/x86_64/RPMS/)
```
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml -y
```

- 查看内核是否安装成功  
```
rpm -qa | grep kernel
```

- 删除旧内核(可选)  
```
rpm -ev 旧内核  
```

- 更新 grub 系统引导文件并重启
```
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
grub2-set-default 0  #default 0表示第一个内核设置为默认运行, 选择最新内核就对了
reboot
```
- 注意，某些服务商（如[Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-update-a-digitalocean-server-s-kernel )）可能需要首先将VPS配置为可自定义内核，然后grub2的配置才会生效。

## 开启bbr
开机后 `uname -r`  看看是不是内核4.9  

执行  
```
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
```

保存生效  
`sysctl -p`  

执行  
```
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
```
如果结果都有`bbr`, 则证明你的内核已开启bbr  

执行  
`lsmod | grep bbr`  
看到有 tcp_bbr 模块即说明bbr已启动  BBR 目的是要尽量跑满带宽, 并且尽量不要有排队的情况, 效果并不比速锐差

Linux kernel 4.9 已支持 tcp_bbr 下面简单讲述基于KVM架构VPS如何开启  

更新:  
[OpenVZ 架构VPS开启BBR](https://www.91yun.org/archives/4996)

## Debian 8 / Ubuntu 14

- 下载最新内核,最新内核查看[这里](http://kernel.ubuntu.com/~kernel-ppa/mainline)  
```
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/linux-image-4.10.0-041000-generic_4.10.0-041000.201702191831_amd64.deb
```

- 安装内核
```
dpkg -i linux-image-4.10.0*.deb
```

-  删除旧内核(可选)
```
dpkg -l|grep linux-image 
apt-get purge 旧内核
```

- 更新 grub 系统引导文件并重启
```
update-grub
reboot
```

## CentOS 6

- 下载更换内核  
最新内核查看[这里](http://elrepo.org/linux/kernel/el6/x86_64/RPMS/)
```
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml -y
```

- 查看内核是否安装成功  
```
rpm -qa | grep kernel
```

- 删除旧内核(可选)  
```
rpm -ev 旧内核  
```

- 更新 grub 系统引导文件并重启
```
sed -i 's:default=.*:default=0:g' /etc/grub.conf
reboot
```
开不了机的打开vps后台控制面板的vnc, 开机卡在 grub 引导, 只需要手动选择内核就可以了


## CentOS 7

- 下载更换内核  
最新内核查看[这里](http://elrepo.org/linux/kernel/el7/x86_64/RPMS/)
```
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml -y
```

- 查看内核是否安装成功  
```
rpm -qa | grep kernel
```

- 删除旧内核(可选)  
```
rpm -ev 旧内核  
```

- 更新 grub 系统引导文件并重启
```
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
grub2-set-default 0  #default 0表示第一个内核设置为默认运行, 选择最新内核就对了
reboot
```
- 注意，某些服务商（如[Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-update-a-digitalocean-server-s-kernel )）可能需要首先将VPS配置为可自定义内核，然后grub2的配置才会生效。

## 开启bbr
开机后 `uname -r`  看看是不是内核4.9  

执行  
```
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
```

保存生效  
`sysctl -p`  

执行  
```
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
```
如果结果都有`bbr`, 则证明你的内核已开启bbr  

执行  
`lsmod | grep bbr`  
看到有 tcp_bbr 模块即说明bbr已启动  
