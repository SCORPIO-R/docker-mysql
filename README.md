##### 创建MySql容器，初始化数据库(表，视图)，设置字符集

- 初始化sql文件

  - init_database.sql (**一个文件中不要超过2k行sql文，否则有可能初始化时表创建不成功**)

    创建数据库并设置字符集、创建表和试图

  - init_database_view.sql **(开头别忘记添加use my_db)**

  >  **如果前边的sql文件有任何错误信息，会导致后续的sql不执行，这个原因是导致初始化表或者视图不存在的重要原因**，如果出错可以使用下方命令查看docker的log信息

  ```dockerfile
  docker logs -f -t --tail 行数 容器名
  
  例：实时查看docker容器名为s12的最后10行日志
  $ docker logs -f -t --tail 10 s12
  ```

- 设置字符集文件Utf8mb4.cnf


> mysql使用的版本是[latest](https://hub.docker.com/layers/mysql/library/mysql/latest/images/sha256-60adb98682fd8b89b3534624d3bce0b15df6a476f92ba102a2f54b2c353a1544?context=explore) 【截止2020/03/15为止，8.0.19之后的最新版本】

---

##### docker-entrypoint-initdb.d原理

我们希望在创建实例的过程中初始化sql脚本，mysql的官方镜像支持在容器启动的时候自动执行指定的sql脚本或者shell脚本，下面是MySql官方镜像的Dockerfile：

```dockerfile
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306 33060
CMD ["mysqld"]
© 2020 GitHub, Inc.
```

设定了ENTRYPOINT，里面会调用/entrypoint.sh这个脚本，脚本其中一段内容如下：

```sh
 echo
	local f
	for f; do
		case "$f" in
			*.sh)     mysql_note "$0: running $f"; . "$f" ;;
			*.sql)    mysql_note "$0: running $f"; docker_process_sql < "$f"; echo ;;
			*.sql.gz) mysql_note "$0: running $f"; gunzip -c "$f" | docker_process_sql; echo ;;
			*)        mysql_warn "$0: ignoring $f" ;;
		esac
		echo
	done
```

也就是说会自动遍历docker-entrypoint-initdb.d目录下所有的.sh和.sql后缀的文件，所以只需要将需要初始化的sql文放到该目录下即可实现DB的初始化。

###### 使用docker命令创建容器时直接初始化数据库：

所以即使不使用Dockerfile的方式，直接在使用docker命令创建mysql容器时也可以初始化数据库：

- 数结构如下：

​		-- run.bat/run.sh

​		-- inti.sql

> run.bat/run.sh

```sh
basepath=$(cd `dirname $0`; pwd) #获取当前执行路径
docker run -dit --name mysql_1 -p 3306:3306 -v ${basepath}:/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=123456  mysql /bin/bash 
#将当前路径映射到docker-entrypoint-initdb.d下，这样只要在当前执行路径下添加sql或者sh文件，那么在执行docker命令时会自动执行sql或者sh文件
```

> init.sql

```sql
-- 创建数据库
DROP database IF EXISTS `mysql_db`;
create database `mysql_db` default character set utf8 collate utf8_general_ci;
use mysql_db;
```

