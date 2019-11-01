################################################################################
##           Dockerfile to build ubuntu image with Python3.7    :xenial       ##
################################################################################
FROM ubuntu:16.04
 # add与copy的区别，add覆盖所有copy的功能，并且可以实现解压，如下所示
ADD Python-3.7.1.tgz /home
# 添加阿里云的源，加快构建
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list ;\
apt clean ;\
apt update ;\
apt -y install lsof ;\
apt -y install language-pack-zh-hans ;\
locale-gen en_US.UTF-8 ;\ 
echo "export LC_ALL=en_US.UTF-8" >> /root/.bashrc ;\ 
apt -y install vim ;\ 
apt -y install net-tools ;\ 
apt -y install iputils-ping ;\ 
apt -y install build-essential ;\ 
apt -y install zlib1g-dev libbz2-dev libssl-dev libncurses5-dev libsqlite3-dev libreadline-dev tk-dev libgdbm-dev libdb-dev libpcap-dev xz-utils libexpat1-dev liblzma-dev libffi-dev libc6-dev ;\
mkdir -p /usr/local/python3; \
cd /home/Python-3.7.1/  ;\
./configure --prefix=/usr/local/python3 --enable-optimizations ;\
make && make install ;\
ln -s /usr/local/python3/bin/python3.7 /usr/bin/python  ;\
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip ;\
pip install pip -U ;\
# 添加阿里云源
pip config set global.index-url http://mirrors.aliyun.com/pypi/simple/ ; \
pip config set global.trusted-host mirrors.aliyun.com ;\
rm -rf /home/Python-3.7.1/ ;\