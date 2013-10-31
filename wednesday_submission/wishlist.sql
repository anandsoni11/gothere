create table wishList(username varchar(25) references customer(username), cityid integer references cities(cityid), spotname varchar(100));

