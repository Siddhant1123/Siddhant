--Data Exploration

--Step 4.1: Write query to retrieve all customer information
select * from customers;


--Step 4.2: Query accounts for a specific customer:
select * from accounts
where customer_id = 1;




--Step 4.3: Find the customer name and account balance for each account
select first_name, last_name, balance as account_balance from customers as c
inner join accounts as a
on c.customer_id = a.customer_id;



--Step 4.4: Analyze customer loan balances:
with TotalPayments as (
    select loan_id, sum(payment_amount) as total_payments from loan_payments
    group by loan_id
)
select l.loan_id, customer_id, loan_amount, interest_rate, loan_term, total_payments,
loan_amount - total_payments as remaining_balance from loans as l
inner join TotalPayments
on l.loan_id = TotalPayments.loan_id
order by l.loan_id;



--Step 4.5: List all customers who have made a transaction in the 2024-03
select c.customer_id, c.first_name, c.last_name from customers as c
inner join accounts as a
on c.customer_id = a.customer_id
inner join transactions as t
on a.account_id = t.account_id
where year(t.transaction_date)= 2024
 and month(t.transaction_date)= 3;

