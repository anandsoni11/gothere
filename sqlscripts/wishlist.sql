create table wishList(username varchar(25) references customer(username), cityid integer references cities(cityid), spotname varchar(100), check( exists(select * from touristspots as C where cityid =C.cityid and spotname=C.spotname)));

