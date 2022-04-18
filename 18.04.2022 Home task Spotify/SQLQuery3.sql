create database Spotify
use Spotify

create table Artists(
Id int primary key identity,
[Name] nvarchar(100)not null,
PapularReleases nvarchar (100)
)

insert into Artists values ('Billie Eilish','Lovely'),('Paster','Gang'),
('Xpert',N'Şaman'),('Eminem','Lose Yourself')


create table Albums(
Id int primary key identity,
[Name] nvarchar(100)not null,
ArtistId int references Albums(Id)
)

isert into Albums values ('Dont smile at me',1),('Bina',2),
('PHENOM',3),('The Marshall',4)

create table Musics(
Id int primary key identity,
[Name] nvarchar(100) not null,
TotalSecond float,
ListenerCount int,
AlbumId int references Albums(Id)
)

insert into Musics values ('6.18.18',3.17,1000000,1),('Agir Metal',3.46,135126,3),('Gezirem',2.56,546215,2),('Cantanda',4.16,987562,3),('CHAIN',3.59,412365,2),
('Bad Guy',6.25,9874255,1),('Not Afraid',3.37,98745632,4),('North West',3.02,98745,3),('Rap God',3.38,97456321,4)

select*from Artists
select*from Albums
select*from Musics

--query 1

create view GetMusicInfo as
select* from Artists as art
join Albums as alb on art.Id= al.ArtistId
join music as msc on al.Id = m.AlbumId

--query 2 delete

create trigger DeletedMusics
on Musics
instead of delete as begin
Update Music set IsDeleted  where Id=(Select Id from deleted Music)
end

--query 3
create view GetAlbumInfo
as 
select count(m.[Name]) 'Music Count',al.[Name] 'Album Name' from Musics as m
join Albums as a on m.AlbumId=al.Id
group by al.[Name]