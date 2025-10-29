-- Sample data for Flight Reservation System (Oracle SQL)

-- Airlines
INSERT INTO Airlines VALUES (1,'Air India','AI','India');
INSERT INTO Airlines VALUES (2,'IndiGo','6E','India');

-- Airports
INSERT INTO Airports VALUES (1,'Chhatrapati Shivaji Maharaj International Airport','BOM','Mumbai','India');
INSERT INTO Airports VALUES (2,'Indira Gandhi International Airport','DEL','New Delhi','India');
INSERT INTO Airports VALUES (3,'Pune Airport','PNQ','Pune','India');

-- Aircrafts
INSERT INTO Aircrafts VALUES (1,'Airbus A320','VT-AXX',180);
INSERT INTO Aircrafts VALUES (2,'Boeing 737','VT-BYY',160);

-- Flights (route definitions)
INSERT INTO Flights VALUES (100,1,'AI101',1,2,100);
INSERT INTO Flights VALUES (101,2,'6E202',2,3,85);

-- Flight Instances (scheduled flights)
INSERT INTO Flight_Instances VALUES (1001,100,1,TO_DATE('2025-11-10 09:00','YYYY-MM-DD HH24:MI'),TO_DATE('2025-11-10 11:00','YYYY-MM-DD HH24:MI'),'Scheduled');
INSERT INTO Flight_Instances VALUES (1002,101,2,TO_DATE('2025-11-11 14:30','YYYY-MM-DD HH24:MI'),TO_DATE('2025-11-11 15:55','YYYY-MM-DD HH24:MI'),'Scheduled');

-- Fare Classes
INSERT INTO Fare_Classes VALUES (1,'Economy',1.0);
INSERT INTO Fare_Classes VALUES (2,'Premium Economy',1.3);
INSERT INTO Fare_Classes VALUES (3,'Business',2.0);

-- Seats (simple sample for aircraft 1)
INSERT INTO Seats VALUES (1,1,'1A','Window');
INSERT INTO Seats VALUES (2,1,'1B','Aisle');
INSERT INTO Seats VALUES (3,1,'2A','Window');

-- Passengers
INSERT INTO Passengers VALUES (5001,'Vandana','Tanwar',TO_DATE('1990-05-20','YYYY-MM-DD'),'vandana@example.com','+911234567890');
INSERT INTO Passengers VALUES (5002,'Alice','Sharma',TO_DATE('1992-08-10','YYYY-MM-DD'),'alice@example.com','+911234567891');

-- Bookings
INSERT INTO Bookings VALUES (9001,'BR12345',1001,TO_DATE('2025-10-25','YYYY-MM-DD'),15000,'Confirmed');
INSERT INTO Bookings VALUES (9002,'BR12346',1002,TO_DATE('2025-10-26','YYYY-MM-DD'),8000,'Confirmed');

-- Booking_Passengers
INSERT INTO Booking_Passengers VALUES (9001,5001,1,'TCK1001');
INSERT INTO Booking_Passengers VALUES (9002,5002,1,'TCK1002');

-- Seat Assignments (assign passenger to seat on instance 1001)
INSERT INTO Seat_Assignments VALUES (1,1001,1,9001,1);

-- Payments
INSERT INTO Payments VALUES (7001,9001,15000,TO_DATE('2025-10-25','YYYY-MM-DD'),'Credit Card');
INSERT INTO Payments VALUES (7002,9002,8000,TO_DATE('2025-10-26','YYYY-MM-DD'),'UPI');

-- Audit Log
INSERT INTO Audit_Log VALUES (1,'Bookings','9001','Created',TO_DATE('2025-10-25','YYYY-MM-DD'),'System','Booking created by user');
