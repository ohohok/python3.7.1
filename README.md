# 生成python3.7.1版本的基础镜像


## 设置pip.conf

设置源配置，这里配置了自己搭建的本地源，pip install时会优先安装本地，如果找不到再安装网络上的第三方包
```
[global]
timeout=40
index-url=http://192.168.0.220:9527/simple
extra-index-url=https://pypi.tuna.tsinghua.edu.cn/simple/

[install]
trusted-host=192.168.0.220
             pypi.tuna.tsinghua.edu.cn

```

## Docker

执行下面的命令会生成一个新的python的基础镜像
```
$ docker build  -t  python-3.7.1:1.0.0 .
```

