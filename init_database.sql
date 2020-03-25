-- 建库,设置字符集
CREATE DATABASE IF NOT EXISTS my_db default character set utf8 collate utf8_general_ci;

-- 切换数据库
use my_db;

-- 设置用户名和密码
ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY '123456';

CREATE TABLE `table_name` (
  `file1` varchar(2) NOT NULL COMMENT 'zhushi bufen',
  `file2` varchar(30) DEFAULT NULL,
  `file3` bit(1) DEFAULT NULL COMMENT 'zhushi',
  `file4` date NOT NULL DEFAULT '1900-01-01' COMMENT 'zhushi',
  `file5` datetime DEFAULT NULL,
  PRIMARY KEY (`file1`,`file3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='biao zhushi';