CREATE DATABASE Company

USE Company

---------------EMPLOYEE

CREATE TABLE Employes(
Id INT UNIQUE,
Name NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
Position NVARCHAR(100) NOT NULL,
Salary MONEY NOT NULL
)

INSERT INTO Employes VALUES (1,N'Əzi',N'Cəbrayılov','SYSTEM ADMINISTRATOR',8000),(2,'Ilham','Aliyev','Front-End Developer',3500),(3,'Vasif','Memmedov','Network Developer',7500),(4,'Qiyas','Ceferov','SQL developer',4000)


---------------DEPARTMENTS

CREATE TABLE Departments(
Id INT UNIQUE,
Name NVARCHAR (100) NOT NULL,
WorkerCount INT,
FoundTime DATETIME DEFAULT GETDATE()
)

INSERT INTO Departments  VALUES(1,N'Çarlinin Mələkləri',52,DEFAULT),(2,'BIZ Group',74,DEFAULT)
INSERT INTO Departments  VALUES(3,'ExpressCode',66,DEFAULT),(4,'M Team',41,DEFAULT)

-------------DIRECTORS

CREATE TABLE Directors(
Id INT UNIQUE,
Name NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
Position NVARCHAR(100) NOT NULL,
SALARY MONEY NOT NULL
)

INSERT INTO Directors VALUES(1,N'Əzi',N'Cəbrayılov','Director',7000),(2,'Bashir','Azizov','Software Developer',5500)
INSERT INTO Directors VALUES(3,'Eli','Eliyev','SYSTEM ADMINISTRATOR',5000),(4,'Ulvi','Abdullazada','Software Developer',5000)

ALTER TABLE Departments
ADD DirectorsId  INT REFERENCES Directors(Id)


ALTER TABLE Employes
ADD Departments INT REFERENCES Directors

--QUERY 1
SELECT Name,Surname,Salary FROM Employes WHERE Salary > (SELECT AVG(Salary) FROM Directors)

--QUERY 2
SELECT Name,Surname,Salary FROM Employes WHERE DepartmentsId = (SELECT Id FROM Departments WHERE Name = 'ExpressCode')\

--QUERY 3 
--QUERY 2 işləmədiyi üçün query 3 u yazmadim eyni məntiqdi