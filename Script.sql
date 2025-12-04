create user 'mowaii'@'%' identified by 'mowaii';
use mysql;

select * from user;

create database menudb;
-- 권한 변경 명령어
grant all PRIVILEGES on menudb.* TO 'mowaii'@'%';

show grants for 'mowaii'@'%';

use menudb;

create table if not exists tb1 (
	pk int primary key,
	fk int,
	col1 varchar(255)
	check(col1 in ('y','n'))
) engine = innodb

-- 컬럼 정보 확인
describe tb1

-- 기본 insert 구문 insert into 테이블명 values 값
INSERT INTO tb1 VALUES (1, 10, 'Y');

select * from tb1;

create table if not exists tb2(
	pk int  auto_increment primary key,
	fk int,
	col1 varchar(255),
	check(col1 in ('y','n'))
) engine = innodb

select * from tb2
INSERT INTO tb2 VALUES (NULL, 10, 'Y');
INSERT INTO tb2 VALUES (NULL, 20, 'Y');
INSERT INTO tb2 VALUES (NULL, 10, 'Y');
select * from tb2

alter table tb2
ADD col2 INT NOT NULL;
alter table tb2
drop column col2

DESCRIBE tb2;

alter table tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

DESCRIBE tb2;

alter table tb2
modify pk int;

describe tb2;
drop primary key;


ALTER TABLE tb2
DROP PRIMARY KEY; 

DESCRIBE tb2;

ALTER TABLE tb2
ADD PRIMARY KEY(pk);

DESCRIBE tb2;

ALTER TABLE tb2
ADD col3 DATE NOT NULL,			
ADD col4 TINYINT NOT NULL;    -- 1292 에러 발생

SELECT @@GLOBAL.sql_mode;     -- MySQL 데이터베이스 서버의 전역 SQL 모드 설정을 조회하는 쿼리

set GLOBAL sql_mode = '';


SELECT @@GLOBAL.sql_mode;

ALTER TABLE tb2
ADD col3 DATE NOT NULL,			
ADD col4 TINYINT NOT NULL;  

DESCRIBE tb2;

CREATE TABLE IF NOT EXISTS tb6 (
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

insert into tb6 values(null, 10, 'y');
insert into tb6 values(null, 20, 'y');
insert into tb6 values(null, 30, 'y');
insert into tb6 values(null, 40, 'y');

select * from tb6

-- tb6 테이블 생성
CREATE TABLE IF NOT EXISTS tb6 (
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

-- 4개 행 데이터 INSERT
INSERT INTO tb6 VALUES (null, 10, 'Y');
INSERT INTO tb6 VALUES (null, 20, 'Y');
INSERT INTO tb6 VALUES (null, 30, 'Y');
INSERT INTO tb6 VALUES (null, 40, 'Y');

-- 제대로 INSERT 되었는지 확인
SELECT * FROM tb6;

TRUNCATE tb6;

SELECT * FROM tb6;
