create table supplier(
sid varchar(10) primary key,
sname varhar(10),
saddr varchar(10));


create table part(
pid varchar(10) primary key,
pname varchar(10),
pclr varchar(10));

create table shipment(
sid varchar(10) references supplier(sid) on delete cascade,
pid varchar(10) references part(pid)on delete cascade,
primary key(sid,pid));

insert into supplier values('1','aa','zz');
insert into supplier values('2','bb','yy');
insert into supplier values('3','cc','xx');
insert into supplier values('4','dd','ww');

select * from supplier;

insert into part values('11','aaa','zzz');
insert into part values('22','bbb','yyy');
insert into part values('33','ccc','xxx');
insert into part values('44','ddd','www');

select * from part;

insert into shipment values('1','11');
insert into shipment values('1','22');
insert into shipment values('1','44');
insert into shipment values('3','44');

select * from shipment;

select pname,pclr
from supplier,part,shipment
where supplier.sid=shipment.sid
and part.pid=shipment.pid
and sname='aa';

select pname,pclr from part 
where pid in(select pid from shipment where sid in(select sid from supplier where sname='aa'));

select sname
from supplier,part,shipment
where supplier.sid=shipment.sid
and part.pid=shipment.pid
and pname='aaa';

delete from part where pclr='zzz';
select * from part;

select sname
from supplier,part,shipment
where supplier.sid=shipment.sid
and part.pid=shipment.pid
group by shipment.sid having count(shipment.pid)=2;