CREATE TABLE administrator (username varchar(25) primary key, password varchar(25) not null, name varchar(50) not null, address varchar(200), emailid varchar(150) not null, role varchar(30) not null check (role = 'Manager' or role='Employee'));
INSERT INTO administrator values('anand','soni','Anand Soni', 'IIT Bombay', 'anand.92.soni@gmail.com','Manager'); 
INSERT INTO administrator values('sanchit','garg','Sanchit Garg', 'IIT Bombay', 'garg.sanchitiitb@gmail.com','Manager');
INSERT INTO administrator values('mridul','garg','Mridul Garg', 'IIT Bombay', 'gmridul@gmail.com','Manager');
INSERT INTO administrator values('himanshu','roy','Himanshu Roy', 'IIT Bombay', 'himanshubudak@gmail.com','Manager');
