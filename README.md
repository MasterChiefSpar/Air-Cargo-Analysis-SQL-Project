Air Transport Analysis SQL Project

Problem Statement
An new Air Transport logistics company is setting up Database management from scratch and needs to know details of recent flights performed and customers details on those flights for business operations purposes. The company also needs routine queries of certain data to be automated as much as possible. 

Initial Steps followed

Step 1: Create and use Database after login to MySQL Workbench.

Step 2: Import all data into MySQL Workbench, datasets are excel xlsv files.

Step 3: Using reverse engineering function under Database tab in MySQL to get Database schema and edit accordingly.

Step 4: Alter table customer by modifying customer_id as Primary Key.

Step 5: Alter table routes by modifying route_id as primary key.

Step 6: Correct mispelling by updating passengers_on_flights by setting class_id='Business' where class_id='Bussiness'.

Step 7: Correct mispelling by updating update ticket_details by setting brand='British Airways'
where brand='Bristish Airways'.

Step 8: Alter table passengers_on_flights by modifying column route_id as int NOT NULL.

Step 9: Alter table routes by adding constraint foreign key(route_id) that references passengers_on_flights(route_id).

Step 10:  A SQL query was used to create route_details table with columns route_id, flight_num, origin_airport, destination_airport, aircraft_id, and distance_miles. Checked constraint for the flight number and unique constraint for the route_id fields while making sure that the distance miles field is greater than 0.

Step 11: An SQL Query was used to get information on all passengers travelled in routes 1 to 25.

Step 12: An SQL Query was used to get information on number of passengers and total revenue in business class.

Step 13: Column customer_id  was transformed to display the full name of the customer.

Step 14: An SQL Query was used to extract information of customers who registered and booked a ticket.

Step 15: An SQL Query was used to extract customer first and last name based upon customer_id and airline brand = "Emirates".

Step 16: An SQL Query was used to extract information of all customers travelling by Economy Plus Class.

Step 17: An SQL Query was used to identify whether revenue has crossed 10000 using the IF clause on the ticket_details table.

Step 18: An SQL View with only business class customers along with the brand of airlines was created for the company to easily access information regarding business class customers.

Step 19: An SQL stored procedure was created to get the details of all passengers flying between a range of routes defined in run time which will additionally return an error message if the table doesn't exist.

Step 20: An SQL stored procedure was created to extracts all the details from the routes table where the traveled distance is more than 2000 miles.

Step 21: An SQL stored procedure was created that groups the distance traveled by each flight into three categories. The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.
