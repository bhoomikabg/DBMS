use bank2;
create table branch(
branch_name varchar(35),
branch_city varchar(20),
assets int,
primary key(branch_name)
);
select * from branch;
create table BankAccount(
accno int,
branch_name varchar(35),
balance int,
primary key(accno),
foreign key(branch_name) references branch(branch_name)
);
select * from BankAccount;

create table bankcustomer(
customer_name varchar(25),
customer_street varchar(50),
city varchar(100),
primary key(customer_name)
);
select * from bankcustomer;
create table depositer(
customer_name varchar(50),
accno int,
primary key(customer_name,accno),
foreign key(customer_name) references bankcustomer(customer_name),
foreign key(accno) references bankaccount(accno)
);
select * from depositer;
create table loan(
loan_number int,
branch_name varchar(50),
amount int,
primary key(loan_number),
foreign key(branch_name) references branch(branch_name)
);
select * from loan;
insert into branch values('SBI_Chamrajpet', 'Bangalore', 50000);
insert into branch values('SBI_ResidencyRoad', 'Bangalore', 10000);
insert into branch values('SBI_ShivajiRoad', 'Bombay', 20000);
insert into branch values('SBI_ParliamentRoad', 'Delhi', 10000);
insert into branch values('SBI_Jantarmantar', 'Delhi', 20000);
insert into BankAccount values(1, 'SBI_Chamrajpet', 2000);
insert into BankAccount values(2, 'SBI_ResidencyRoad', 5000);
insert into BankAccount values(3, 'SBI_ShivajiRoad', 6000);
insert into BankAccount values(4, 'SBI_ParliamentRoad', 9000);
insert into bankAccount values(5, 'SBI_Jantarmantar', 8000);
insert into BankAccount values(6, 'SBI_ShivajiRoad', 4000);
insert into BankAccount values(8, 'SBI_ResidencyRoad', 4000);
insert into BankAccount values(9, 'SBI_ParliamentRoad', 3000);
insert into BankAccount values(10, 'SBI_ResidencyRoad', 5000);
insert into BankAccount values(11, 'SBI_Jantarmantar', 2000);
insert into bankcustomer values ('Avinash', 'Bull_Temple_Road', 'Bangalore');
insert into bankcustomer values ('Dinesh', 'Bannergatta_Road', 'Bangalore');
insert into bankcustomer values ('Mohan', 'National_College_Road', 'Bangalore');
insert into bankcustomer values ('Nikhil', 'Akbar_Road', 'Delhi');
insert into bankcustomer values ('Ravi', 'Prithviraj_Road', 'Delhi');
insert into depositer('Avinash',1);
insert into depositer values('Avinash', 1);
insert into depositer values('Dinesh', 2);
insert into depositer values('Nikhil', 4);
insert into depositer values('Ravi', 5);
insert into depositer values('Avinash', 8);
insert into depositer values('Nikhil', 9);
insert into depositer values('Dinesh', 10);
insert into depositer values('Nikhil', 11);
insert into loan
values (1, 'SBI_Chamrajpet', 1000),
(2, 'SBI_ResidencyRoad', 2000),
(3, 'SBI_ShivajiRoad', 3000),
(4, 'SBI_ParliamentRoad', 4000),
(5, 'SBI_Jantarmantar', 5000);
select branch_name,assets as assets_in_lakhs
from branch;
select d.customer_name
from depositer d, BankAccount b
where b.accno=d.accno and branch_name='SBI_ResidencyRoad'
group by customer_name
having count(customer_name)>1;

