-- MUST use [use my_db] at first line, or sql will not be executed
use my_db;

CREATE TABLE `table_name` (
  `file1` varchar(2) NOT NULL COMMENT 'zhushi bufen',
  `file2` varchar(30) DEFAULT NULL,
  `file3` bit(1) DEFAULT NULL COMMENT 'zhushi',
  `file4` date NOT NULL DEFAULT '1900-01-01' COMMENT 'zhushi',
  `file5` datetime DEFAULT NULL,
  PRIMARY KEY (`file1`,`file3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='biao zhushi';
