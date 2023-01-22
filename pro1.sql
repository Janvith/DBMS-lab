create table employee(
ssn varchar(20) primary key,
fname varchar(20),
salary number(10),
dno varchar(10),
dname varchar(20));

create table project(
pno varchar(20) primary key,
domain varchar(20));

create table workson(
ssn varchar(20) references employee(ssn) on delete cascade,
pno varchar(20) references project(pno) on delete cascade,
primary key(ssn,pno));

insert into employee values('001','jan',200,'1','ise');
insert into employee values('002','ban',300,'2','cse');
insert into employee values('003','nan',400,'1','ise');
insert into employee values('004','man',500,'3','iem');


insert into project values('011','database');
insert into project values('021','cloud');
insert into project values('041','so');
insert into project values('031','on');


insert into workson values('001','011');
insert into workson values('001','021');
insert into workson values('001','021');
insert into workson values('002','031');
insert into workson values('003','011');
insert into workson values('004','041');


select fname,salary,dno
from employee,project,workson
where employee.ssn=workson.ssn
and project.pno=workson.pno
and domain='database';


select dno,dname,count(ssn)
from employee
group by dno,dname;


update workson
set pno='changed'
where ssn='004';
select * from workson;


select ssn,count(pno)
from workson
group by ssn having count(pno)<=2;