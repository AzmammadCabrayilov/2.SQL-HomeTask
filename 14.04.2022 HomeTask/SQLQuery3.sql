create database Library
use Library

-------------BOOKS

create table Books(
Id int primary key identity,
[Name] nvarchar (50) not null,
AuthorId int references Authors(Id),
)
insert into Books ('Relsler uzerine uzanmis adam',1),('Cerpeleng ucuran',4),('Kibrit coplugu mezarligi',3),('Nil de Olum',2),('Bu seherde kimse yoxdur',1),('olum Sessiz geldi',2)

-------------AUTHORS

create table Authors(
Id int primary key identity,
[Name] nvarchar (50) not null,
Surname nvarchar (50) not null
)
insert into Authors values ('Rovsen','Abdullayev'),('Agatha','Cristine'),('Busra','Yilmaz'),('Xalid','Huseyni')

-------------GENRE

create table Genres(
Id int primary key identity,
[Name] nvarchar (50) not null
)
insert into Genres('Dram'),('Dedektiv'),('Sevgi')


create table BookToGenre(
BookId int references Books(Id),
GenreId int references Genres(Id)
)

insert into BookToGenre(1,2),(2,2),(3,7),(2,1),(1,8)

select Books.[Name] 'Book',Authors.[Name] 'Author',Genres.[Name] 'Genre' from BookToGenre
join Books on BookId = Books.Id 
join Authors on Books.AuthorId = Authors.Id 
join Genres on GenreId = Genres.Id