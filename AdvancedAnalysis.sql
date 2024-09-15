--Create a view of active loans with payments greater than $1000:

create view Active_Loan_Payments as 
select c.customer_id, l.loan_id, first_name, last_name, loan_amount, payment_amount from customers as c
join loans as l
on c.customer_id = l.customer_id
join loan_payments as p
on l.loan_id = p.loan_id
where p.payment_amount > 1000;

Select * from Active_Loan_Payments;



--Create an index on `transaction_date` in the `transactions` table for performance optimization:

create index idx_transaction_date on transactions (transaction_date); 

select name as index_name, object_name(object_id) as table_name, type_desc as index_type
from  sys.indexes
where object_name(object_id) = 'transactions';
