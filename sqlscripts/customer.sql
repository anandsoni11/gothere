CREATE TABLE customer (username varchar(25) primary key, password varchar(25) not null, name varchar(50) not null, address varchar(200), emailid varchar(150) not null CHECK (emailid ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'));
insert into customer values('mridul', 'mridul', 'mridul garg', 'kota', 'gmridul09@gmail.com');
