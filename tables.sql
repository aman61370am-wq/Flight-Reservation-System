-- Flight Reservation System Tables (Oracle SQL compatible)

-- Airlines
CREATE TABLE Airlines (
    airline_id NUMBER PRIMARY KEY,
    airline_name VARCHAR2(200),
    iata_code VARCHAR2(3),
    country VARCHAR2(100)
);

-- Airports
CREATE TABLE Airports (
    airport_id NUMBER PRIMARY KEY,
    name VARCHAR2(200),
    iata_code VARCHAR2(3),
    city VARCHAR2(100),
    country VARCHAR2(100)
);

-- Aircrafts
CREATE TABLE Aircrafts (
    aircraft_id NUMBER PRIMARY KEY,
    model VARCHAR2(100),
    registration VARCHAR2(50),
    seat_capacity NUMBER
);

-- Flights (route definitions)
CREATE TABLE Flights (
    flight_id NUMBER PRIMARY KEY,
    airline_id NUMBER REFERENCES Airlines(airline_id),
    flight_number VARCHAR2(10),
    origin_airport_id NUMBER REFERENCES Airports(airport_id),
    destination_airport_id NUMBER REFERENCES Airports(airport_id),
    duration_minutes NUMBER
);

-- Flight Instances (scheduled departures)
CREATE TABLE Flight_Instances (
    instance_id NUMBER PRIMARY KEY,
    flight_id NUMBER REFERENCES Flights(flight_id),
    aircraft_id NUMBER REFERENCES Aircrafts(aircraft_id),
    departure_time DATE,
    arrival_time DATE,
    status VARCHAR2(30) -- Scheduled, Delayed, Cancelled, Completed
);

-- Fare Classes
CREATE TABLE Fare_Classes (
    fare_class_id NUMBER PRIMARY KEY,
    class_name VARCHAR2(50), -- Economy, Premium, Business
    price_multiplier NUMBER -- multiplier over base fare
);

-- Seats (template per aircraft model - seat map simplified)
CREATE TABLE Seats (
    seat_id NUMBER PRIMARY KEY,
    aircraft_id NUMBER REFERENCES Aircrafts(aircraft_id),
    seat_label VARCHAR2(10),
    seat_type VARCHAR2(50) -- Window, Aisle, Middle
);

-- Seat Inventory per flight instance
CREATE TABLE Seat_Assignments (
    assignment_id NUMBER PRIMARY KEY,
    instance_id NUMBER REFERENCES Flight_Instances(instance_id),
    seat_id NUMBER REFERENCES Seats(seat_id),
    booking_id NUMBER REFERENCES Bookings(booking_id),
    assigned NUMBER(1) -- 1 = assigned, 0 = free
);

-- Passengers
CREATE TABLE Passengers (
    passenger_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    dob DATE,
    email VARCHAR2(150),
    phone VARCHAR2(30)
);

-- Bookings
CREATE TABLE Bookings (
    booking_id NUMBER PRIMARY KEY,
    booking_reference VARCHAR2(20) UNIQUE,
    instance_id NUMBER REFERENCES Flight_Instances(instance_id),
    booking_date DATE,
    total_amount NUMBER,
    status VARCHAR2(30) -- Confirmed, Cancelled, Pending
);

-- Booking_Passengers (which passengers are on a booking)
CREATE TABLE Booking_Passengers (
    booking_id NUMBER REFERENCES Bookings(booking_id),
    passenger_id NUMBER REFERENCES Passengers(passenger_id),
    fare_class_id NUMBER REFERENCES Fare_Classes(fare_class_id),
    ticket_number VARCHAR2(30),
    PRIMARY KEY (booking_id, passenger_id)
);

-- Payments
CREATE TABLE Payments (
    payment_id NUMBER PRIMARY KEY,
    booking_id NUMBER REFERENCES Bookings(booking_id),
    amount NUMBER,
    payment_date DATE,
    payment_method VARCHAR2(50)
);

-- Audit Log
CREATE TABLE Audit_Log (
    audit_id NUMBER PRIMARY KEY,
    entity VARCHAR2(100),
    entity_id VARCHAR2(100),
    action VARCHAR2(100),
    action_time DATE,
    performed_by VARCHAR2(200),
    details VARCHAR2(1000)
);
