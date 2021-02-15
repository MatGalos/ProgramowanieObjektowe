USE [master]
GO
/****** Object:  Database [dobra_nutka9]    Script Date: 14.02.2021 14:58:03 ******/
CREATE DATABASE [dobra_nutka]
Go

USE [dobra_nutka]
GO

/****** Object:  Table [dbo].[Artists]    Script Date: 14.02.2021 14:58:03 ******/
CREATE TABLE [dbo].[Artists](
	[artist_id] [int] IDENTITY(1,1) NOT NULL,
	[artist_name] [varchar](60) NULL,
	[artist_date_of_birth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[artist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 14.02.2021 14:58:03 ******/
CREATE TABLE [dbo].[Albums](
	[album_id] [int] IDENTITY(1,1) NOT NULL,
	[album_title] [varchar](60) NULL,
	[artist_id] [int] NULL,
	[genre_id] [int] NULL,
	[release_date] [date] NULL,
	[format_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[album_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Registered_Albums]    Script Date: 14.02.2021 14:58:03 ******/
--Pokazanie wszystkich dostępnych albumów w sklepie

create view [dbo].[Registered_Albums] as
	select album_title as nazwa_albumu ,max(artist_name) as wykonawca from Albums
	left join Artists on Albums.artist_id = Artists.artist_id
	group by album_title

GO
/****** Object:  Table [dbo].[Positions]    Script Date: 14.02.2021 14:58:03 ******/
CREATE TABLE [dbo].[Positions](
	[position_id] [int] IDENTITY(1,1) NOT NULL,
	[position_name] [varchar](20) NULL,
	[salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[position_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 14.02.2021 14:58:03 ******/

CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_first_name] [varchar](30) NULL,
	[employee_last_name] [varchar](30) NULL,
	[location_id] [int] NULL,
	[employee_date_of_birth] [date] NULL,
	[position_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[zarobek]    Script Date: 14.02.2021 14:58:03 ******/

--pokazanie ile zarabiają pracownicy

create view [dbo].[zarobek] as
	select employee_first_name as imie ,employee_last_name as nazwisko ,position_name as stanowisko ,salary as pensja from Employees
	left join Positions on Positions.position_id=Employees.position_id

GO
/****** Object:  View [dbo].[Ilość_pracowników]    Script Date: 14.02.2021 14:58:03 ******/

-- pokazanie ile pracowników pracuje w danym lokalu

create view [dbo].[Ilość_pracowników] as
	select location_id as numer_lokacji,count(employee_id) as zatrudnieni from Employees
	group by location_id

GO
/****** Object:  Table [dbo].[Clients]    Script Date: 14.02.2021 14:58:03 ******/
CREATE TABLE [dbo].[Clients](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[client_first_name] [varchar](30) NOT NULL,
	[client_last_name] [varchar](30) NOT NULL,
	[client_email] [varchar](254) NOT NULL,
	[client_date_of_birth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 14.02.2021 14:58:03 ******/
CREATE TABLE [dbo].[Locations](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[city] [varchar](30) NULL,
	[address_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [FK_address_id] UNIQUE NONCLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14.02.2021 14:58:03 ******/
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NULL,
	[album_id] [int] NULL,
	[employee_id] [int] NULL,
	[location_id] [int] NULL,
	[order_date] [date] NOT NULL,
	[delivery_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[zamówienie]    Script Date: 14.02.2021 14:58:03 ******/

-- wyświetlenie całego zamówienia

create view [dbo].[zamówienie] as
	select Orders.order_id as numer_zamówienia, order_date as data_zamówienia, delivery_date as przewidywana_data_dostawy,client_first_name as imie,client_last_name as nazwisko, client_email as email,Employees.employee_id as id_pracownika,album_title
	as nazwa_albumu,Locations.location_id as numer_lokalu from Orders
	left join Clients on Clients.client_id=Orders.client_id
	left join Employees on Employees.employee_id=Orders.employee_id
	left join Albums on Albums.album_id=Orders.album_id
	left join Locations on Locations.location_id=Orders.location_id
	

GO
/****** Object:  Table [dbo].[Adresses]    Script Date: 14.02.2021 14:58:03 ******/
CREATE TABLE [dbo].[Adresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[street] [varchar](40) NULL,
	[street_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[adres]    Script Date: 14.02.2021 14:58:03 ******/

-- wyświetla adres sklepu

create view [dbo].[adres] as
	select location_id as numer_lokalu,street as ulica,street_number numer_ulicy from Locations
	left join Adresses on Locations.address_id=Adresses.address_id

GO
/****** Object:  Table [dbo].[Formats]    Script Date: 14.02.2021 14:58:03 ******/
CREATE TABLE [dbo].[Formats](
	[format_id] [int] IDENTITY(1,1) NOT NULL,
	[format_name] [varchar](20) NULL,
	[format_price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[format_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 14.02.2021 14:58:03 ******/
CREATE TABLE [dbo].[Genres](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_name] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()+(2)) FOR [delivery_date]
GO
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_artist_id] FOREIGN KEY([artist_id])
REFERENCES [dbo].[Artists] ([artist_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_artist_id]
GO
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_format_id] FOREIGN KEY([format_id])
REFERENCES [dbo].[Formats] ([format_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_format_id]
GO
ALTER TABLE [dbo].[Albums]  WITH CHECK ADD  CONSTRAINT [FK_genre_id] FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genres] ([genre_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Albums] CHECK CONSTRAINT [FK_genre_id]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_location_id] FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_location_id]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_position_id] FOREIGN KEY([position_id])
REFERENCES [dbo].[Positions] ([position_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_position_id]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD FOREIGN KEY([address_id])
REFERENCES [dbo].[Adresses] ([address_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_album_id] FOREIGN KEY([album_id])
REFERENCES [dbo].[Albums] ([album_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_album_id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_client_id] FOREIGN KEY([client_id])
REFERENCES [dbo].[Clients] ([client_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_client_id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_employee_id]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_location_id1] FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([location_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_location_id1]
GO


insert into dbo.Adresses values('orzeszkowa',6);
insert into dbo.Adresses values('miodowa',56);
insert into dbo.Adresses values('migdałowa',23);
insert into dbo.Adresses values('świetlana',1);
insert into dbo.Adresses values('piękna',9);
go

insert into dbo.Genres values('Rock');
insert into dbo.Genres values('Gospel');
insert into dbo.Genres values('Rap');
insert into dbo.Genres values('Pop');
insert into dbo.Genres values('Metal');
insert into dbo.Genres values('Indie');
insert into dbo.Genres values('Alternative');
go

insert into dbo.Formats values('CD',39);
insert into dbo.Formats values('Cassette',29);
insert into dbo.Formats values('Vinyl',79);
go

insert into dbo.Artists values('Kanye West',convert(date,'1977-06-08'));

go