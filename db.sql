# DB 생성
DROP DATABASE IF EXISTS sprbt;
CREATE DATABASE sprbt;
USE sprbt;

# 멤버 테이블 생성
CREATE TABLE `member`(
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
regDate DATETIME NOT NULL,
updateDate DATETIME NOT NULL,
loginId CHAR(20) NOT NULL,
loginPw VARCHAR(200) NOT NULL,
`name` CHAR(10) NOT NULL,
gender CHAR(1) NOT NULL,
# 주민번호 reg_number char(14) not null,
address CHAR(30) NOT NULL,
email CHAR(20) NOT NULL,
cellPhoneNo VARCHAR(15) NOT NULL,
corp CHAR(20) NOT NULL,
authLevel TINYINT(1) UNSIGNED NOT NULL,
UNIQUE INDEX loginId (loginId),
INDEX `name` (`name`)
);


# 게시물 테이블 생성
CREATE TABLE article(
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
regDate DATETIME NOT NULL,
updateDate DATETIME NOT NULL,
memberId INT(10) UNSIGNED NOT NULL,
boardId INT(10) UNSIGNED NOT NULL,
title CHAR(100) NOT NULL,
`body` LONGTEXT NOT NULL,
INDEX title (title)
);

# 게시판 테이블 생성
CREATE TABLE board(
id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
regDate DATETIME NOT NULL,
updateDate DATETIME NOT NULL,
`name` CHAR(10) NOT NULL,
`code` CHAR(10) NOT NULL,
UNIQUE INDEX `name` (`name`),
UNIQUE INDEX `code` (`code`)
);