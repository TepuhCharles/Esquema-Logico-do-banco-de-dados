create database Company;
use Company;
create table Employee(
    Fname varchar(15) not null,
    Minit char(9),
    Lname varchar(15) not null,
    Ssn char(9) not null,
    Bdate date,
    Sex char(9),
    Address varchar(30),
    Salary decimal(10, 2),
    Super_Ssn char(9),
    Dno int not null,
    primary key (Ssn)
);

create table Department(
    Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date date,
    primary key (Dnumber),
    unique (Dname),
    foreign key (Mgr_ssn) references Employee(Ssn)
);

create table Dept_Location(
     Dnumber int not null,
     Dlocation varchar(15) not null,
     primary key (Dnumber, Dlocation),
     foreign key (Dnumber) references Department (Dnumber)
);

create table Project(
     Pname varchar(15) not null,
     Pnumber int not null,
     Plocation varchar(15),
     Dnum int not null,
     primary key(Pnumber),
     unique(Pname),
     foreign key(Dnum) references Department(Dnumber)
);

create table Works_on(
     Essn char(9) not null,
     Pno int not null,
     Hours decimal(3,1),
     primary key(Essn, Pno),
     foreign key(Essn) references Employee(Ssn),
     foreign key(Pno) references Project(Pnumber)
);

create table Dependent(
     Essn char(9) not null,
     Dependent_name varchar(15) not null,
     Sex char, -- F or M
     Bdate date,
     Relationship varchar(8),
     primary key(Essn, Dependent_name),
     foreign key(Essn) references Employee(Ssn)
);

show tables;
desc Employee;