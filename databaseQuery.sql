use airline_reservation
create table FlightDetails(
FlightID int primary key,
FlightName varchar(40) not null,
FromLocation varchar(40) not null,
ToLocation varchar(40) not null,
ArrivalTime time,
DepartureTime time,
NoOfSeats int,
CreatedBy int not null,
constraint fkey_cb_admn foreign key(CreatedBy) references UserDetails(UserID))


create table UserDetails(
UserID int primary key,
UserTitle varchar(10),
UserFirstname varchar(40) not null,
UserLastname varchar(40) not null,
UserPhonenumber int not null,
UserEmail varchar(30),
UserDob date not null ,
UserPassword varchar(12) not null,
AccountID int,
constraint fkey_aid_aid foreign key(AccountID) references AccountType(AccountID)
)

drop table UserDetails
select* from UserDetails

create table AccountType(
AccountID int primary key,
AccountType varchar(10) not null
)

Insert into AccountType values(1,'Admin');
Insert into AccountType values(2,'NonAdmin');

select* from AccountType

create table BookingDetails(
BookingId int primary key,
BookingUserID int not null,
BookingFlightID int not null,
SeatNo int not null,
NoOfSeats int not null,
BookingNo int not null,
constraint fkey_buid_uid foreign key(BookingUserID) references UserDetails(UserID),
constraint fkey_bfid_fid foreign key(BookingFlightID) references FlightDetails(FlightID),
constraint fkey_bno_bnos foreign key(BookingNo) references BookingStatus(BookingNo),
constraint fkey_sno_sno foreign key(SeatNo) references SeatDetails(SeatNo),
)

drop table BookingDetails

create table BookingStatus(
BookingNo int primary key,
BookingStatus varchar(10) not null)

Insert into BookingStatus values(0,'Pending');
Insert into BookingStatus values(1,'Booked');
Insert into BookingStatus values(2,'Cancelled');

create table SeatDetails(
SeatNo int primary key,
SeatType varchar(20) not null)

create table PaymentDetails(
TransactionID int primary Key,
PaymentType varchar(20) not null,
PaymentDate date,
PaymentTime time,
AmountPaid int not null,
BookingID int,
constraint fkey_pid_bookid foreign key(BookingID) references BookingDetails(BookingId)
)

drop table PaymentDetails

