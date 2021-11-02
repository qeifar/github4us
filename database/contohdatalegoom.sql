DROP DATABASE IF EXISTS contohdatalegoom;

CREATE DATABASE IF NOT EXISTS contohdatalgoom /*!40100 DEFAULT CHARACTER SET latin1 */;

USE contohdatalegoom;

DROP TABLE IF EXISTS cities;

CREATE TABLE IF NOT EXISTS cities (

id int(11) NOT NULL AUTO_INCREMENT,

cities varchar(254) DEFAULT NULL,

lat varchar(50) DEFAULT NULL,

lng varchar(50) DEFAULT NULL,

country varchar(50) DEFAULT NULL,

admin_name varchar(50) DEFAULT NULL,

PRIMARY KEY (id)

) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;



DELETE FROM cities;

/*!40000 ALTER TABLE cities DISABLE KEYS */;

INSERT INTO cities (id, cities, lat, lng, country, admin_name) VALUES

(1, 'Kuala Lumpur', '3.1478', '101.6953', 'Malaysia', 'Kuala Lumpur'),

(2, 'Klang', '3.0333', '101.45', 'Malaysia', 'Selangor'),

(3, 'Ipoh', '4.6', '101.07', 'Malaysia', 'Perak'),

(4, 'Butterworth', '5.3942', '100.3664', 'Malaysia', 'Pulau Pinang'),

(5, 'George Town', '5.4145', '100.3292', 'Malaysia', 'Pulau Pinang'),

(6, 'Petaling Jaya', '3.1073', '101.6067', 'Malaysia', 'Selangor'),

(7, 'Kuantan', '3.8167', '103.3333', 'Malaysia', 'Pahang'),

(8, 'Shah Alam', '3.0833', '101.5333', 'Malaysia', 'Selangor'),

(9, 'Johor Bahru', '1.4556', '103.7611', 'Malaysia', 'Johor'),

(10, 'Kota Bharu', '6.1333', '102.25', 'Malaysia', 'Kelantan'),

(11, 'Melaka', '2.1889', '102.2511', 'Malaysia', 'Melaka'),

(12, 'Kota Kinabalu', '5.975', '116.0725', 'Malaysia', 'Sabah'),

(13, 'Seremban', '2.7297', '101.9381', 'Malaysia', 'Negeri Sembilan'),

(14, 'Sandakan', '5.8388', '118.1173', 'Malaysia', 'Sabah'),

(15, 'Sungai Petani', '5.65', '100.48', 'Malaysia', 'Kedah'),

(16, 'Kuching', '1.5397', '110.3542', 'Malaysia', 'Sarawak'),

(17, 'Kuala Terengganu', '5.3303', '103.1408', 'Malaysia', 'Terengganu'),

(18, 'Alor Setar', '6.1167', '100.3667', 'Malaysia', 'Kedah'),

(19, 'Putrajaya', '2.914', '101.7019', 'Malaysia', 'Putrajaya'),

(20, 'Kangar', '6.4414', '100.1986', 'Malaysia', 'Perlis'),

(21, 'Labuan', '5.2803', '115.2475', 'Malaysia', 'Labuan'),

(22, 'Pasir Mas', '6.0493', '102.1399', 'Malaysia', 'Kelantan'),

(23, 'Tumpat', '6.2', '102.1667', 'Malaysia', 'Kelantan'),

(24, 'Ketereh', '5.957', '102.2482', 'Malaysia', 'Kelantan'),

(25, 'Kampung Lemal', '6.0302', '102.1413', 'Malaysia', 'Kelantan'),

(26, 'Pulai Chondong', '5.8713', '102.2318', 'Malaysia', 'Kelantan');

/*!40000 ALTER TABLE cities ENABLE KEYS */;


DROP TABLE IF EXISTS college;

CREATE TABLE IF NOT EXISTS college (

id int(11) NOT NULL AUTO_INCREMENT,

name varchar(254) DEFAULT NULL,

cities varchar(254) DEFAULT NULL,

cities_id int(11) NOT NULL,

PRIMARY KEY (id),

KEY FK_college_cities (cities_id),

CONSTRAINT FK_college_cities FOREIGN KEY (cities_id) REFERENCES cities (id)

) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

DELETE FROM college;

/*!40000 ALTER TABLE college DISABLE KEYS */;

INSERT INTO college (id, name, cities, cities_id) VALUES

(1, 'UiTM', 'Shah Alam', 5),

(2, 'UiTM', 'Melaka', 7),

(3, 'USM', 'Pulau Pinang', 5),

(4, 'UKM', 'Bangi', 5),

(5, 'UM', 'Kuala Lumpur', 4);

/*!40000 ALTER TABLE college ENABLE KEYS */;



DROP TABLE IF EXISTS parent;

CREATE TABLE IF NOT EXISTS parent (

id int(11) NOT NULL AUTO_INCREMENT,

name text,

age int(11) NOT NULL DEFAULT '18',

PRIMARY KEY (id)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 

DELETE FROM parent;

/*!40000 ALTER TABLE parent DISABLE KEYS */;

INSERT INTO parent (id, name, age) VALUES

(1, 'Giselle Cantrell', 8),

(2, 'Irene Hayden', 2),

(3, 'Leilani Puckett', 1),

(4, 'Delilah Vaughan', 5),

(5, 'Britanni Spence', 0),

(6, 'Quin Kinney', 5),

(7, 'Hillary Hays', 8),

(8, 'Amanda Zamora', 2),

(9, 'Halla Simon', 0),

(10, 'Isadora Harrell', 0),

(11, 'Raya Montoya', 2),

(12, 'Amber Copeland', 9),

(13, 'Erica Odom', 3),

(14, 'Donna Olsen', 1),

(15, 'Maile Harrison', 5),

(16, 'Nyssa Ortega', 5),

(17, 'Kameko Hurst', 1),

(18, 'Charissa Petersen', 7),

(19, 'Gretchen Rodriquez', 7),

(20, 'Justine Carson', 4);

/*!40000 ALTER TABLE parent ENABLE KEYS */;
 
DROP TABLE IF EXISTS students;

CREATE TABLE IF NOT EXISTS students (

id int(11) NOT NULL AUTO_INCREMENT,

name varchar(254) DEFAULT NULL,

college_id int(11) DEFAULT NULL,

city_id int(11) DEFAULT NULL,

parent_id int(11) DEFAULT NULL,

PRIMARY KEY (id),

KEY FK_students_college (college_id),

KEY FK_students_cities (city_id),

KEY FK_students_parent (parent_id),

CONSTRAINT FK_students_cities FOREIGN KEY (city_id) REFERENCES cities (id),

CONSTRAINT FK_students_college FOREIGN KEY (college_id) REFERENCES college (id),

CONSTRAINT FK_students_parent FOREIGN KEY (parent_id) REFERENCES parent (id)

) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
 

DELETE FROM students;

/*!40000 ALTER TABLE students DISABLE KEYS */;

INSERT INTO students (id, name, college_id, city_id, parent_id) VALUES

(1, 'Dora Glenn', 1, 1, 3),

(2, 'Leilani Puckett', 1, 1, 3),

(3, 'Donna Olsen', 1, 1, 3),

(4, 'Kameko Hurst', 1, 1, 3),

(5, 'Fallon Monroe', 1, 1, 3),

(6, 'Christine Wood', 1, 1, 3),

(7, 'Fredericka Murray', 1, 1, 3),

(8, 'Rina Shaffer', 1, 1, 3),

(9, 'Madison Best', 1, 1, 3),

(10, 'Irene Hayden', 2, 1, 3),

(11, 'Amanda Zamora', 2, 1, 3),

(12, 'Raya Montoya', 2, 1, 3),

(13, 'Joy Duffy', 2, 1, 3),

(14, 'Raya Villarreal', 2, 1, 3),

(15, 'Karly Jenkins', 2, 1, 3),

(16, 'Eleanor Patrick', 2, 1, 3),

(17, 'Indigo Rice', 2, 1, 3),

(18, 'Neve Molina', 2, 1, 3),

(19, 'Inga Sandoval', 2, 1, 3),

(20, 'Alyssa Henson', 2, 1, 3),

(21, 'Sloane Sanchez', 2, 1, 3),

(22, 'Erica Odom', 3, 1, 3),

(23, 'Illana Graves', 3, 1, 3),

(24, 'Shaine Hays', 3, 1, 3),

(25, 'Fay Guy', 3, 1, 3),

(26, 'Stella Mason', 3, 1, 3),

(27, 'Madonna Roy', 3, 1, 3),

(28, 'Amanda Walters', 3, 1, 3),

(29, 'Joy Camacho', 3, 1, 3),

(30, 'Xyla Patrick', 3, 1, 3),

(31, 'Joy Aguirre', 3, 1, 3),

(32, 'Celeste Casey', 3, 1, 3),

(33, 'Justine Carson', 4, 1, 3),

(34, 'Meghan Warren', 4, 1, 3),

(35, 'Blythe Wheeler', 4, 1, 3),

(36, 'Hedy Harvey', 4, 1, 3),

(37, 'Sloane Watts', 4, 1, 3),

(38, 'Sierra Hutchinson', 4, 1, 3),

(39, 'Indigo Garcia', 4, 1, 3),

(40, 'Kessie Perez', 4, 1, 3),

(41, 'Hiroko Brennan', 4, 1, 3),

(42, 'Delilah Vaughan', 5, 1, 3),

(43, 'Quin Kinney', 5, 1, 3),

(44, 'Maile Harrison', 5, 1, 3),

(45, 'Nyssa Ortega', 5, 1, 3),

(46, 'Nayda May', 5, 1, 3),

(47, 'Eugenia Frost', 5, 1, 3),

(48, 'Debra Avila', 5, 1, 3),

(49, 'Irma Gonzales', 5, 1, 3),

(50, 'Fatima Nichols', 5, 1, 3),

(51, 'Haley Page', 5, 1, 3),

(52, 'Shelly Knowles', 5, 1, 3),

(53, 'Darrel Hobbs', 5, 1, 3),

(54, 'Illana Davis', 5, 1, 3);