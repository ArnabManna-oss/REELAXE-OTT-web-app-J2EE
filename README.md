# REELAXE OTT web app J2EE
 its a web app made with J2EE technology , tomcat 9 and this contains users with Session features and Admin upload and delete pages

 make a data base in Mysql 
table 1
create table user(
     uid varchar(50) primarykey,
     uname varchar(45),
     uemail varchar(45),
     uage varchar(45),
     uphn varchar(45),
     ugender varchar(45),
     subStrt DATETIME,
     subEnd DATETIME,
     SubAmt Double,
     upass varchar(45)
     );
     
Table 2
create table video(
       vid varchar(255) primarykey,
       title varchar(255),
       category varchar(30),
       thumb varchar(255),
       decription text,
       path varchar(255)
       );

then connect the database wherever required in MISC package and in some JSP pages with your User name and Password,
you can also use an remote Data base with a particular IP address and port number.

Setup the project in Eclipse or What ever you want !
to upload a Video Admin have to log in AdminLogin.JSP page with id admin@gmail.com and password 1111 (can be reset from validAdmin.jsp)

Videos has to be saved in VIDstore and thumbnails in IMG  folder in webapp
upload them from there

Login from Login.JSP and signup if no account present 


----------------------------------------------Thank you----------------------------------------------------


