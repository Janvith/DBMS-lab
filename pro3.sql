create table boat(
bid varchar(20) primary key,
bname varchar(20),
bclr varchar(20));

create table sailor(
sid varchar(20) primary key,
sname varchar(20),
sage varchar(20));

create table reserves(
bid varchar(20) references boat(bid) on delete cascade,
sid varchar(20) references sailor(sid) on delete cascade,
day varchar(20),
primary key(sid,bid));

insert into boat values('001','aan','red');
insert into boat values('002','ban','red');
insert into boat values('003','can','blue');
insert into boat values('004','dan','green');


insert into sailor values('011','aan','10');
insert into sailor values('021','bbh','20');
insert into sailor values('031','dbh','50');
insert into sailor values('041','cbh','40');

insert into reserves values('001','011','mon');
insert into reserves values('002','011','mon');
insert into reserves values('003','011','mon');
insert into reserves values('004','021','mon');
insert into reserves values('001','031','mon');
insert into reserves values('004','041','mon');

select bname,bclr
from boat,sailor,reserves
where boat.bid=reserves.bid
and sailor.sid=reserves.sid
and sname='aah';


SELECT bname,bid
FROM BOAT 
WHERE NOT EXISTS (SELECT *
                  FROM SAILOR 
                  WHERE NOT EXISTS (SELECT * 
                                    FROM RESERVES 
                                    WHERE reserves.sid=sailor.sid AND reserves.bid=boat.bid));
                                    
                                    
select sname,count(reserves.bid)
from boat,sailor,reserves
where boat.bid=reserves.bid
and sailor.sid=reserves.sid
group by sname;


select bname,sname
from boat join sailor
on boat.bname=sailor.sname;