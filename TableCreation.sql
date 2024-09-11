--customers table
create table customers (
    customer_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    address varchar(100),
    city varchar(50),
    tate varchar(50),
    zip varchar(20)
);

--accounts table
create table accounts (
    account_id int primary key,
    customer_id int,
    account_type varchar(50),
    balance decimal(10, 2),
    foreign key (customer_id) references customers(customer_id)
);


--transactions table
 create table transactions (
    transaction_id int primary key,
    account_id int,
    transaction_date date,
    transaction_amount decimal(10, 2),
    transaction_type varchar(50),
    foreign key (account_id) references accounts(account_id)
);


--loans table
create table loans (
    loan_id int primary key,
    customer_id int,
    loan_amount decimal(10, 2),
    interest_rate decimal(5, 2),
    loan_term int,
    foreign key (customer_id) references customers(customer_id)
);


--loan_payments table
create table loan_payments (
    payment_id int primary key,
    loan_id int,
    payment_date date,
    payment_amount decimal(10, 2),
    foreign key (loan_id) references loans(loan_id)
);


