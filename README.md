Air Cargo Analysis SQL Project

Problem Statement
An new Air Cargo logistics company is setting up Database management from scratch and needs to know details of recent flights performed and customers details on those flights for business operations purposes. The company also needs routine queries of certain data to be automated as much as possible. 

Initial Steps followed
#Step 1: Create and use Database after login to MySQL Workbench
#Step 2: Import all data into MySQL Workbench, datasets are excel xlsv files.
#Step 3: Using reverse engineering function under Database tab in MySQL to get Database schema and edit accordingly.
#Step 4: Alter table customer by modifying customer_id as Primary Key
#Step 5: Alter table routes by modifying route_id as primary key
#Step 6: Correct mispelling by updating passengers_on_flights by setting class_id='Business' where #class_id='Bussiness'
#Step 7: correct mispelling by updating update ticket_details by setting brand='British Airways'
#where brand='Bristish Airways'
#Step 8: Drop table route_details as it is deemed unnecesscary
#Step 9: Alter table passengers_on_flights by modifying column route_id as int NOT NULL
#Step 10: Alter table routes by adding constraint foreign key(route_id) that references #passengers_on_flights(route_id)


