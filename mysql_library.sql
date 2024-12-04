use library;
create table branch(
barnch_no varchar(10) primary key,
manager_id varchar(10),
barnch_add varchar(30),
contact_no varchar(15)
);
desc branch

create table employee(
emp_id varchar(10) primary key,
emp_name varchar(20),
position varchar(20),
salary decimal(10,2)
);
desc employee

create table customer(
cust_id varchar(10) primary key,
cust_name varchar(20),
cust_add varchar(30),
reg_date date
);
desc customer

create table books(
isbn varchar(25) primary key,
bbok_title varchar(50),
category varchar(20),
rental_price decimal(10,2),
status enum ("yes","no"),
authour varchar(20),
publisher varchar(30)
);
desc books;

create table issuestatus(
issue_id varchar(10) primary key,
issued_cust varchar(30),
issued_book_name varchar(80),
issue_date date,
isbn_book varchar(25),
foreign key (issued_cust) references customer(cust_id) on delete cascade,
foreign key (isbn_book) references books(isbn) on delete cascade
);
desc issuestatus;
create table returnstatus(
ret_id varchar(20) primary key,
ret_cust varchar(30),
ret_book_name varchar(50),
ret_date date,
isbn_book2 varchar(15),
foreign key (isbn_book2) references books(isbn) on delete cascade
);
desc returnstatus;

show tables;

desc branch;
insert into branch values ("b1","m1","bhayander","111");
insert into branch values ("b2","m2","miraroad","222");
insert into branch values ("b3","m3","dahisar","333");
insert into branch values ("b4","m4","borivali","444");
insert into branch values ("b5","m5","kandivali","555");

select * from branch;




desc employee;
insert into employee values("e1","Trupti","Founder",1000000.00);
insert into employee values("e2","Pankaj","Co-Founder",1000000.00);
insert into employee values("e3","Kanchan","CEO",500000.00);
insert into employee values("e4","Priya","Assistant",400000.00);
insert into employee values("e5","Pooja","Manager",500000.00);
insert into employee values("e6","sidhhi","Clerk",300000.00);
insert into employee values("e7","Anil","Admin",400000.00);
insert into employee values("e8","Sagar","Clerk",300000.00);
insert into employee values("e9","Dhanu","Librarian",200000.00);
insert into employee values("e10","Diya","Librarian",100000.00);

select * from employee;

desc customer;

insert into customer values("c1","sarika","miraroad","2024-11-01");
insert into customer values("c2","naman","dahisar","2024-11-05");
insert into customer values("c3","seema","nalasopara","2024-11-15");
insert into customer values("c4","sayali","borivali","2024-11-07");
insert into customer values("c5","shaloo","santacruz","2024-10-01");
insert into customer values("c6","shweta","virar","2024-10-25");
insert into customer values("c7","mayuri","vasai","2024-10-30");
insert into customer values("c8","nilima","bhayander","2024-11-04");
insert into customer values("c9","atharv","bhayander","2024-11-13");
insert into customer values("c10","parth","naigaon","2024-10-15");

select * from customer;

desc books;
insert into books values("1","game of throne","fantasy",8.50,"yes","george","bantam");
insert into books values("2","rich dad poor dad","finance",10.50,"yes","paulo","penguine");
insert into books values("3","good habit","classic",6.50,"yes","george","harper");
insert into books values("4","zero to one","motivation",7.50,"yes","anne","oxford");
insert into books values("5","love","romance",9.50,"yes","howard","oxford");
insert into books values("6","tvd","action",5.50,"no","howard","oxford");
insert into books values("7","her","classic",6.50,"no","george","penguine");
insert into books values("8","run","action",7.50,"no","santa","divine");

select * from books;

desc issuestatus;
insert into issuestatus values("IS1","c1","her","2024-11-05","5");
insert into issuestatus values("IS2","c2","run","2024-11-10","8");
insert into issuestatus values("IS3","c3","good habit","2024-11-16","3");
insert into issuestatus values("IS4","c4","rich dad poor dad","2024-11-15","2");
insert into issuestatus values("IS5","c10","tvd","2024-11-11","6");
select * from issuestatus;

desc returnstatus;

insert into returnstatus values("RS1","c3","good habit","2024-11-17","3");
insert into returnstatus values("RS2","c4","rich dad poor dad","2024-11-17","2");
select * from returnstatus;

desc books;
select bbok_title,category,rental_price from books;
desc employee;
select emp_name,salary from employee order by salary desc;
desc issuestatus;
desc customer;
select issuestatus.issued_book_name,customer.cust_name from issuestatus inner join customer on issuestatus.issued_cust=customer.cust_id ;
select category,count(bbok_title) from books group by category;
select emp_name,position from employee where salary>500000;
select cust_name from customer where reg_date <"2024/11/17" and cust_id not in (select issued_Cust from issuestatus);
desc branch;
desc employee;
alter table employee add column barnch_no varchar(30);
ALTER TABLE employee 
ADD CONSTRAINT fk_branch 
FOREIGN KEY (barnch_no) REFERENCES branch(barnch_no);

select * from branch;
update employee set barnch_no="b1" where emp_id="e1";
update employee set barnch_no="b1" where emp_id="e2";
update employee set barnch_no="b5" where emp_id="e3";
update employee set barnch_no="b2" where emp_id="e4";
update employee set barnch_no="b2" where emp_id="e5";
update employee set barnch_no="b5" where emp_id="e6";
update employee set barnch_no="b3" where emp_id="e7";
update employee set barnch_no="b3" where emp_id="e8";
update employee set barnch_no="b4" where emp_id="e9";
update employee set barnch_no="b4" where emp_id="e10";

select barnch_no,count(emp_name) from employee group by  barnch_no;

select customer.cust_name from customer inner join issuestatus on customer.cust_id=issuestatus.issued_cust where year(issue_date)=2024;
desc issuestatus;


select bbok_title from books where category="action";
select barnch_no ,count(emp_id) from employee group by barnch_no having count(emp_id)>5;  

SELECT COUNT(*) AS Total_Books FROM books;
SELECT bbok_title, category FROM books WHERE rental_price BETWEEN 5 AND 10;
select distinct * from customer join issuestatus on customer.cust_id=issuestatus.issued_cust;
#9th question
 SELECT b.isbn, b.bbok_title, IFNULL(i.issue_id, 'Not Issued') AS Issue_Status
   FROM books b
   LEFT JOIN issuestatus i ON b.isbn = i.isbn_book;
#10 th question
select * from issuestatus where issued_cust="c2";

#11th que
SELECT cust_name AS Non_Issuers
    FROM customer c
    left JOIN issuestatus i ON  i.issued_cust=c.cust_id 
    WHERE i.issue_id IS NULL;
#prac 11th que
 SELECT * 
    FROM customer c
    right JOIN issuestatus i ON  i.issued_cust=c.cust_id 
#12th que
select sum(rental_price) as total_rent from books;
select count(rental_price) as count_book from books;

#13th que
select cust_name,reg_date from customer where reg_date >="2023-10-01";

#14th que
alter table books rename column bbok_title to book_title;
select book_title,category from books where category in("action","romance");

#16th que
select category,count(category) as count from books group by category;

#17th
select c.cust_name,i.* from customer c join issuestatus i on i.issued_cust=c.cust_id where issued_book_name ="good habit";

#18th
select b.book_title from books b left join issuestatus i on i.isbn_book=b.isbnT where   i.issue_id IS NULL;
#19th 
select c.cust_name,r.* from customer c join returnstatus r on r.ret_cust=c.cust_id;
#20th
SELECT b.book_title, IFNULL(c.cust_name, 'Not Issued Yet') as cust_name
    FROM books b
    LEFT JOIN issuestatus i ON b.isbn = i.isbn_book
    LEFT JOIN customer c ON i.issued_cust = c.cust_id;
