create database bcg_sql_project

use bcg_sql_project

alter table customer
modify column customer_id int primary key

alter table routes
modify column route_id int primary key

update passengers_on_flights
set class_id='Business'
where class_id='Bussiness'

update ticket_details
set brand='British Airways'
where brand='Bristish Airways'

ALTER TABLE passengers_on_flights
MODIFY COLUMN route_id int NOT NULL;
alter table routes add constraint foreign key(route_id) references passengers_on_flights(route_id)

-/* 2. Write a query to create route_details table using suitable data types for the fields,
 such as route_id, flight_num, origin_airport, destination_airport, aircraft_id, and distance_miles. 
 Implement the check constraint for the flight number and unique constraint for the route_id fields. 
Also, make sure that the distance miles field is greater than 0. */

create table route_details (
	route_id int, foreign key (route_id) references routes(route_id),
	flight_num int check (flight_num > 1100),
	origin_airport varchar(5) ,
	destination_airport varchar(5) ,
	aircraft_id varchar(10) ,
	distance_miles int check (distance_miles > 0),
	constraint unique_route_id unique (route_id)
);
    

-- 3. all passengers travelled in routes 1 to 25

select p.customer_id, p.route_id, first_name, last_name
from passengers_on_flights p
inner join customer c
on p.customer_id = c.customer_id 
group by p.customer_id, p.route_id, first_name, last_name
having p.route_id between 1 and 25
 
 -- 4. number of passengers and total revenue in business class
 
select class_id as Class,
		count(*) as "Number of passengers",
        concat("$" ,sum(Price_per_ticket * no_of_tickets)) as "Total revenue"
from ticket_details t
where class_id = 'Business'
group by class_id

-- 5. display the full name of the customer

select customer_id,
		concat(first_name,' ', last_name) as "Full Name", 
		date_of_birth,
		gender
from customer

-- 6. extract customers who registered and booked a ticket

select  t.customer_id,
		concat(first_name,' ', last_name) as "Full Name",
        p_date,
        class_id,
        brand
from customer c 
inner join ticket_details t
on c.customer_id = t.customer_id 
where no_of_tickets = 1 
group by t.customer_id, p_date, class_id, brand

-- 7. customer first name and last name based on customer ID and brand 

select  t.customer_id,
		first_name,
        last_name,
        brand
from customer c 
inner join ticket_details t
on c.customer_id = t.customer_id 
where no_of_tickets = 1 and brand = 'Emirates'
group by t.customer_id, first_name, last_name, brand

-- 8. customers who travel by economy plus 

select  p.customer_id,
		concat(first_name,' ', last_name) as "Full Name",
        travel_date,
        class_id
from customer c 
inner join passengers_on_flights p 
on c.customer_id = p.customer_id 
group by p.customer_id, travel_date, class_id
having class_id = 'Economy Plus'

-- 9. identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.

select sum(price_per_ticket * no_of_tickets) as Total_Revenue,
		if(sum(price_per_ticket * no_of_tickets) > 10000, 'Yes', 'No')
        as Revenue_crossed_10000
from ticket_details

-- 10. create a view with only business class customers along with the brand of airlines.

create view vw_business_class as

select  t.customer_id,
		concat(first_name,' ', last_name) as "Full Name",
        t.class_id,
        brand
from customer c 
inner join passengers_on_flights p 
on c.customer_id = p.customer_id 
inner join ticket_details t
on p.customer_id = t.customer_id
group by p.customer_id, class_id, brand
having class_id = 'Business'


/* 11. create a stored procedure to get the details of all passengers flying between a range of routes defined in run time. 
Also, return an error message if the table doesn't exist. */

delimiter $$
create procedure get_passengers_between_routes
(in start_route int, in end_route int)
BEGIN
if not exists
	(select * from passengers_on_flights where route_id between start_route and end_route)
	then 
		select "The table doesnt exist" AS error_message; 
	else 
		select c.first_name, c.last_name, p.*
		from passengers_on_flights p 
		inner join
		customer c 
		on p.customer_id = c.customer_id 
		where p.route_id between start_route and end_route;
END if;
END $$
delimiter ;

/* 12. create a stored procedure that extracts all the details from the routes table where 
the traveled distance is more than 2000 miles. */

DELIMITER $$
create procedure get_routes_over_2000_miles()
BEGIN
		select  * FROM routes
		where distance_miles > 2000;
END $$
DELIMITER ;



/*13. create a stored procedure that groups the distance traveled by each flight into three categories. 
The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) 
for >2000 AND <=6500, and long-distance travel (LDT) for >6500.*/


delimiter $$
create procedure Dist_travel ()
BEGIN
	select case 
	when distance_miles between 0 and 2000 then 'Short Distance Travel'
	when distance_miles >2000 and distance_miles <=6500 then 'Intermediate Distance Travel'
	else 'Long Distance Travel' 
END
	as dist_class,
	route_id from routes
	order by distance_miles, dist_class, route_id;
END $$
DELIMITER ;

