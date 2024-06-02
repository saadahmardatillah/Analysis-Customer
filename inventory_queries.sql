# Create a database with ‘KALBE’ as the name. 

create database KALBE;

use KALBE;

# Create table inventory

create table inventory(
	item_code varchar(5) NOT NULL,
	item_name varchar(50) NOT NULL,
	item_price int NOT NULL DEFAULT 0,
	item_total int NOT NULL DEFAULT 0,
	PRIMARY KEY (item_code),
	UNIQUE KEY item_unique (item_code)
)ENGINE = InnoDB;

show tables;

# Insert Records

insert into inventory (item_code, item_name, item_price, item_total)
Values ('2341','Promag Tablet',3000,100),
	   ('2342','Hydro Coco 250ML',7000,20),
	   ('2343','Nutrive Benecol 100ML',20000,30),
	   ('2344','Blackmores Vit C 500Mg',95000,45),
	   ('2345','Entrasol Gold 370G',90000,120);

# Show item_name Show Item_name that has the highest number in Item_total.

select item_name
from inventory
where item_total = (select max_total_item from
				   (select max(item_total) as max_total_item from inventory)
				   as max);

# Update the Item_price of the output of question bullet

WITH item_total_max AS (
    SELECT MAX(item_total) AS max_total
    FROM inventory
)
update inventory
join item_total_max
on inventory.item_total = item_total_max.max_total
set inventory.item_price = '100000';

# Delete the Item_name that has the lowest number of Item_total.

delete from inventory
where item_total = (select min_item_total from (select min(item_total)
					as min_item_total from inventory) as subquery);