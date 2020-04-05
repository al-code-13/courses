create database python_db;
use python_db;

CREATE TABLE "python_image"
 ( "id" INT NOT NULL , 
 "name" TEXT NOT NULL ,
 "photo" BLOB NOT NULL ,
 "biodata" BLOB NOT NULL ,
 PRIMARY KEY ("id"));

 select * from Python_Image;