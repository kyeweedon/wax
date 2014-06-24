
# kye
# 2014.06.16
# 2014.06.24

# build db {
create database if not exists `AIM.003`
default character set utf8
default collate utf8_bin;
# }

use `AIM.003`;

# build user {
grant
	select,
	update,
	insert,
	delete

on *
to "aim"@"localhost"
identified by "aimCanHaz?";
flush privileges;
# }

# session store {
create table if not exists `sessions` (

	`session_id` varchar(255) not null,
	`expires`    int unsigned not null,
	`data`       text,

	primary key (`session_id`)

);
# }

# build tables {
create table if not exists `Customer` (

	`id`      int unsigned not null auto_increment,
	`name`    varchar(32)  default null,
	`code`    varchar(32)  default null,
	`contact` varchar(32)  default null,
	`phone`   varchar(32)  default null,
	`email`   varchar(32)  default null,

	primary key (`id`)

);

create table if not exists `Installation` (

	`id`        int unsigned not null auto_increment,
	`machineId` int unsigned default null,
	`siteId`    int unsigned default null,
	`location`  varchar(32)  default null,
	`lease`     bool         default 1,

	primary key (`id`)

);

create table if not exists `Job` (

	`id`             int unsigned not null auto_increment,
	`jobtypeId`      int unsigned default null,
	`userId`         int unsigned default null,
	`installationId` int unsigned default null,
	`number`         varchar(32)  default null,
	`dateCreated`    varchar(32)  default null,
	`dateDue`        varchar(32)  default null,
	`dateCompleted`  varchar(32)  default null,
	`details`        text,

	primary key (`id`)

);

create table if not exists `Jobtype` (

	`id`   int unsigned not null auto_increment,
	`name` varchar(32)  default null,

	primary key (`id`)

);

create table if not exists `Machine` (

	`id`         int unsigned not null auto_increment,
	`supplierId` int unsigned default null,
	`modelId`    int unsigned default null,
	`serial`     varchar(32)  default null,
	`osv`        varchar(32)  default null,
	`acv`        varchar(32)  default null,
	`dbv`        varchar(32)  default null,
	`apv`        varchar(32)  default null,
	`asv`        varchar(32)  default null,

	primary key (`id`)

);

create table if not exists `Model` (

	`id`   int unsigned not null auto_increment,
	`name` varchar(32)  default null,

	primary key (`id`)

);

create table if not exists `Site` (

	`id`         int unsigned not null auto_increment,
	`customerId` int unsigned default null,
	`name`       varchar(32)  default null,
	`state`      varchar(32)  default null,
	`contact`    varchar(32)  default null,
	`phone`      varchar(32)  default null,
	`email`      varchar(32)  default null,

	primary key (`id`)

);

create table if not exists `Supplier` (

	`id`   int unsigned not null auto_increment,
	`name` varchar(32)  default null,

	primary key (`id`)

);

create table if not exists `User` (

	`id`       int unsigned not null auto_increment,
	`name`     varchar(32)  default null,
	`email`    varchar(32)  default null,
	`username` varchar(32)  default null,
	`password` varchar(32)  default null,

	primary key (`id`)

);
# }
