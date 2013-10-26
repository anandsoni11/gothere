CREATE TABLE history (username varchar(25) references customer(username), planid integer references plan(planid), dateoftravel date, placeid integer unique not null, primary key (username, planid, dateoftravel));
CREATE TABLE schedule (username varchar(25) references customer(username), timeofevent timestamp not null, event varchar(100) not null, primary key (username, timeofevent));
CREATE TABLE spotrating (username varchar(25) references customer(username), cityid integer references cities(cityid), spotname varchar(100) not null, rating integer not null);
CREATE TABLE hotelrating (username varchar(25) references customer(username), cityid integer references cities(cityid), hotelname varchar(100) not null, rating integer not null);
CREATE TABLE tovisit (username varchar(25) references customer(username), planid integer references plan(planid), cityid integer references cities(cityid), spotname varchar(100) not null, dateoftravel date not null); 
CREATE TABLE friends (username varchar(25) references customer(username), planid integer references plan(planid), groupid integer unique not null, primary key(username, planid));
CREATE TABLE group (groupid integer references friends(groupid), username varchar(25) references customer(username));
