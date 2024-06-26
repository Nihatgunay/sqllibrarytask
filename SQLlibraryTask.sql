CREATE DATABASE Library 
use Library

create table Authors(
	Id int identity primary key,
	Name varchar(100) default 'author name',
	Surname varchar(100) default 'author surname'
)
create table Books(
	Id int identity primary key,
	AuthorId int foreign key references Authors(Id),
	Name varchar(100) default 'book name',
	PageCount int check(PageCount > 0),
	CostPrice decimal(5,2) not null,
	SalePrice decimal(5,2) not null
)
create table Tags(
	Id int identity primary key,
	Name varchar(100) not  null,
)
create table BooksTags(
	BookId int foreign key references Books(Id),
	TagId int foreign key references Tags(Id)
)

insert into Authors 
values
('Jk', 'Rowling'),
('John Ronald', 'Talkien')

Select * from Books
insert into Books
values
(1, 'Harry Potter', 400, 50, 70),
(2, 'Lord of the rings', 350, 60, 80)

insert into Tags
values
('Best Selling'),
('Popular')

insert into BooksTags
values
(1, 2),
(2, 1),
(2, 2)

select Books.Id as 'Id', Authors.Name as 'author name', Authors.Surname as 'author surname ',
Books.Name as 'book name', Books.PageCount as 'book pagecount', Tags.Name as 'Tag Name'
from Books 
inner join Authors on Books.AuthorId = Authors.Id
inner join BooksTags on BooksTags.BookId = Books.Id
inner join Tags on BooksTags.TagId = Tags.Id

