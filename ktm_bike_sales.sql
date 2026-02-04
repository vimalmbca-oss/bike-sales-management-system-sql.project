create database ktm_bike_sales;
use ktm_bike_sales; 
-------------------------------------------------------------------------------------------
-- tables--
-- branchs table--   
create table branch(br_id int auto_increment primary key,
br_name varchar(100),br_addrs varchar(1000));

insert into branch values
(1,"3-roads","new bus stand, main road,salem"),
(2,"seelanaickenpatti","seelanaickenpatti ,bypass,salem"),
(3,"namakkal","bypass,main road,namakkal"),
(4,"dharmapuri","pennagaram,main road,dharmapuri");

select*from branch;
-------------------------------------------------------------------------------------------
-- bike_models_table--
create table models(bike_id int auto_increment primary key,
Bike_model varchar(100),
ex_showroom_price int,
onraod_price int);

insert into models values
(1,"duke125",180000,215000),
(2,"duke200",210000,235000),
(3,"duke250",223000,255000),
(4,"duke390",280000,367000),
(5,"RC125",180000,215000),
(6,"RC200",220000,245000),
(7,"RC390",288000,257000),
(8,"Adventure250",235000,265000),
(9,"Adeventure390",289000,357000);
 
select*from models;

----------------------------------------------------------------------------------------
            
-- customer_table-- 
create table customers(cus_id int auto_increment primary key,
cus_name varchar(100) not null,
phone_no varchar(15) not null,
email_id varchar(200) not null,
address varchar(1000) not null,
bike_id int,constraint Fk_branckid foreign key(bike_id) references models(bike_id),
br_id int,constraint F_branckid foreign key(br_id) references branch(br_id),
booking_date date not null,
initial_amount int not null);

drop table customers;

insert into customers values
(1,"vimal",1243567890,"vimal@gmail.com","456 Ice Cream Ave, Lincoln",2,1,"2025-09-21",60000),
(2,"kishore",3214568790,"kishorek@gmail.com","789 Creamy Rd, Denver",1,2,"2025-09-24",75000),
(3,"jeeva",4532109867,"jeeva@gmail.com","101 Frozen Ln, New salem",3,2,"2025-09-26",40000),
(4,"dharshan",3214657809,"dharshan@gmail.com","202 Cold St, Miami",4,3,"2025-09-30",72000),
(5,"saravana",2134568790,"saravana@gmail.com","303 Chill Blvd, Los namakkal",5,4,"2025-10-02",55000),
(6,"santhosh",9021346578,"santhosh@gmail.com","404 Icebox Dr, Phoenix",8,1,"2025-10-04",120000),
(7,"maniraja",3214568790,"mainraja@gmail.com","505 Frost Way, Seattle",5,1,"2025-10-06",80000),
(8,"sanjay kumar",4312568790,"sanjay@gmail.com","606 Glacier Rd, Austin",3,3,"2025-10-07",163000),
(9,"vicky",4312568790,"vicky@gmail.com","707 Snowy Ln, Portland",2,4,"2025-10-18",54000),
(10,"ramraj",8796054321,"ramraj@gmail.com","456 Ice Cream Ave",9,1,"2025-10-21",134000),
(11,"santhosh kumar",9012346578,"sanday@gmail.com","453 Cold St, Miami",6,1,"2025-10-28",83000),
(12,"dhoni",3214657890,"dhoni@gmail.com","342 Chill Blvd, Los namakkal",7,2,"2025-11-04",74000),
(13,"gowtham",54314576890,"gowtham@gmail.com","456 Glacier Rd, Austin",1,3,"2025-11-11",34000),
(14,"rahul;",4356789102,"rahul@gmail.com","231 Snowy Ln, Portland",2,3,"2025-11-14",70000),
(15,"suriya",6789012345,"suriyaam@gmail.com","323 Icebox Dr, Phoenixn",4,2,"2025-11-22",56000);

select*from customers;
 
-------------------------------------------------------------------------------------------
 
-- delivery_table -- 
create table delivery
(delivery_id int auto_increment,
delivery_date date,
payment_type varchar(100),
constraint Fk_branchid foreign key(delivery_id) references customers(cus_id));

drop table delivery;

insert into delivery values
(1,"2025-09-23","EMI"),
(2,"2025-09-25","EMI"),
(3,"2025-09-29","full-cash-payment"),
(4,"2025-10-01","EMI"),
(5,"2025-10-04","EMI"),
(6,"2025-10-04","full-cash-payment"),
(7,"2025-10-09","EMI"),
(8,"2025-10-10","full-cash-payment"),
(9,"2025-10-19","full-cash-payment"),
(10,"2025-10-24","EMI"),
(11,"2025-10-31","full-cash-payment"),
(12,"2025-11-05","EMI"),
(13,"2025-11-12","full-cash-payment"),
(14,"2025-11-16","EMI"),
(15,"2025-11-24","EMI");

select*from delivery;

----------------------------------------------------------------------------------------------

show databases;

show tables;

show columns from customers;
show columns from branch;
show columns from delivery;
show columns from models;

describe customers;

select bike_model,ex_showroom_price,onraod_price,ex_showroom_price-onraod_price as document_charges from models;
select bike_model,ex_showroom_price,onraod_price,ex_showroom_price-onraod_price 
as document_charges 
from models where bike_model like'd%';

set sql_safe_update=0;

-------------------------------------------------------------------------------------------------

-- joins--

-- customers joins modesl--  
 select customers.cus_name,customers.phone_no,customers.address,customers.booking_date,
 models.bike_model from customers inner join models
 on customers.bike_id=models.bike_id order by customers.cus_id;
 
 -------------------------------------------------------------------------------------------------
 
 -- where--  
 
 select customers.cus_name,customers.phone_no,customers.address,customers.booking_date,
 models.bike_model from customers inner join models
 on customers.bike_id=models.bike_id where bike_model="duke200" order by customers.cus_id; 
  
 select customers.cus_name,customers.phone_no,models.bike_model from customers inner join models
 on customers.bike_id=models.bike_id where bike_model like"R%" order by customers.cus_id; 
 
 select customers.cus_name,customers.phone_no,models.bike_model from customers inner join models
 on customers.bike_id=models.bike_id where bike_model like"A%" order by customers.cus_id; 
 
 select customers.cus_name,customers.phone_no,models.bike_model from customers inner join models
 on customers.bike_id=models.bike_id where cus_name like"s%" order by customers.cus_id; 
  
 select customers.cus_name,customers.phone_no,customers.initial_amount,models.bike_model,models.onraod_price,
 customers.initial_amount-models.onraod_price as balace_amount from customers inner join models
 on customers.bike_id=models.bike_id order by customers.cus_id;
 
 select customers.initial_amount-models.onraod_price as balace_amount from customers inner join models
 on customers.bike_id=models.bike_id order by customers.cus_id;
 
 select customers.cus_name,customers.phone_no,customers.initial_amount,models.bike_model,models.onraod_price,
 customers.initial_amount-models.onraod_price as balace_amount from customers inner join models
 on customers.bike_id=models.bike_id where cus_name="dharshan" order by customers.cus_id;
 
 
 select customers.cus_name,customers.phone_no,customers.address,customers.booking_date,
 models.bike_model from customers inner join models
 on customers.bike_id=models.bike_id where booking_date >"2025-10-31" order by customers.cus_id;

select customers.cus_name,customers.phone_no,customers.address,customers.booking_date,
 models.bike_model from customers inner join models
 on customers.bike_id=models.bike_id 
 where booking_date <"2025-10-31" and  booking_date >"2025-10-01" order by customers.cus_id;
  
  -----------------------------------------------------------------------------------------------------
  
-- customers joins branchs--  
 
select customers.cus_name,customers.phone_no,branch.br_name from customers inner join branch
on customers.br_id=branch.br_id order by customers.cus_id;


select customers.cus_name,customers.phone_no,branch.br_name from customers inner join branch
on customers.br_id=branch.br_id  order by customers.cus_id;


-----------------------------------------------------------------------------------------------------------

-- customes joins delivery-- 
select customers.cus_name, delivery.delivery_date,delivery.payment_type from delivery inner join customers
on delivery.delivery_id=customers.cus_id
order by delivery_id;

select delivery.delivery_date,delivery.payment_type,customers.cus_name,customers.initial_amount from delivery inner join customers
on delivery.delivery_id=customers.cus_id where payment_type="EMI"
order by delivery_id;

select delivery.delivery_date,delivery.payment_type,customers.cus_name,customers.initial_amount from delivery inner join customers
on delivery.delivery_id=customers.cus_id where payment_type="full-cash-payment"
order by delivery_id;


