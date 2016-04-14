# Tomcat
此镜像基于anapsix/alpine-java:jre8，用的是Oracle server jre8，tomcat-8.0.33，构建完只有158M，解决了国内使用的时区问题，可以在开发或生产环境中使用

### 运行命令
```
$ docker run -d --name tomcat -p 8080:8080 362228416/tomcat
```
#### 部署方式1
```
$ docker cp ROOT.war tomcat:/tomcat/webapps/
```
#### 部署方式2
a、创建一个Dockerfile，内容如下：

```
FROM 362228416/tomcat
ADD ROOT.war /tomcat/webapps/ROOT.war
```
b、构建一个新的镜像

```
$ docker build -t myapp .
$ docker run -d --name myapp -p 8080:8080 myapp
```
