create database Case_study_3;
use Case_study_3;

--Question 1)  Display the count of customers in each region who have done the transaction in the year 2020.
select count(*) as count_of_customers, region_name from [transaction] join customers on [transaction].customer_id=customers.customer_id join
continent on continent.region_id=customers.region_id group by region_name, datepart(year,txn_date) having datepart(year,txn_date)=2020;

--Question 2) Display the maximum and minimum transaction amount of each transaction type.
select max(txn_amount) as Max_amount, min(txn_amount) as Min_amount, txn_type from [transaction] group by txn_type;

--Question 3)  Display the customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.
select [transaction].customer_id, region_name, txn_amount from [transaction] join customers on [transaction].customer_id=customers.customer_id join
continent on continent.region_id=customers.region_id where txn_type='deposit' and txn_amount>2000;

--Question 4)  Find duplicate records in the Customer table.
select * from customers group by customer_id, region_id, start_date, end_date having count(*)>1;

--Question 5)  Display the customer id, region name, transaction type and transaction amount for the minimum transaction amount in deposit.
select top 1 [transaction].customer_id, region_name, txn_type, min(txn_amount) as min_amount from [transaction]
join customers on [transaction].customer_id=customers.customer_id join continent on continent.region_id=customers.region_id where txn_type='deposit' 
group by txn_type, [transaction].customer_id, region_name order by min_amount;

--Question 6) Create a stored procedure to display details of customers in the Transaction table where the transaction date is greater than Jun 2020.
create procedure detailing
as
select * from [transaction] where txn_date>'2020-06-30'
go
exec detailing;

--Question 7) Create a stored procedure to insert a record in the Continent table.
create procedure inserting
as
insert into continent values(6, 'Russia')
go
exec inserting;

--Question 8) Create a stored procedure to display the details of transactions that happened on a specific day.
create procedure display @day date
as
select * from [transaction] where txn_date=@day
go
exec display @day='2020-04-01';

--Question 9) Create a user defined function to add 10% of the transaction amount in a table.
create function tenpercent(@txn_amount int)
returns int
as
begin
return(@txn_amount*1.1)
end
go
select *, dbo.tenpercent(txn_amount) as Increased_amount from [transaction];

--Question 10) Create a user defined function to find the total transaction amount for a given transaction type.
create function total(@txns_amount varchar(50))
returns table
as
return (select sum(txn_amount) as total_transaction from [transaction] where txn_type=@txns_amount group by txn_type)
select * from dbo.total('deposit')

--Question 11)  Create a table value function which comprises the columns customer_id, region_id ,txn_date , txn_type , txn_amount which will retrieve data from
              --the above table.
create function tablevalued()
returns table
as
return (select [transaction].customer_id, region_id, txn_type, txn_date, txn_amount from [transaction]
join customers on [transaction].customer_id=customers.customer_id)
select * from dbo.tablevalued();

--Question 12) Create a TRY...CATCH block to print a region id and region name in a single column.
begin try
select concat(region_id,region_name) as single_column from continent
end try

begin catch
print error_message()
end catch;

--Question 13) Create a TRY...CATCH block to insert a value in the Continent table.
begin try
insert into continent values(7, 'Antartica')
end try
begin catch
print error_message()
end catch;

--Question 14) Create a trigger to prevent deleting a table in a database.
create trigger triggerdeletion
on dbo.continent
instead of delete
as
select 'Trigger does not allow it'
go
delete from continent where region_id=1;
select * from continent;

--Question 15) Display top n customers on the basis of transaction type.
with cte as(
select  customer_id, txn_amount, txn_type, row_number() over (partition by txn_type order by txn_amount desc) as rank
from [transaction] group by customer_id, txn_amount, txn_type)
select customer_id, txn_amount, txn_type from cte where rank<=3 order by txn_type, txn_amount desc;

--Question 16) Create a pivot table to display the total purchase, withdrawal and deposit for all the customers.
select [Deposit], [Withdrawal], [Purchase] from (select txn_type, txn_amount from [transaction]) as sourcetable 
pivot (sum(txn_amount)
for txn_type in ([Deposit], [Withdrawal], [Purchase])) as Pivot_Table