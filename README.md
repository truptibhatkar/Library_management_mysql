Library Management System
Project Description
This project is a Library Management System built using MySQL. It involves creating and managing a relational database for a library that keeps track of branches, employees,
customers, books, issue statuses, and return statuses. Various SQL queries are used to perform operations such as adding data, retrieving information, and updating records.

Database Structure
Tables
Branch: Stores information about library branches.

Columns: barnch_no, manager_id, barnch_add, contact_no
Employee: Stores information about library employees.

Columns: emp_id, emp_name, position, salary, barnch_no
Foreign Key: barnch_no references Branch(barnch_no)
Customer: Stores information about library customers.

Columns: cust_id, cust_name, cust_add, reg_date
Books: Stores information about books in the library.

Columns: isbn, book_title, category, rental_price, status, authour, publisher
IssueStatus: Tracks books issued to customers.

Columns: issue_id, issued_cust, issued_book_name, issue_date, isbn_book
Foreign Keys:
issued_cust references Customer(cust_id)
isbn_book references Books(isbn)
ReturnStatus: Tracks books returned by customers.

Columns: ret_id, ret_cust, ret_book_name, ret_date, isbn_book2
Foreign Key: isbn_book2 references Books(isbn)
