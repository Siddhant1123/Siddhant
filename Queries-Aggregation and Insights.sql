--Aggregation and Insights

--Calculate the total balance across all accounts for each customer:
select c.customer_id, first_name, last_name, sum(balance) as total_balance from customers as c
join accounts as a
on c.customer_id= a.customer_id
group by c.customer_id, first_name, last_name;



--Calculate the average loan amount for each loan term:
select loan_term, avg(loan_amount) as avg_loan_amount from loans
group by loan_term;



--Find the total loan amount and interest across all loans:
select sum(loan_amount) as total_loan_amount, sum(loan_amount * (interest_rate/100)) as total_interest
from loans;



--Find the most frequent transaction type:
select transaction_type, count(*) as transaction_count from transactions
group by transaction_type
order by transaction_count desc
offset 0 rows
fetch next 1 row only;


--Analyze transactions by account and transaction type:
select a.account_id, transaction_type, sum(transaction_amount) as total_amount from accounts as a
inner join transactions as t
on a.account_id = t.account_id
group by a.account_id, transaction_type;


