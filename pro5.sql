create table books(
isbn varchar(10) primary key,
title varchar(10),
author varchar(10));

create table student(
sid varchar(10) primary key,
name varchar(10),
gender varchar(10));

create table borrows(
sid varchar(10) references student(sid) on delete cascade,
isbn varchar(10) references books(isbn) on delete cascade,
date varchar(10),
primary key(sid,isbn));

insert into books values('123','database','a1');
insert into books values('124','datasci','a2');
insert into books values('003','python','a3');
insert into books values('004','java','a4');
insert into books values('005','cpp','a5');


insert into student values('101','janvith','M');
insert into student values('102','sony','F');
insert into student values('103','katari','M');
insert into student values('104','giri','M');
insert into student values('105','jayanth','F');


insert into borrows values('101','123','1st');
insert into borrows values('101','003','2st');
insert into borrows values('102','123','3st');
insert into borrows values('102','004','4st');
insert into borrows values('103','005','5st');
insert into borrows values('104','123','6st');
insert into borrows values('105','003','7st');



select name
from student,borrows
where student.sid=borrows.sid
and isbn='123' or isbn='124';


select name
from student,borrows,books
where student.sid=borrows.sid
and borrows.isbn=books.isbn
and gender='F'
and title='database';


select name,gender,count(borrows.isbn)
from student,borrows,books
where student.sid=borrows.sid
and borrows.isbn=books.isbn
group by name,gender;

select * from books
where title like 'da%' and isbn not in(select isbn from borrows);