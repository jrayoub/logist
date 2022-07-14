create database logist;
use  logist;

-- ------------------------------------tables------------------------------------
DROP table IF EXISTS user_table;
create table user_table(id int NOT NULL AUTO_INCREMENT,avatar text, full_name text,phone_number varchar(20) NOT NULL 
,  gender enum("male","female","N/A") NOT NULL ,birth_date date NOT NULL ,adrress text ,email text,
 created_date date NOT NULL, PRIMARY KEY (id), UNIQUE (phone_number));


DROP table IF EXISTS user_location;
create table user_location(id int NOT NULL AUTO_INCREMENT,user_id int ,latitude FLOAT,longitude FLOAT,accuracy FLOAT,attitude FLOAT,speed FLOAT,
speedAccuracy FLOAT ,heading FLOAT  ,time FLOAT, FOREIGN KEY (user_id) REFERENCES user_table(id), PRIMARY KEY(id));


drop table if EXISTS trailler_types;
create table trailler_types(id int NOT NULL AUTO_INCREMENT ,trailer_name text, tailer_description text,trailer_photo text,PRIMARY KEY(id) );


drop table if EXISTS shipping_method;
create TABLE shipping_method(id int NOT NULL AUTO_INCREMENT,shipping_name text, shipping_description text,shipping_photo text,PRIMARY KEY(id) );


drop table if EXISTS vehicle_type;
create TABLE vehicle_type(id int NOT NULL AUTO_INCREMENT,vehicle_type_name text, PRIMARY KEY(id) );


DROP table IF EXISTS driver;
create table driver(id int NOT NULL AUTO_INCREMENT,user_id int,nationality TEXT,identity_card text,license text,vehicle_register_number text,
                    plate_number text,identity_card_photo_front text,identity_card_photo_back text,lecense_photo text,vehicle_type_id int,
                      FOREIGN KEY (user_id) REFERENCES user_table(id), FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_type(id),PRIMARY KEY(id));


drop table if EXISTS drivers_trailler_type;
create Table drivers_trailler_type(id int NOT NULL AUTO_INCREMENT , trailer_id int, driver_id int , FOREIGN KEY (trailer_id) REFERENCES trailler_types(id), FOREIGN KEY(driver_id) REFERENCES driver(id),PRIMARY KEY(id));



drop table if EXISTS drivers_shipping_method;
create TABLE drivers_shipping_method( id INT  NOT NULL AUTO_INCREMENT, shipping_method_id int , driver_id int,FOREIGN KEY(shipping_method_id) REFERENCES shipping_method(id),FOREIGN KEY(driver_id) REFERENCES driver(id), PRIMARY KEY(id));
--------------------------------------------------------------------------------


------- create driver row ----
insert into shipping_method (shipping_name,shipping_description,shipping_photo)values("","","");
insert into trailler_types (trailer_name,tailer_description,trailer_photo)values("","","");

insert into drivers_shipping_method (shipping_method_id,driver_id)values(1,1);
insert into drivers_trailler_type (trailer_id,driver_id)values(1,1);
insert into driver(user_id,nationality,identity_card,license,vehicle_register_number,plate_number,identity_card_photo_front,identity_card_photo_back,lecense_photo,vehicle_type_id)



--  text, text, text, int, int,
--                      int, FOREIGN KEY (user_id) REFERENCES user_table(id), FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_type(id),PRIMARY KEY(id));

