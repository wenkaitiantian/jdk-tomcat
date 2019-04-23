#使用的基础镜像
FROM centos:7.5.1804
#作者信息
MAINTAINER "wenkaibaba java:1.8.0_191"

#创建目录
RUN mkdir /jdk
#把当前目录下的jdk文件夹添加到镜像
ADD jdk  /jdk

#创建tomcat目录
RUN mkdir /tomcat
#把当前目录下的tomcat文件夹添加到镜像
ADD tomcat /tomcat

#添加环境变量
ENV JAVA_HOME /jdk
ENV CATALINA_HOME /tomcat
ENV PATH $PATH:$JAVA_HOME/bin
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

#暴露8080端口
EXPOSE 8080

#启动时运行tomcat
CMD ["/tomcat/bin/catalina.sh","run"]
