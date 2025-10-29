-- Example queries for Flight Reservation System (Oracle SQL)

-- 1. Available seats for a flight instance (instance_id = 1001)
SELECT s.seat_id, s.seat_label, s.seat_type
FROM Seats s
LEFT JOIN Seat_Assignments sa ON s.seat_id = sa.seat_id AND sa.instance_id = 1001
WHERE s.aircraft_id = (SELECT aircraft_id FROM Flight_Instances WHERE instance_id = 1001)
  AND sa.assignment_id IS NULL;

-- 2. Passenger itinerary by passenger_id
SELECT p.first_name, p.last_name, f.flight_number, fi.departure_time, fi.arrival_time, b.booking_reference
FROM Passengers p
JOIN Booking_Passengers bp ON p.passenger_id = bp.passenger_id
JOIN Bookings b ON bp.booking_id = b.booking_id
JOIN Flight_Instances fi ON b.instance_id = fi.instance_id
JOIN Flights f ON fi.flight_id = f.flight_id
WHERE p.passenger_id = 5001;

-- 3. Revenue per flight instance
SELECT fi.instance_id, f.flight_number, SUM(b.total_amount) AS revenue
FROM Flight_Instances fi
JOIN Flights f ON fi.flight_id = f.flight_id
LEFT JOIN Bookings b ON fi.instance_id = b.instance_id
GROUP BY fi.instance_id, f.flight_number;

-- 4. Seats occupied for an instance
SELECT COUNT(*) AS occupied_seats
FROM Seat_Assignments
WHERE instance_id = 1001;

-- 5. Bookings by status
SELECT status, COUNT(*) AS count_bookings
FROM Bookings
GROUP BY status;
