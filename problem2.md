#CS18 Final
#Problem 2
#Adam Mejia
#filename: problem2.md

###The following SQL code can be executed in PSQL to create the schema
###kata01 and its child tables.
####The idea was to address the following issues in the design of the schema
###Question: Does fractional money exist? and When (if ever) does rounding take place?
####Answer: Absolutely, every little bit counts. The question then becomes where
####does one draw the line. In the case of this example we will simply round any
####fractional values in the price of of item up to the nearest cent. Varied pricing 
####will be established in each field. This way the correct pricing can be pulled
####based on the nature of the transaction.
###Question: How do you keep an audit trail of pricing decisions (and do you need to)?
####Answre: A separate table would be best suited for keeping track of this kind of
####information. A join on the unique item id can be used to link the item with changes
####in pricing and each time a price is changed a new entry will be created in the price
####change table.
###Question: Are costs and prices the same class of thing?
####Answer: No costs would have associated objects that would relate to the purchasing
####aspect of things (i.e. vendor, wholesale pricing, credits, etc...) prices 
####would have associated objects that would relate to the consumer and the selling
####of the products.
###Question: How do you deal with buy two get one free (how do you value the stock)?
####Answer: I would value the stock at both its standard value and at its discounted
####value. Since there is no way of knowing how many customers will take advantage of
####the discount, it is unreasonable to value the stock definitively as one or the other.

CREATE SCHEMA kata01;
CREATE TABLE kata01.products (
	id int PRIMARY KEY,
	product_id int NOT NULL,
	name varchar(20) NOT NULL,
	description varchar(40),
	active_date date NOT NULL,
	mod_date date NOT NULL,
	qty int NOT NULL,
	btgo_qty int,
	std_price decimal(6,2) NOT NULL,
	btgo_disc decimal(6,2),
	other_disc decimal(6,2)
);
CREATE TABLE kata01.purchasing (
	id int PRIMARY KEY,
	product_id int NOT NULL,
	wholesale_price decimal(6,2),
	supplier varchar(20) NOT NULL,
	qty int NOT NULL
);
CREATE TABLE kata01.sales (
	id int PRIMARY KEY,
	product_id int NOT NULL,
	qty int NOT NULL,
	std_price decimal(6,2),
	disc_amt decimal(6,2),
	net_amt decimal(6,2)
);
CREATE TABLE kata01.changes (
	id int PRIMARY KEY,
	product_id int NOT NULL,
	cost decimal(6,2),
	cost_old decimal(6,2),
	std_price decimal(6,2),
	std_price_old decimal(6,2),
	change_date date NOT NULL
);
