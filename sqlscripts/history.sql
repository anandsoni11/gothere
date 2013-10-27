CREATE TABLE history (username varchar(25) references customer(username), planid integer references plan(planid), dateoftravel date, placeid integer unique not null, primary key (username, planid, dateoftravel));

CREATE TABLE schedule (username varchar(25) references customer(username), timeofevent timestamp not null, event varchar(100) not null, primary key (username, timeofevent));

CREATE TABLE spotrating (username varchar(25) references customer(username), cityid integer references cities(cityid), spotname varchar(100) not null, srating integer default 0 check(srating>=0 and srating <=10),check( exists(select * from touristspots as C where cityid =C.cityid and spotname=C.spotname)));

CREATE TABLE hotelrating (username varchar(25) references customer(username), cityid integer references cities(cityid), hotelname varchar(100) not null, hrating integer default 0 check(hrating>=0 and hrating <=10), check( exists(select * from hotel as C where cityid =C.cityid and hotelname=C.hotelname)));

CREATE TABLE tovisit (username varchar(25) references customer(username), planid integer references plan(planid), cityid integer references cities(cityid), spotname varchar(100) not null, dateoftravel date not null, check( exists(select * from touristspots as C where cityid =C.cityid and spotname=C.spotname))); 

CREATE TABLE friends (planid integer references plan(planid), friend varchar(25) references customer(username));

CREATE TABLE hotel(cityid integer references cities(cityid), hotelname varchar(50) not null, address varchar(200) not null, phone varchar(20) primary key, hits integer check(hits>=0) default 0, hrating integer default 0 check(hrating>=0 and hrating <=10));

CREATE TABLE notification(planid integer references plan(planid), sender varchar(25) references customer(username), reciever varchar(25) references customer(username), seen boolean default 'f'); 



