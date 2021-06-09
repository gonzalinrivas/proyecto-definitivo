CREATE DATABASE IF NOT EXISTS `final_project`;

use final_project;

CREATE TABLE `users`(
	id_user INT( 11 ) NOT NULL auto_increment ,
    name varchar( 45 ) NOT NULL DEFAULT '',
    lastname varchar( 100 ) NOT NULL DEFAULT '',
    user_name varchar( 15) NOT NULL DEFAULT '',
    password varchar( 25 ) NOT NULL ,
    leaving_date DATE NOT NULL DEFAULT '2999-12-31',
    primary key ( id_user ),
    key user_name ( user_name ),
    key password ( password )
);

use final_project;
alter table users add column `photo_url` varchar( 255 ) DEFAULT '';

insert into users values ( 1 , 'Hector' , 'Vaquero' , 'hvaquero' , '12345' , '2999-12-31');
use final_project;
update users set photo_url = "" where id_user = 1;

select * from users;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'rootpassword';
flush privileges;

insert into users values ( 2 , 'Gonzalo' , 'Rivas' , 'grivas' , '12345' , '2999-12-31');

CREATE TABLE `jobs`(
	`id_job` INT( 11 ) NOT NULL auto_increment ,
    `code` varchar(10) DEFAULT NULL,
    `description` varchar( 100 ) NOT NULL DEFAULT '',
    `job_time` float(11,2) DEFAULT NULL,
    primary key ( `id_job` )
);

insert into jobs values ( 1 , 'JOB1','Limpieza',1.5),(2,'JOB2','Lavado',2.1);
alter table jobs add column `sub_description` varchar( 255 ) DEFAULT '';
update jobs set sub_description = "Trabjo general de limpieza" where id_job = 1;

insert into jobs values ( 3 , 'JOB3','Recogida',2.1,'Recogida de elemtos de taller'),(4,'JOB4','Programacion de android',3,'programar una app android');

CREATE TABLE `planning` (
  `id_planning` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_job` int(11) unsigned NOT NULL DEFAULT '0',
  `id_user` int(11) unsigned NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_planning`),
  KEY id_user (`id_user`),
  KEY id_job (`id_job`)
);

insert into planning values ( 1 , 1 , 1 ,'2021-04-01 10:00:00', null),( 2 , 2 , 2 ,'2021-04-01 10:00:00', null);
insert into planning values ( 3 , 3 , 1 ,'2021-04-01 10:00:00', null),( 4 , 4 , 1 ,'2021-04-01 10:00:00', null);

DROP TABLE `work_times`;
CREATE TABLE `work_times` (
  `id_work_time` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) unsigned NOT NULL,
  `id_job` int(10) unsigned NOT NULL DEFAULT '0',
  `start_work` datetime NOT NULL,
  `stop_work` datetime NOT NULL,
  `total_time` int(11) NOT NULL,
  PRIMARY KEY (`id_work_time`),
  KEY `id_user` (`id_user`),
  KEY `start_work` (`start_work`),
  KEY `stop_work` (`stop_work`),
  KEY `id_job` (`id_job`)
);






