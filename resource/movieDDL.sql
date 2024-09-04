DROP DATABASE IF EXISTS movieDB_Team3;
CREATE DATABASE movieDB_Team3;
USE movieDB_Team3;

CREATE TABLE `character` (
	`ch_num`	int primary key auto_increment	NOT NULL,
	`ch_role`	char(2)	NULL,
	`ch_name`	varchar(255)	NULL,
	`ch_birth`	date	NULL
);

CREATE TABLE `movie` (
	`mo_num`	int primary key auto_increment	NOT NULL,
	`mo_title`	varchar(255)	NULL,
	`mo_content`	longtext	NULL,
	`mo_time`	int	NULL,
	`mo_age`	varchar(20)	NULL,
	`mo_date`	date	NULL,
	`mo_genre`	varchar(10)	NULL
);

CREATE TABLE `casting` (
	`ca_num`	int primary key auto_increment	NOT NULL,
	`ca_name`	varchar(20)	NULL,
	`cs_ch_num`	int	NOT NULL,
	`cs_mo_num`	int	NOT NULL
);

CREATE TABLE `schedule` (
	`sd_num`	int primary key auto_increment	NOT NULL,
	`sd_time`	time	NULL,
	`sd_date`	date	NULL,
	`sd_earyly`	int	NULL,
	`sd_mo_num`	int	NOT NULL,
	`sd_sc_num`	int	NOT NULL
);

CREATE TABLE `screen` (
	`sc_num`	int primary key auto_increment	NOT NULL,
	`sc_name`	varchar(30)	NULL,
	`sc_seat`	int	NULL
);

CREATE TABLE `seat` (
	`se_num`	int primary key auto_increment	NOT NULL,
	`se_name`	varchar(3)	NULL,
	`se_sc_num`	int	NOT NULL
);

CREATE TABLE `member` (
	`me_id`	varchar(15) primary key	NOT NULL,
	`me_pw`	varchar(255)	NULL,
	`me_authority`	varchar(5)	NULL
);

CREATE TABLE `ticketing` (
	`ti_num`	int primary key auto_increment	NOT NULL,
	`ti_adult`	int	NULL,
	`ti_teenager`	int	NULL,
	`ti_total`	int	NULL,
	`ti_me_id`	varchar(15)	NOT NULL,
	`ti_sd_num`	int	NOT NULL
);

CREATE TABLE `price` (
	`pr_num`	int primary key auto_increment	NOT NULL,
	`pr_type`	varchar(10)	NULL,
	`pr_price`	int	NULL
);

CREATE TABLE `ticketing_list` (
	`tl_num`	int primary key auto_increment	NOT NULL,
	`tl_ti_num`	int	NOT NULL,
	`tl_se_num`	int	NOT NULL
);

