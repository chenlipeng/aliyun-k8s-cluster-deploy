# 部署环境
CentOS 8.4 64位系统（其他系统部署会有一些差异）

# 文件说明
```
.
├── daemon.json     #docker 配置文件
├── k8s-master.sh   #用来部署master节点
├── k8s-node.sh     #用来部署worker节点
├── kubernetes.repo #用来设置k8s资源地址
├── pre-deploy.sh   #部署前步骤，会重启服务器
└── README.md

0 directories, 6 files
```
# 部署master节点
```
#step 1 会重启服务器
sh pre-deploy.sh

#step 2
sh k8s-master.sh
```

# 部署worker节点
若有多个worker节点，在每个节点上执行下面操作
```
#step 1 会重启服务器
sh pre-deploy.sh

#step 2
sh k8s-node.sh

#step 3
#该命令来自master节点部署后的输出 样例如下：
kubeadm join 172.19.34.118:6443 --token ecvvxh.lbboz5uk93zf7p3n --discovery-token-ca-cert-hash sha256:06d6a6f0d3d48f1a1c20de96c8b13964a331081ff497e12fc05712d1e6c115fc
```

![image](https://user-images.githubusercontent.com/9048716/134044751-05454162-edd0-4e4f-a822-c2b4b2d00596.png)
