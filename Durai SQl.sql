                         # task 1 # 
                   # table name employee #

use world;
show tables from sampledb;
create table employee(Empid int(6) not null,EmpName text not null,department varchar(30) not null,ContactNo int not null,Emailid text not null,EmpHeadid int not null);
insert into employee values(101,'Isha','E-101',1234567890,'isha@gmail.com',105),(102,'Priya','E-104',1234567890,'priya@yahoo.com',103),(103,'Neha','E-101',1234567890,'neha@gmail.com',101),(104,'rahul','E-102',1234567890,'rahul@yahoo.com',105),(105,'Abhishek','E-101',1234567890,'abhishek@gmail.com',102);
select *from employee;
select *from employee where EmpName like "P%";    # task 1 #
select *from employee where Emailid like "%gmail.com";    # task 2 #
select *from employee where Department IN ('E-104','E-102');    # task 3 #
select EmpName from employee where EmpName like "%a";    # task 4 #
select EmpName from employee where EmpName like "__h%";    # task 5 #

						# task 2 # 
                     # table worker #
                      # table bonus #
					 # table title #
use sampledb;
create table worker(Worker_id varchar(30) not null,First_Name text not null,Last_Name text not null,salary int not null,Joining_Date datetime not null,Department text not null );
insert into worker values('001','Monika','Arora',100000,'2014-02-20 09:00:00','HR'),('002','Niharika','Verma',80000,'2014-06-11 0:00:00','Admin'),('003','Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),('004','Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),('005','Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
('006','Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),('007','Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),('008','Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin');
select *from worker;

use sampledb;
create table Bonus(Worker_Ref_Id int not null,Bonus_Date datetime not null,Bonus_Amount int not null);
insert into Bonus values(1,'2016-02-20 00:00:00',5000),(2,'2016-06-11 00:00:00',3000),(3,'2016-02-20 00:00:00',4000),(1,'2016-02-20 00:00:00',4500),(2,'2016-06-11 00:00:00',3500);
select *from Bonus;

use sampledb;
create table Title(Worker_ref_id int not null,Worker_Title text not null,Affected_From datetime not null);
insert into Title values(1,'Manager','2016-02-20 00:00:00'),(2,'Executive','2016-06-11 00:00:00'),(8,'Executive','2016-06-11 00:00:00'),(5,'Manager','2016-06-11 00:00:00'),(4,'Asst.Manager','2016-06-11 00:00:00'),(7,'Executive','2016-06-11 00:00:00'),(6,'Lead','2016-06-11 00:00:00'),(3,'Lead','2016-06-11 00:00:00');
select *from Title;

select First_Name as Worker_Name from worker;    # task 1 #
select ucase(First_Name) from Worker;    # task 2 #
select Distinct Department from Worker;    # task 3 #
select Department from Worker group by Department;    # task 3 #
select SUBSTR(First_Name,1,3) from Worker;    # task 4 #
select INSTR(First_Name,'a') as position_of_a from Worker where First_Name='Amitabh';    # task 5 #
select rtrim(First_Name) from Worker;    # task 6 #
select ltrim(Department) from Worker;    # task 7 #
select distinct Department,length(department) as lengthofdepartment from Worker;    # task 8 #
select replace(First_Name,'a','A') from Worker;    # task 9 #
select concat(First_Name,' ',Last_Name) as Name from Worker;    # task 10 #
select *from Worker order by First_Name asc;    # task 11 and task 12 #  
select *from Worker order by Department desc;    # task 12 #
select *from Worker where First_Name='Vipul' or First_Name='Satish';    # task 13 #
select *from worker where First_Name not in('Vipul','Satish');    # task 14 #
select *from Worker where Department like 'a____';    # task 15 #
select *from Worker where First_Name like '%a%';    # task 16 #
select *from Worker where First_Name like '%a';    # task 17 #
select *from Worker where First_Name like '_____h';    # task 18 #
select *from Worker where salary between 100000 and 500000;   # task 19 #
select * from Worker where Joining_Date like '2014-02-__ __:__:__';    # task 20 #
select Department,count(Department) as countofemployee from Worker where Department like 'admin' group by Department;    # task 21 #
select First_Name from Worker where Salary>=50000 and Salary<=100000;    # task 22 #
select distinct department,count(Department) as noofworkers from Worker group by Department order by noofworkers desc;    # task 23 #

select Worker.Worker_id,Worker.First_Name,Worker.Last_Name,Worker.Joining_Date,Worker.Department,Title.Worker_Title 
from Worker inner join Title on Worker.Worker_id=Title.Worker_ref_id where Worker_Title like 'Manager';    # task 24 #

select first_name,last_name,salary,joining_date,department,count(*) as count from worker
group by first_name,last_name,salary,joining_date,department having count>1;    # task 25 #

with num as (
SELECT *,
ROW_NUMBER() OVER(ORDER BY worker_id) AS row_num
 FROM worker
 )
select * from num 
where row_num%2!=0;    # task 26 #

with num as (
SELECT *,
ROW_NUMBER() OVER(ORDER BY worker_id) AS row_num 
FROM worker
)
select * from num 
where row_num%2=0;    # task 27 #

select curdate()as currentdate,current_time() as currenttime;    # task 28 #
select *from Worker limit 4;    # task 29 #
select distinct salary from Worker order by salary DESC limit 1 OFFSET 2;    # task 30 # 
select *from Worker where Salary in (select salary from Worker group by salary having count(*)>1);   # task 31 #
select distinct salary from Worker order by salary DESC limit 1 OFFSET 1;    # task 32 #

with num as (
 SELECT *,
    ROW_NUMBER() OVER (ORDER BY worker_id) AS row_num
FROM worker
) 
 select * from num 
 where row_num <= (select count(*) from worker)/2;    # task 33 #
 
SELECT Department FROM worker group by department having COUNT(*)<5;    # task 34 #
Select department,count(*) from worker group by department;    # task 35 #
select *from Worker order by Worker_id desc limit 1;    # task 36 #
select First_Name,department,salary from Worker where Salary in (select max(salary) from Worker group by Department);    # task 37 #
select salary from Worker group by salary order by salary desc limit 3;    # task 38 #
select distinct department,sum(salary) as totalsalary from worker group by department;    # task 39 
SELECT First_Name,salary FROM Worker WHERE Salary = (select MAX(Salary) from Worker);    # task 40 #










