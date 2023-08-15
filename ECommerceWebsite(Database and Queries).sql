
/*Creating a database named E_Commerece for the E-Commerce Website*/
create database E_Commerce;
use E_Commerce;

/*1-->
Creating tables for supplier,customer,category,product,supplier_pricing,order,rating in the database*/

create table supplier(
SUPP_ID int primary key not null,
SUPP_CITY varchar(50) not null,
SUPP_PHONE varchar(50)
);

alter table supplier add column SUPP_NAME varchar(50) after SUPP_ID;

create table customer(
CUS_ID int primary key,
CUS_NAME varchar(20) not null,
CUS_PHONE varchar(10) not null,
CUS_CITY varchar(30) not null,
CUS_GENDER char
);

create table category(
CAT_ID int,
CAT_NAME varchar(20) not null
);

alter table category add primary key(CAT_ID);

create table product(
PRO_ID int primary key,
PRO_NAME varchar(20) not null default "Dummy",
PRO_DESC varchar(60),
CAT_ID int,
Foreign key(CAT_ID) references category(CAT_ID)
);

create table supplier_pricing(
PRICING_ID int primary key,
PRO_ID int,
foreign key(PRO_ID) references product(PRO_ID),
SUPP_ID int,
foreign key(SUPP_ID) references supplier(SUPP_ID),
SUPP_PRICE int default 0
);

create table `order`(
ORD_ID int primary key,
ORD_AMOUNT int not null,
ORD_DATE date not null,
CUS_ID int,
foreign key(CUS_ID) references customer(CUS_ID),
PRICING_ID int,
foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

create table rating(
RAT_ID int primary key,
ORD_ID int,
foreign key(ORD_ID) references `order`(ORD_ID),
RAT_RATSTARS int not null
);

/*2-->
Inserting the data in the table created above*/

insert into supplier values(1,"Rajesh Retails","Delhi","1234567890");
insert into supplier values(2,"Appario Ltd.","Mumbai","2589631470");
insert into supplier values(3,"Knome products","Banglore","9785462315");
insert into supplier values(4,"Bansal Retails","Kochi","8975463285");
insert into supplier values(5,"Mittal Ltd.","Lucknow","7898456532");

insert into customer values(1,"AAKASH","9999999999","Delhi","M");
insert into customer values(2,"AMAN","9785463215","NOIDA","M");
insert into customer values(3,"AMAN","9999999999","MUMBAI","F");
insert into customer values(4,"MEGHA","9994562399","KOLKATA","F");
insert into customer values(5,"PULKIT","7895999999","LUCKNOW","M");

update customer set CUS_NAME = "NEHA" where CUS_ID = 3;

insert into category values(1,"BOOKS");
insert into category values(2,"GAMES");
insert into category values(3,"GROCERIES");
insert into category values(4,"ELECTRONICS");
insert into category values(5,"CLOTHES");

insert into  product values(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
insert into  product values(2,"TSHIRT","SIZE-L with Black, Blue and White variations ",5);
insert into  product values(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
insert into  product values(4,"OATS","Highly Nutritious from Nestle",4);
update product set CAT_ID = 3 where PRO_ID = 4; 
insert into  product values(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
insert into  product values(6,"MILK","1L Toned Milk",3);
insert into  product values(7,"Boat Earphones","1.5Meter long Dolby Atmos ",4);
insert into  product values(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
insert into  product values(9,"Project IGI","Compatible with windows 7 and above",2);
insert into  product values(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
insert into  product values(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
insert into  product values(12,"Train Your Brain","By Shireen Stephen",1);

insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);
insert into supplier_pricing values(6,12,2,780);
insert into supplier_pricing values(7,12,4,789);
insert into supplier_pricing values(8,3,1,31000);
insert into supplier_pricing values(9,1,5,1450);
insert into supplier_pricing values(10,4,2,999);
insert into supplier_pricing values(11,7,3,549);
insert into supplier_pricing values(12,7,4,529);
insert into supplier_pricing values(13,6,2,105);
insert into supplier_pricing values(14,6,1,99);
insert into supplier_pricing values(15,2,5,2999);
insert into supplier_pricing values(16,5,2,2999);

insert into `order` values(101,1500,'2021-10-06',2,1);
insert into `order` values(102,1000,'2021-10-12',3,5);
insert into `order` values(103,30000,'2021-09-16',5,2);
insert into `order` values(104,1500,'2021-10-05',1,1);
insert into `order` values(105,3000,'2021-08-16',4,3);
insert into `order` values(106,1450,'2021-08-18',1,9);
insert into `order` values(107,789,'2021-09-01',3,7);
insert into `order` values(108,780,'2021-09-07',5,6);
insert into `order` values(109,3000,'2021-01-10',5,3);
insert into `order` values(110,2500,'2021-09-10',2,4);
insert into `order` values(111,1000,'2021-09-15',4,5);
insert into `order` values(112,789,'2021-09-16',4,7);
insert into `order` values(113,31000,'2021-09-16',1,8);
insert into `order` values(114,1000,'2021-09-16',3,5);
insert into `order` values(115,3000,'2021-09-16',5,3);
insert into `order` values(116,99,'2021-09-17',2,14);

insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);

/*4-->
Query to display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.*/

select SUM(CUS_GENDER="M") as Male, SUM(CUS_GENDER="F") as Female from customer where CUS_ID IN 
(select CUS_ID from `order` group by CUS_ID having sum(ORD_AMOUNT)>3000);

/*5-->
Query to display all the orders along with product name ordered by a customer having Customer_Id=2*/

select `order`.ORD_ID, p.PRO_NAME from `order`
inner join Supplier_pricing sp on `order`.PRICING_ID = sp.PRICING_ID
inner join Product p on sp.PRO_ID = p.PRO_ID 
where `order`.CUS_ID = 2;

/*6-->
Query to display the Supplier details who can supply more than one product*/ 	

select * from supplier where SUPP_ID in(
select SUPP_ID from supplier_pricing group by SUPP_ID having count(*)>1);

/*7-->
Query to find the least expensive product from each category and print the table with category id, name, product name and price of the product*/ 	

select (p.CAT_ID),c.CAT_NAME,p.PRO_NAME,`order`.ORD_AMOUNT from Category c
left join Product p on p.CAT_ID = c.CAT_ID
inner join Supplier_pricing sp on sp.PRO_ID = p.PRO_ID
inner join `order` on `order`.PRICING_ID = sp.PRICING_ID where `order`.ORD_AMOUNT in
(select min(`order`.ORD_AMOUNT) from Category c
left join Product p on p.CAT_ID = c.CAT_ID
inner join Supplier_pricing sp on sp.PRO_ID = p.PRO_ID
inner join `order` on `order`.PRICING_ID = sp.PRICING_ID
group by c.CAT_ID);

/*8-->
Query to display the Id and Name of the Product ordered after “2021-10-05”.*/ 	

select PRO_ID,PRO_NAME from product where PRO_ID in (
select distinct(PRO_ID) from SUPPLIER_PRICING where PRICING_ID in (
select PRICING_ID from `order` where ORD_DATE>'2021-10-05'));

/*9-->
Query to display customer name and gender whose names start or end with character 'A'.*/
 	
select CUS_NAME,CUS_GENDER from customer where CUS_NAME like 'A%' or CUS_NAME like '%A';

/*10-->
Query to Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
Service” else print “Poor Service”. Note that there should be one rating per supplier.*/

DELIMITER &&
CREATE PROCEDURE GET_SUPPLIER_RATING()  
BEGIN  
select SUPP_ID,SUPP_NAME,
CASE
    WHEN SUPP_ID = (select k.SUPP_ID from Rating r
inner join `order` on r.ord_id = `order`.ord_id
inner join supplier_pricing sp on `order`.PRICING_ID = sp.PRICING_ID
inner join supplier k on sp.SUPP_ID = k.SUPP_ID
group by k.SUPP_ID having avg(r.RAT_RATSTARS) >=5) THEN "Excellent Service" 

   WHEN SUPP_ID = (select s.SUPP_ID from Rating r
inner join `order` on r.ord_id = `order`.ord_id
inner join supplier_pricing sp on `order`.PRICING_ID = sp.PRICING_ID
inner join Supplier s on sp.SUPP_ID = s.SUPP_ID
group by s.SUPP_ID having avg(r.RAT_RATSTARS) < 5 AND avg(r.RAT_RATSTARS) >=4) THEN "Good Service" 

    WHEN SUPP_ID IN (select s.SUPP_ID from Rating r
inner join `order` on r.ord_id = `order`.ord_id
inner join supplier_pricing sp on `order`.PRICING_ID = sp.PRICING_ID
inner join Supplier s on sp.SUPP_ID = s.SUPP_ID
group by s.SUPP_ID having avg(r.RAT_RATSTARS) <4  AND avg(r.RAT_RATSTARS) >=2) THEN "Average
Service" 

else "Poor Service"
END Type_of_Service
from Supplier;
END &&  
DELIMITER ;  

/*-->
Query to call the creeated Procedure*/

call GET_SUPPLIER_RATING();

