#基础镜像使用 mysql:latest
FROM mysql:latest

#作者
MAINTAINER xuexjie <xuexjie>

#定义会被容器自动执行的目录
ENV AUTO_RUN_DIR /docker-entrypoint-initdb.d

#定义初始化sql文件
ENV INSTALL_DB_SQL init_database.sql 
#ENV INSTALL_DB_SQL2 init_database2.sql
ENV INSTALL_DB_SQL3 init_database_view.sql

#把要执行的sql文件放到/docker-entrypoint-initdb.d/目录下，容器会自动执行这个sql
COPY ./$INSTALL_DB_SQL $AUTO_RUN_DIR/
#COPY ./$INSTALL_DB_SQL2 $AUTO_RUN_DIR/
COPY ./$INSTALL_DB_SQL3 $AUTO_RUN_DIR/

#mysql默认字符集是latain,而它是不支持中文的,utf8mb4 是 utf8 的超集并完全兼容utf8。修改字符集
COPY utf8mb4.cnf /etc/mysql/conf.d/

#给执行文件增加可执行权限
RUN chmod a+x $AUTO_RUN_DIR/$INSTALL_DB_SQL $AUTO_RUN_DIR/$INSTALL_DB_SQL3