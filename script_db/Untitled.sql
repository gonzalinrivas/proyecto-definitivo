CREATE database IF NOT EXISTS `company`;

use company;

CREATE TABLE `employees`(
	id INT( 11 ) NOT NULL auto_increment ,
    name varchar( 45 ) NOT NULL DEFAULT '',
    salary int( 11 ) default NULL,
    primary key ( id ) 
);

describe `employees`;