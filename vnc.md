### Vnc server端
安装
- 参考具体linux distro的vncserver安装方式

运行  
1. $ `vncserver -geometry 1280x1024` 
2. 输入校验密码，用于vnc客户端，然后vncserver会在后台运行, `:1` 会话将对应`5901/tcp`


终止：`vncserver —kill :1`


### VNC Client段操作
用于OCI VCN
1. Establish SSH tunnel from localhost to remote vnc server
   1. $ `ssh -L 5901:localhost:5901 -i <vncserver private key> opc@<vncserver>`
   1. tunnel会在这个terminal里持续存在，并作为localhost:5901的服务，不要关
2. 打开vnc可视化软件如VNC viewer，连接到localhost:5901

其他计算平台
- 打开vnc可视化软件如VNC viewer，直接连接到<vncserver>:5901







