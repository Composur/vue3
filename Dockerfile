FROM nginx

COPY deploy/conf.d/nginx.conf /etc/nginx/conf.d
COPY dist /usr/share/nginx/html

# 定义向外暴露的端口号，多个端口用空格做间隔，启动容器时便于使用-p将此端口向宿主机端口映射
EXPOSE 80
EXPOSE 443

# 解释 -> '-g' 'daemon off'
# nginx默认是以后台模式启动的，Docker未执行自定义的CMD之前，nginx的pid是1，
# 执行到CMD之后，nginx就在后台运行，bash或sh脚本的pid变成了1，
# 所以一旦执行完自定义CMD，nginx容器也就退出了，为了保持nginx的容器不退出，应该关闭nginx后台运行
# WORKDIR /etc/nginx
CMD ["nginx","-g","daemon off;"]


#first dockerfile

# FROM ubuntu:latest
# # RUN apt-get update
# # RUN apt-get install -y vim 
# COPY deploy/conf/nginx.conf /etc/nginx/nginx.conf
# COPY dist /usr/share/nginx/html
# # RUN apt-get install -y nginx
# # 以上执行会创建 3 层镜像。可简化为以下格式：
# RUN apt-get update && apt-get install -y vim &&  apt-get install -y nginx
# # 如上，以 && 符号连接命令，这样执行后，只会创建 1 层镜像。
# #指定运行该镜像的容器使用的端口为 80
# # docker run的时候 一定要加上 -P
# EXPOSE 80
# CMD ["nginx","-g","daemon off;"]