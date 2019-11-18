CREATE TABLE Airport (
	airport_id CHAR(3),
	PRIMARY KEY (airport_id)
);

CREATE TABLE Airline (
	airline_id CHAR(2),
	PRIMARY KEY(airline_id)
);

CREATE TABLE associated (
	airport_id CHAR(3),
	airline_id CHAR(2),
	FOREIGN KEY(airport_id) REFERENCES Airport(airport_id),
	FOREIGN KEY(airline_id) REFERENCES Airline(airline_id),
	PRIMARY KEY(airport_id, airline_id)
);

CREATE TABLE Aircraft (
	aircraft_id int,
	PRIMARY KEY(aircraft_id)
);

CREATE TABLE owns (
	airline_id CHAR(2),
	aircraft_id int,
	FOREIGN KEY(airline_id) REFERENCES Airline(airline_id),
	FOREIGN KEY(aircraft_id) REFERENCES Aircraft(aircraft_id),
	PRIMARY KEY(airline_id, aircraft_id)
);

CREATE TABLE operated_by (
	airline_id CHAR(2),
	aircraft_id int,
	FOREIGN KEY(airline_id) REFERENCES Airline(airline_id),
	FOREIGN KEY(aircraft_id) REFERENCES Aircraft(aircraft_id),
	PRIMARY KEY(airline_id, aircraft_id)
);

CREATE TABLE Flight (
	airline_id CHAR(2),
	flight_number int,
	domestic_or_intl int,
	FOREIGN KEY(airline_id) REFERENCES Airline(airline_id),
	PRIMARY KEY(flight_number, airline_id)
);

CREATE TABLE operates_on (
	airline_id CHAR(2),
	flight_number int,
	day CHAR(3),
	FOREIGN KEY(airline_id) REFERENCES Airline(airline_id),
	FOREIGN KEY(flight_number) REFERENCES Flight(flight_number),
	FOREIGN KEY(day) REFERENCES Day_of_week(day),
	PRIMARY KEY(flight_number, airline_id)
);

CREATE TABLE Day_of_week (
	day CHAR(3),
	PRIMARY KEY(day)
);

CREATE TABLE departs (
	airline_id CHAR(2),
	flight_number int,
	airport_id CHAR(3),
	dept_time DATETIME,
	FOREIGN KEY(airline_id) REFERENCES Airline(airline_id),
	FOREIGN KEY(flight_number) REFERENCES Flight(flight_number),
	FOREIGN KEY(airport_id) REFERENCES Airport(airport_id),
	PRIMARY KEY(flight_number, airline_id)
);

CREATE TABLE arrives (
	airline_id CHAR(2),
	flight_number int,
	airport_id CHAR(3),
	dept_time DATETIME,
	FOREIGN KEY(airline_id) REFERENCES Airline(airline_id),
	FOREIGN KEY(flight_number) REFERENCES Flight(flight_number),
	FOREIGN KEY(airport_id) REFERENCES Airport(airport_id),
	PRIMARY KEY(flight_number, airline_id)
);

CREATE TABLE Reservation (
	reservation_id int,
	flexibility int,
	PRIMARY KEY(reservation_id)
);

CREATE TABLE Ticket (
	ticket_number int,
	purchase_datetime DATETIME,
	booking_fee int,
	total_fare int,
	one_way_or_round int,
	PRIMARY KEY(ticket_number)
);

CREATE TABLE Economy_Ticket (
	ticket_number int,
	cancelation_fee int,
	FOREIGN KEY(ticket_number) REFERENCES Ticket(ticket_number),
	PRIMARY KEY(ticket_number)
);

CREATE TABLE Subticket (
	subticket_number int,
	ticket_number int,
	seat_number CHAR(3),
	class CHAR(1),
	special_meal int,
	FOREIGN KEY(ticket_number) REFERENCES Ticket(ticket_number),
	PRIMARY KEY(ticket_number, subticket_number)
);

CREATE TABLE Person (
	user_name VARCHAR(16),
	password VARCHAR(16),
	person_name VARCHAR(50),
	PRIMARY KEY(user_name)
);

CREATE TABLE Admin (
	user_name VARCHAR(16),
	FOREIGN KEY(user_name) REFERENCES Person(user_name),
	PRIMARY KEY(user_name)
);

CREATE TABLE Customer_Rep (
	user_name VARCHAR(16),
	FOREIGN KEY(user_name) REFERENCES Person(user_name),
	PRIMARY KEY(user_name)
);

CREATE TABLE Customer (
	account_number int,
	user_name VARCHAR(16),
	FOREIGN KEY(user_name) REFERENCES Person(user_name),
	PRIMARY KEY(account_number)
);

CREATE TABLE reserves (
	reservation_id int,
	ticket_number int,
	FOREIGN KEY(reservation_id) REFERENCES Reservation(reservation_id),
	FOREIGN KEY(ticket_number) REFERENCES Ticket(ticket_number),
	PRIMARY KEY(reservation_id, ticket_number)
);

CREATE TABLE waitlisted (
	account_number int,
	airline_id CHAR(2),
	flight_number int,
	queue_number int,
	FOREIGN KEY(account_number) REFERENCES Customer(account_number),
	FOREIGN KEY(airline_id) REFERENCES Airline(airline_id),
	FOREIGN KEY(flight_number) REFERENCES Flight(flight_number),
	PRIMARY KEY(account_number, flight_number)
);

CREATE TABLE makes (
	account_number int,
	reservation_id int,
	FOREIGN KEY(reservation_id) REFERENCES Reservation(reservation_id),
	FOREIGN KEY(account_number) REFERENCES Customer(account_number),
	PRIMARY KEY(account_number, reservation_id)
);
