create database fifa;

use fifa;

create table Team(
TeamID int not null primary key auto_increment,
TeamName varchar(50) not null,
City varchar(30) not null
);

create table Manager(
ManagerNationalID varchar(15) not null primary key,
FirstName varchar(30) not null,
SecondName varchar(30) not null,
LastName varchar(30) not null,
Wage float,
TeamID int,
foreign key (TeamID) references Team(TeamID)
);

create table Player(
PlayerNationalID varchar(15) not null primary key,
FirstName varchar(30) not null,
SecondName varchar(30) not null,
LastName varchar(30) not null,
Wage float,
TeamID int,
Age int not null,
Height float not null,
Weight float not null,
Nationality varchar(15) not null,
foreign key (TeamID) references Team(TeamID)
);

create table MatchEvent(
MatchEventID int not null primary key auto_increment,
HomeTeamID int not null,
AwayTeamID int not null,
DateOfTheEvent datetime not null,
Location varchar(50) not null,
foreign key (HomeTeamID) references Team(TeamID),
foreign key (AwayTeamID) references Team(TeamID)
);

create table Customer(
CustomerID varchar(15) not null primary key,
FirstName varchar(30) not null,
SecondName varchar(30) not null,
LastName varchar(30) not null,
Age int not null,
Address varchar(50),
Nationality varchar (15)
);

create table Ticket(
TicketID int not null primary key auto_increment,
Price float not null,
MatchEventID int not null,
CustomerID varchar(15),
foreign key (MatchEventID) references MatchEvent(MatchEventID),
foreign key (CustomerID) references Customer(CustomerID)
);

create table Tournament(
TournamentID int not null primary key auto_increment,
Prize float not null,
TeamsCount int not null,
Duration varchar(30)
);

create table TournamentsTeams(
TournamentsTeams int not null primary key auto_increment,
TeamID int,
TournamentID int,
foreign key (TeamID) references Team(TeamID),
foreign key (TournamentID) references Tournament(TournamentID)
);

alter table Team modify column City varchar(100);  

INSERT INTO Team(TeamName, City)
VALUES ('Manchester United', 'Manchester, United Kingdom'),
       ('Manchester City', 'Manchester, United Kingdom'),
       ('Newcastle United', 'Newcastle upon Tyne, United Kingdom'),
       ('A.C. Milan', 'Milan, Italy'),
       ('Juventus', 'Turin, Italy'),
       ('Borussia Dortmund', 'Dortmund, Germany'),
       ('Bayern Munich', 'Munich, Germany'),
       ('FC Barcelona', 'Barcelona, Spain'),
       ('Real Madrid CF', 'Madrid, Spain'),
       ('Olympique de Marseille', 'Marseille, France'),
       ('Paris Saint-Germain', 'Paris, France'),
       ('S.L. Benfica', 'Lisbon, Portugal'),
       ('Sporting CP', 'Lisbon, Portugal'),
       ('AFC Ajax', 'Amsterdam, Netherlands'),
       ('S.C. Braga', 'Braga, Portugal'),
       ('A.S. Roma', 'Rome, Italy'),
       ('FC Basel', 'Basel, Switzerland'),
       ('AS Monaco', 'Monaco, France'),
       ('Fulham', 'Fulham, London, United Kingdom');

select * from Team;
       
INSERT INTO Manager(ManagerNationalID, FirstName, SecondName, LastName, Wage, TeamID)
VALUES ('08545595f1', 'Erik', 'ten', 'Hag', '50000', '20'),
       ('08545595f2', 'Josep', 'Guardiola', 'Sala', '90000', '22'),
       ('08545595f3', 'Edward', 'John', 'Howe', '40400', '23'),
       ('08545595f4', 'Stefano', 'A.', 'Pioli', '33200', '24'),
       ('08545595f5', 'Massimiliano', 'A.', 'Allegri', '89000', '25'),
       ('08545595f6', 'Edin', 'K.', 'Terzić', '25698', '26'),
       ('08545595f7', 'Julian', 'G.', 'Nagelsmann', '65000', '27'),
       ('08545595f8', 'Manager', 'S2', 'Fam', '50300', '28'),
       ('08545595f9', 'Manager2', 'S3', 'Hag', '50320', '29'),
       ('08545595f10', 'Manager3', 'S5', 'Nagelsmann', '50530', '30'),
	   ('08545595f11', 'Manager4', 'F', 'Hag', '53400', '31'),
	   ('08545595f12', 'Manager5', 'D', 'Hag', '50540', '32'),
       ('08545595f13', 'Manager6', 'G', 'Howe', '50650', '33'),
	   ('08545595f14', 'Manager7', 'V', 'Hag', '50340', '34'),
       ('08545595f15', 'Manager8', 'G', 'Hag', '54550', '35'),
	   ('08545595f16', 'Manager9', 'J', 'Hag', '55600', '36'),
	   ('08545595f17', 'Manager10', 'W', 'Hag', '57600', '37'),
	   ('08545595f19', 'Manager10', 'W', 'Hag', null, null),
	   ('08545595f18', 'Manager11', 'Q', 'Pioli', '50760', '38');
       
select * from Manager;

INSERT INTO Player(PlayerNationalID, FirstName, SecondName, LastName, Wage, TeamID, Age, Height, Weight, Nationality)
VALUES ('25102555522p1', 'David', 'De', 'Gea', '788525', '20', '25', '185', '71', 'Spain'),
       ('25102555522p2', 'Kylian', 'A', 'Mbappé', '12356', '21', '27', '177', '75', 'France'),
       ('25102555522p3', 'Germán', 'V', 'Cano', '57525', '22', '21', '177', '70', 'Argentina'),
       ('25102555522p4', 'Erling', 'T', 'Haaland', '525252', '23', '22', '177', '70', 'Brazil'),
       ('25102555522p5', 'Robert', 'V', 'Lewandowski', '68686', '24', '21', '177', '70', 'Serbia'),
       ('25102555522p6', 'Aleksandar', 'H', 'Mitrovic', '86775', '25', '25', '177', '70', 'Serbia'),
       ('25102555522p7', 'Christopher', 'T', 'Nkunku', '5757', '26', '25', '177', '70', 'Argentina'),
       ('25102555522p8', 'Ricardo', 'A', 'Gomes', '858585', '27', '25', '177', '70', 'Brazil'),
       ('25102555522p9', 'Amahl', 'G', 'Pellegrino', '55582', '28', '26', '177', '70', 'England'),
       ('25102555522p10', 'Boris', 'J', 'Kopitovic', '28282', '29', '26', '177', '70', 'Argentina'),
       ('25102555522p11', 'Mehdi', 'T', 'Taremi', '52252', '30', '27', '177', '70', 'Brazil'),
       ('25102555522p12', 'Paul', 'D', 'Mullin', '252', '31', '27', '177', '70', 'Serbia'),
       ('25102555522p13', 'Kodai', 'F', 'Tanaka', '2552', '32', '27', '177', '70', 'England'),
       ('25102555522p14', 'Sadio', 'G', 'Mané', '25252', '33', '28', '177', '70', 'Brazil'),
       ('25102555522p15', 'Harry', 'R', 'Kane', '25252', '34', '22', '177', '70', 'England'),
       ('25102555522p16', 'Lionel', 'F', 'Messi', '5557', '35', '20', '177', '70', 'Argentina'),
       ('25102555522p17', 'Dusan', 'G', 'Tadic', '57575', '36', '17', '177', '70', 'Bulgaria'),
       ('25102555522p18', 'Kevin', 'De', 'Bruyne', '2572', '37', '35', '177', '70', 'Serbia'),
       ('25102555522p19', 'Cody ', 'H', 'Gakpo', '25725', '38', '33', '177', '70', 'Bulgaria'),
       ('251025tr11', 'Edmilson', 'H', 'Junior', '52752', '34', '35', '177', '70', 'Argentina'),
       ('251025gg12', 'Neymar', 'A', 'JR', '2752', '21', '32', '177', '70', 'Bulgaria'),
       ('2510255d14', 'Andrew', 'S', 'Robertson', '275275', '26', '30', '177', '70', 'Bulgaria'),
       ('2510a424', 'Ivan', 'D', 'Perisic', '62424', '26', '21', '177', '70', 'Bulgaria'),
       ('251025555g4', 'Mirko', 'Y', 'Ivanic', '42542', '20', '25', '177', '70', 'Brazil');

select * from Player;

INSERT INTO MatchEvent(HomeTeamID, AwayTeamID, DateOfTheEvent, Location)
VALUES ('21', '38', '2022-04-21', 'London'),
       ('22', '37', '2022-04-22', 'Sofia'),
       ('23', '36', '2022-04-23', 'Parsi'),
       ('24', '35', '2022-04-24', 'Berlin'),
       ('25', '34', '2022-04-25', 'Rio'),
       ('26', '33', '2022-05-21', 'Monaco'),
       ('27', '32', '2023-04-21', 'Manchester'),
       ('28', '31', '2023-01-21', 'Oslo'),
       ('29', '30', '2022-01-22', 'Basel'),
       ('30', '29', '2022-11-23', 'Basel'),
       ('31', '28', '2022-04-20', 'Moscow'),
       ('32', '27', '2022-12-21', 'Wien'),
       ('33', '26', '2022-11-24', 'Prague'),
       ('34', '25', '2022-02-24', 'Liverpool'),
       ('21', '25', '2023-01-21', 'Rome'),
       ('20', '33', '2026-04-26', 'Venezia'),
       ('24', '34', '2022-07-21', 'Milan'),
       ('34', '21', '2022-04-17', 'Turin'),
       ('34', '23', '2022-01-18', 'Mexico'),
       ('34', '25', '2022-03-21', 'Buenos Aires'),       
       ('20', '33', '2022-03-21', 'Madrid'),
       ('33', '27', '2022-03-21', 'Barcelona');

select * from MatchEvent


INSERT INTO Customer(CustomerID, FirstName, SecondName, LastName, Age, Address, Nationality)
VALUES ('sdjfio1fioj1', 'John', 'Smith', 'Howe', '21', 'Sofia', 'Bulgaria'),
       ('sdj2sdfioj1', 'Smith', 'John', 'Howe', '22', 'Berlin', 'Germany'),
       ('sd3ojsdfioj1', 'Howe', 'Smith', 'John', '23', 'Milan', 'Serbia'),
       ('sd4ojsdfioj1', 'Post', 'Malone', 'Wite', '24', 'Turin', 'Italy'),
       ('sd5ojsdfioj1', 'Malone', 'Post', 'Wite', '25', 'Wien', 'Austria'),
       ('sdj7sdfioj1', 'Wite', 'Malone', 'Post', '26', 'Belgrad', 'Serbia'),
       ('sd6sdfioj1', 'George', 'Christian', 'Sommer', '27', 'Plovdiv', 'Brazil'),
       ('sdj8jsdfioj1', 'Christian', 'Sommer', 'George', '31', 'Barcelona', 'Spain'),
       ('sd9ioj1', 'Sommer', 'Christian', 'George', '34', 'Mexico City', 'Argentina'),
       ('sdjf10dfioj1', 'Leo', 'Bruno', 'Messi', '44', 'Buenos Aires', 'Moroco'),
       ('sdjfi11ioj1', 'Bruno', 'Leo', 'Messi', '32', 'Atina', 'France'),
       ('sdjfio12ioj1', 'Messi', 'Bruno', 'Leo', '55', 'Venezia', 'Georgia'),
       ('sdjfi13oj1', 'Robert', 'Rugani', 'Tileman', '52', 'Prague', 'Slovenia'),
       ('sdjfi14fioj1', 'Rugani', 'Robert', 'Tileman', '45', 'Madird', 'Netherland'),
       ('sdjf51fioj1', 'Tileman', 'Rugani', 'Robert', '31', 'Manchester', 'Spain'),
       ('sdj16fioj1', 'Mbappe', 'Kostic', 'White', '67', 'Moscow', 'Portugal');

select * from Customer;

INSERT INTO Ticket(Price, MatchEventID, CustomerID)
VALUES ('11', '1', 'sdjfio1fioj1'),
       ('22', '2', 'sdj2sdfioj1'),
       ('34', '3', 'sdjfio1fioj1'),
       ('12', '4', 'sdj2sdfioj1'),
       ('11', '5', 'sd5ojsdfioj1'),
       ('12', '6', 'sdjfi13oj1'),
       ('14', '7', 'sd3ojsdfioj1'),
       ('15', '8', 'sdj2sdfioj1'),
       ('16', '9', 'sdj2sdfioj1'),
       ('17', '10', 'sd5ojsdfioj1'),
       ('15', '17', 'sdj2sdfioj1'),
       ('3', '17', 'sdj2sdfioj1'),
       ('12', '19', 'sdj2sdfioj1'),
       ('12', '15', 'sd3ojsdfioj1'),
       ('11', '11', 'sdj2sdfioj1'),
       ('21', '2', 'sdj2sdfioj1'),
       ('14', '4', 'sdj2sdfioj1'),
       ('13', '4', 'sdjfi11ioj1'),
       ('12', '1', 'sd5ojsdfioj1'),
       ('11', '3', 'sdj2sdfioj1'),
	   ('22', '2', 'sdj2sdfioj1'),
       ('34', '3', 'sd5ojsdfioj1'),
       ('12', '4', 'sdj2sdfioj1'),
       ('11', '5', 'sdj2sdfioj1'),
       ('12', '6', 'sdj2sdfioj1'),
       ('14', '7', 'sd5ojsdfioj1'),
       ('15', '8', 'sdj2sdfioj1'),
       ('16', '9', 'sdj2sdfioj1'),
       ('17', '10', 'sdj2sdfioj1'),
       ('15', '17', 'sdj2sdfioj1'),
       ('3', '17', 'sdj2sdfioj1'),
       ('12', '19', 'sd3ojsdfioj1'),
       ('12', '15', 'sdj2sdfioj1'),
       ('11', '11', 'sdj2sdfioj1'),
       ('21', '2', 'sdj2sdfioj1'),
       ('14', '4', 'sdj2sdfioj1'),
       ('13', '4', 'sdjfi13oj1'),
       ('12', '1', 'sdj2sdfioj1'),
       ('11', '3', 'sdj2sdfioj1');
       
       Select * from Ticket

INSERT INTO Tournament(Prize, TeamsCount, Duration)
VALUES ('100000', '5', '1 month'),
       ('200000', '15', '2 months'),
       ('300000', '4', '1 year'),
       ('400000', '7', '10 days'),
       ('500000', '9', '7 months'),
       ('15004', '11', '5 months'),
       ('100040', '3', '11 months'),
       ('103400', '5', '1 day'),
       ('100500', '8', '4 days'),
       ('102300', '9', '1 year'),
       ('543000', '15', '9 months'),
       ('345000', '7', '10 months');

select * from Tournament;

insert into TournamentsTeams(TeamID, TournamentID)
values ('21', '1'),
       ('22', '2'),
       ('23', '3'),
       ('21', '4'),
       ('38', '5'),
       ('20', '6'),
       ('33', '7'),
       ('21', '8'),
       ('25', '9'),
       ('26', '10'),
       ('27', '11'),
       ('28', '12'),
       ('20', '1'),
       ('22', '3'),
       ('31', '3'),
       ('35', '7'),
       ('38', '7'),
       ('36', '7'),
       ('21', '5'),
       ('24', '5'),
       ('27', '5');

select * from TournamentsTeams;

delimiter $$
create procedure  showPlayersInTheTeams()
begin
SELECT Player.FirstName, Player.SecondName, Player.LastName, Team.TeamName
FROM Player 
INNER JOIN Team ON (Player.TeamID = Team.TeamID)
order by TeamName;

end $$
 
CALL showPlayersInTheTeams();

select FirstName, LastName, 
if(Nationality like 'Bulgaria', 'The customer wins extra ticket as bonus!', 'Unfortunately the customer does not win extra ticket.') as Message
from Customer;

delimiter $$
CREATE TRIGGER setAddress BEFORE INSERT ON Customer FOR EACH ROW IF New.Address = 'Sofia' 
THEN SET New.Nationality = 'Bulgaria'; end if;

INSERT INTO Customer(CustomerID, FirstName, SecondName, LastName, Age, Address, Nationality)
VALUES ('11321', 'John123', 'Smith1', 'Howe1', '23', 'Sofia', 'Germany');

select * from Customer where CustomerID = '11321'