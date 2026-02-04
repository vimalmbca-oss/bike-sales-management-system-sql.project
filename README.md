# 🛵BIKE SALES MANAGEMENT SYSTEM(SQL-Project)

## 📌 Project Description
The Bike Sales Management System is a MySQL database project designed to manage and analyze bike sales operations across multiple branches.

This system maintains records of:

- Branch details
- KTM bike models and pricing
- Customer bookings
- Delivery information
- Payment types (EMI / Full Cash)

The project demonstrates the use of database design, primary & foreign keys, joins, filtering, and data analysis queries using SQL.

---
##🎯 Key Functionalities

- Track bike bookings across multiple branches
- Calculate customer pending amount
- Identify EMI and full cash customers
- Filter customers by date range
- Generate sales insights using SQL queries

---

## 🗂️ Database Structure
The project contains the following tables:

###1️⃣ Branch Table
Stores branch details:
- Branch ID
- Branch Name
- Branch Address

###2️⃣ Models Table
Stores KTM bike model details:
- Bike ID
- Bike Model Name
- Ex-Showroom Price
- On-Road Price

###3️⃣ Customers Table
Stores customer booking details:
- Customer ID
- Name
- Phone Number
- Email
- Address
- Booked Bike Model (Foreign Key)
- Branch (Foreign Key)
- Booking Date
- Initial Amount Paid

###4️⃣ Delivery Table
Stores delivery and payment information:
- Delivery ID
- Delivery Date
- Payment Type (EMI / Full Cash)
- Linked to Customer using Foreign Key

---

##💻 Technologies Used

- MySQL
- SQL Queries
- Relational Database Design

---  

## 🔧 tools used
- MySql-Workbench

---

## 🛠️ SQL Concepts Used

This project includes:

- Database creation
- Table creation with constraints
- Primary Key & Foreign Key implementation
- Insert, Select queries
- Inner Joins
- Where conditions
- LIKE operator
- Date filtering
- Order By
- Calculated fields (Balance amount, Document charges)

---







