# ✈️ Flight Reservation System

**Author:** Vandana Tanwar  
**Project Type:** DBMS / Oracle SQL  
**Date Generated:** 2025-10-29

## 📖 Project Description
The Flight Reservation System manages flight schedules, bookings, passenger information, and seat assignments with fare calculations.  
This Oracle SQL DBMS design supports aircraft, routes, flight instances (scheduled flights), seat inventory, bookings, payments, and reporting features.

## 🎯 System Features
- Manage airlines, airports, aircraft, and flight routes.  
- Schedule flight instances with departure/arrival times.  
- Passenger profiles and booking management.  
- Seat inventory and seat assignments (per flight instance).  
- Fare classes and fare calculation (base fare, taxes, fees).  
- Payment tracking and booking status.  
- Reports: available seats, revenue, popular routes, passenger itineraries.

## 📁 Database Tables (suggested)
- Airlines, Airports, Aircrafts
- Flights (route definitions), Flight_Instances (scheduled flights)
- Seats, Fare_Classes
- Passengers, Bookings, Booking_Passengers, Payments
- Seat_Assignments, Audit_Log

## ⚙️ How to Run
1. Install Oracle Database or use [Oracle Live SQL](https://livesql.oracle.com/).  
2. Run the scripts in order:
   ```sql
   tables.sql        -- create tables and constraints
   insert_data.sql   -- sample data inserts
   queries.sql       -- example queries & reports
   ```
3. Verify created tables:
   ```sql
   SELECT table_name FROM user_tables ORDER BY table_name;
   ```

## 🧾 Files in this package
- `README.md` — Project documentation (this file)  
- `tables.sql` — Oracle-compatible table creation script  
- `insert_data.sql` — Sample data for testing  
- `queries.sql` — Useful queries for operations & analytics  
- `er_diagram.png` — ER diagram placeholder image

---

## 🧠 Future Enhancements
- Stored procedures for seat allocation and fare calculation.  
- Automated notifications for schedule changes.  
- Integration with payment gateways and seat map UI.  
- Real-time availability with caching or materialized views.
