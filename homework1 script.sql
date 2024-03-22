--1) How many actors are there with the last name ‘Wahlberg’?
select COUNT(last_name)
from actor 
where last_name like 'Wahlberg'; -- count = 2

--2) How many payments were made between $3.99 and $5.99?
select count(amount) from payment --in my data, all values under 5.99 are weird values like negative nums...
where amount>3.99 and amount<5.99 --But, answer here for me would be 0 payments made between 3.99 and 5.99
								  

--3) What film does the store have the most of? (search in inventory)
select film_id,count(film_id) from inventory
group by film_id 
order by count(film_id) desc; --The store has 8 copies of [film_id: 193]

--4) How many customers have the last name ‘William’?
select count(last_name) from customer
where last_name like 'Wi%'; -- 6 poeple have a last name that starts with Wi...

select count(last_name) from customer --0 people with the last name 'William'
where last_name like 'William';
--5) What store employee (get the id) sold the most rentals?
select staff_id,count(staff_id) from rental --staff_id:[1] had 8040, staff_id:[2] had 8004
group by staff_id
order by count(staff_id) desc;
--6) How many different district names are there?
select district from address
group by district	
order by district asc;--Looks like we have 378 districts
--7) What film has the most actors in it? (use film_actor table and get film_id)
select count(film_id),film_id from film_actor 
group by film_id order by count(film_id)desc ; -- film_id 508 had 15 actors in it 

--8) From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(last_name) from customer 
where store_id=1 and last_name like '%es'; --13 people in the store_id 1 have last)name ending with es

--9) How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--9) with ids between 380 and 430? (use group by and having > 250)
select count(amount),amount from payment
where customer_id >380 and customer_id <430 and amount>250
group by amount; -- My data is unfortunately not right because most of my amount values are negative
				 --These commands show me 0 amounts have more than 250 rentals for those ids

--10) Within the film table, how many rating categories are there? And what rating has the most
--10) movies total?
select count(rating),rating  from film
group by rating
order by count(rating) asc; --5 different rating categories and PG-13 is the highest