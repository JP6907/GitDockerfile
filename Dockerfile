#Version: 1.0.1
FROM ubuntu:latest
#安装ssh服务
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh
#取消pam登录限制
RUN sed -ri 's/session   required   pam_loginuid.so/#session     required   pam_loginuid.so/g' /etc/pam.d/sshd
#添加认证文件和启动脚本
ADD authorized_keys /root/.ssh/authorized_keys
RUN echo "#!/bin/bash" > /root/run.sh
RUN echo "/usr/sbin/sshd -D" >> /root/run.sh
#导出端口
RUN chmod u+x /root/run.sh
#设置默认的启动命令
EXPOSE 22
CMD ["/root/run.sh"]