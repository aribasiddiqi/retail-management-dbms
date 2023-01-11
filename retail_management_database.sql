CREATE TABLE clothing(   --creating table for strong entity clothing 
    clothing_ID int not null, --attributes 
    clothing_name varchar(50), 
    clothing_type varchar(20), 
    quantity int, 
    material varchar(10), 
    clothing_size varchar(5), 
    CONSTRAINT clothing_pk PRIMARY KEY (clothing_ID) --primary key 
);

CREATE TABLE employee(
    employee_ID int not null, --creating table for strong entity employee
    first_name varchar(25), --attributes 
    last_name varchar(25),  
    postal_code varchar(7), 
    employee_phone_number varchar(25), 
    employee_hourly_wage int, 
    CONSTRAINT employee_pk PRIMARY KEY (employee_ID) --primary keey
);

CREATE TABLE employee_address 
(   street_number int, 
    street_name varchar(25), 
    city varchar(25), 
    province varchar(25), 
    country varchar(25),
    postal_code varchar(7),
    CONSTRAINT postal_code PRIMARY KEY (postal_code)
 );
 
CREATE TABLE retail_manager ( --creating table for weak entity retail_manager 
  employee_ID int, 
  manager_type varchar(25), 
  PRIMARY KEY (employee_ID)
);

CREATE TABLE floor_worker ( --creating table for weak entity floor_worker 
  employee_ID int, 
  department varchar(25), 
  Primary key (employee_ID) 
);

ALTER TABLE retail_manager ADD FOREIGN KEY (employee_ID) REFERENCES employee (employee_ID) ON DELETE CASCADE; --constraint to make retail_manager weak 
ALTER TABLE floor_worker ADD FOREIGN KEY (employee_ID) REFERENCES employee (employee_ID) ON DELETE CASCADE; --record will delete if the referenced employee_ID is deleted

CREATE TABLE marketing_project( --creating table for strong entity marketing_project 
    project_ID int not null, --attributes 
    quantity int, 
    employee_ID int, 
    Foreign key (employee_id) references employee(employee_ID), 
    marketing_medium varchar(25), 
    CONSTRAINT marketing_project_pk PRIMARY KEY (project_id) --primary key
);

create TABLE equipment( --creating table for strong entity equipment 
    equipment_ID int not null, --attributes 
    quantity int, 
    material varchar(25), 
    equipment_type varchar(25), 
    CONSTRAINT equipment_pk PRIMARY KEY (equipment_ID) --primary key 
); 

create TABLE customer(  --creating table for strong entity customer 
    customer_ID int not null, --attributes 
    first_name varchar(25), 
    last_name varchar(25), 
    email varchar(100), 
    phone_number varchar(25), 
    clothing_type varchar(25), 
    postal_code varchar(7), 
    CONSTRAINT customer_pk PRIMARY KEY (customer_ID) --primary key 
); 

CREATE TABLE customer_address 
(   street_number int, 
    street_name varchar(25), 
    city varchar(25), 
    province varchar(25), 
    country varchar(25),
    postal_code2 varchar(7),
    CONSTRAINT postal_code2 PRIMARY KEY (postal_code2)
 );

CREATE table helps( --creating tables for relationships 
    employee_ID int not null ,
    customer_ID int not null,
    Foreign key (employee_ID) references employee(employee_ID),
    Foreign key (customer_ID) references customer(customer_ID)  
);

CREATE table buys( 
    clothing_ID int not null ,
    customer_ID int not null,
    Foreign key (clothing_ID) references clothing(clothing_ID),
    Foreign key (customer_ID) references customer(customer_ID)  
);

CREATE table manages( 
    project_ID int not null ,
    employee_ID int not null,
    Foreign key (project_ID) references marketing_project(project_ID),
    Foreign key (employee_ID) references employee(employee_ID)  
);

CREATE table influences( 
    project_ID int not null ,
    customer_ID int not null,
    Foreign key (project_ID) references marketing_project(project_ID),
    Foreign key (customer_ID) references customer(customer_ID)  
);

CREATE table organizes( 
    equipment_ID int not null ,
    employee_ID int not null,
    Foreign key (employee_ID) references employee(employee_ID),
    Foreign key (equipment_ID) references equipment(equipment_ID)  
);

--inserting values into customer 

INSERT INTO customer VALUES(
    423, 'Jane', 'Doe', 'jane.doe@gmail.com', '4164224413', 'casual', 'M1M2Z9'
  );

INSERT INTO customer VALUES(
    212, 'John', 'Doe', 'john.doe@gmail.com', '4217772727', 'formal', 'M1M2ZF'
  );
  
  INSERT INTO customer VALUES(
    215, 'Apple', 'Bee', 'apple.bee@gmail.com', '4217772789', 'casual','M1M2Z9'
  );

 INSERT INTO customer_address VALUES(
    '44', 'Thorncliffe Park', 'East York', 'Ontario', 'Canada', 'M1M2Z9' 
  );

--inserting values into employee
INSERT INTO employee VALUES(
    665, 'Melissa', 'Dawn', 'M1M2Z9', '219372093', 23 
  );

INSERT INTO employee VALUES(
    669, 'Bob', 'Dylan', 'M1M2F2', '231312312', 24 
  );
  
INSERT INTO employee VALUES(
    770, 'Alisa', 'Xox','M1M2Fl', '2313132423', 29 
  );
  
  INSERT INTO employee_address VALUES(
    '44', 'Thorncliffe Park', 'East York', 'Ontario', 'Canada', 'M1M2Z9' 
  );
  
--inserting values into equipment 

INSERT INTO equipment VALUES(
    324, 10, 'wood', 'hangers'
  );
  
INSERT INTO equipment VALUES(
    327, 10, 'plastic', 'hangers'
  );
  
INSERT INTO equipment VALUES(
    330, 2, 'plastic', 'mannequin'
  );
  
--inserting values into clothing 
INSERT INTO clothing VALUES(
    124, 'halter top', 'crop top', 5, 'cotton', 'S' 
  );
  
  INSERT INTO clothing VALUES(
    127, 'slip dress', 'dress', 2, 'satin', 'L' 
  );
  
  --inserting values into marketing_project
INSERT INTO marketing_project VALUES(
    863, 97, 669, 'poster' 
  );
  
  INSERT INTO marketing_project VALUES(
    868, NULL, 665, 'instagram post' 
  );
  
  
    --inserting values into floor_worker
INSERT INTO floor_worker VALUES(
    665, 'mens' 
  );
  
  INSERT INTO floor_worker VALUES(
    669, 'womens' 
  );
  
    --inserting values into retail_manager 
INSERT INTO retail_manager VALUES(
    770, 'shift manager' 
  );
  
INSERT INTO helps VALUES(
    665, 423
  );
  
INSERT INTO organizes VALUES(
   324, 665 
); 
  

INSERT INTO organizes VALUES(
   324, 665 
); 
  
INSERT INTO manages VALUES(
863, 669);
  
  
INSERT INTO influences VALUES(
863, 423);
  
--list all columns of table
SELECT * FROM customer;
SELECT * FROM employee;
SELECT * FROM equipment;
SELECT * FROM marketing_project;
SELECT * FROM clothing;

--list customers by first and last name from East York 
SELECT first_name, 
last_name 
FROM employee 
where employee_hourly_wage=23;

--list customers by first name, in ascending order 
SELECT * 
FROM customer
ORDER BY first_name ASC;

--list distinct clothing types in customer table in ascending order 
SELECT DISTINCT clothing_type
FROM customer
ORDER BY clothing_type ASC;

--list employees making less than 25/hour in descending order 
SELECT DISTINCT employee_ID, first_name
FROM employee
WHERE employee_hourly_wage < 25
ORDER BY employee_hourly_wage DESC;

--list the equipment types made of wood 
SELECT equipment_type 
FROM equipment
WHERE material='wood';

--list clothing names where less than 3 articles are in inventory 
SELECT clothing_name, quantity
FROM clothing
WHERE quantity <= 3
ORDER BY quantity DESC;

--list project IDs managed on Instagram 
SELECT project_ID
FROM marketing_project
WHERE marketing_medium='instagram post';

--list floor workers in mens section
SELECT employee_ID
FROM floor_worker
WHERE department='mens'; 

--list shift managers by name in descending order
SELECT employee_ID
FROM retail_manager 
WHERE manager_type='shift manager'
ORDER BY employee_ID DESC;

--updates customer name
UPDATE 
    customer 
SET
    first_name='Sima'
WHERE 
    customer_ID=423; 
  
  
  --updates customer name
UPDATE 
    customer 
SET
    first_name='Sima'
WHERE 
    customer_ID=425; 
  
  
UPDATE 
    customer
SET
    first_name='Ariba'
WHERE
    customer_ID=423; 

--create view called new_fashion that displays clothing that are type dress 
CREATE VIEW new_fashion AS 
	   (SELECT *
        FROM clothing
        WHERE clothing_type='dress');

-- create view called large_size that displays clothing size large 
CREATE VIEW large_sizes AS 
	   (SELECT *
        FROM clothing
        WHERE clothing_size = 'L');

-- create view called on_25 that displays employees making less than $25 in Ontario 
CREATE VIEW less_25 AS 
	   (SELECT *
        FROM employee 
        WHERE employee_hourly_wage < 25);

-- create view called new_equipment where the material is plastic and more than 10 exist 
CREATE VIEW new_equipment AS 
	   (SELECT *
        FROM equipment
        WHERE material = 'plastic'
        AND quantity >= 10);
        
-- query to join matching values from the employee table and marketing_project table using common employee_id value 
SELECT marketing_project.project_ID, employee.first_name, marketing_project.marketing_medium
FROM marketing_project
INNER JOIN employee ON marketing_project.employee_ID=employee.employee_ID;

  
-- query to join matching values from the employee, customer, and helps table to see which employee helped which customer 
SELECT
  helps.customer_ID, 
  customer.first_name,
  employee.first_name 
FROM helps
JOIN customer 
  ON helps.customer_ID = customer.customer_ID
JOIN employee
  ON helps.employee_ID = employee.employee_ID; 
  
  
  -- query to join matching values from the employee, equipment, and organizes table to see which equipment is managed by which employee 
SELECT
  organizes.equipment_ID, 
  employee.first_name, 
  equipment.equipment_type
FROM organizes
JOIN employee 
  ON organizes.employee_ID = employee.employee_ID
JOIN equipment
  ON organizes.equipment_ID = equipment.equipment_ID; 
    

-- query using count keyword 
SELECT COUNT(customer_ID), clothing_type
FROM customer
GROUP BY clothing_type
HAVING COUNT(customer_ID) > 1;
    
-- query using union keyword
SELECT city FROM customer_address
UNION
SELECT city FROM employee_address;

--query using exists keyword 
SELECT first_name
FROM customer
WHERE EXISTS (SELECT clothing_type FROM customer WHERE clothing_type='formal');
    
--query using minus keyword 
SELECT customer_ID
FROM customer
MINUS
SELECT customer_ID
FROM helps;


SELECT marketing_project.project_ID, employee.first_name, marketing_project.marketing_medium
FROM marketing_project
INNER JOIN employee ON marketing_project.employee_ID=employee.employee_ID;

