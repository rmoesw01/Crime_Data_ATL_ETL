

CREATE TABLE apd_crime_data (
    crime_type varchar(30)   ,
    report_number int PRIMARY KEY  ,
    report_date date   ,
    location varchar  ,
    beat float  ,
    neighborhood varchar   ,
   	npu varchar(10)   ,
    lat float   ,
    long float  
  
     
);

CREATE TABLE apd_police_shooting (
    id int  PRIMARY KEY ,
    name varchar   ,
    date date  ,
    manner_of_death varchar(30)  ,
    armed varchar   ,
    age float   ,
    gender varchar(1)  ,
    race varchar(10)   ,
    city varchar(30)   ,
    state varchar(2)   ,
    signs_of_mental_illness boolean  ,
    threat_level varchar(15)   ,
    flee varchar(15)   ,
    body_cam boolean   ,
    arms_category varchar(30)   

);