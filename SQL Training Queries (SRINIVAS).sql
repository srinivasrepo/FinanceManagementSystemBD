--select * from Clients;
--select * from [Address];
--select * from Projects;

--1) Return CustomerID and name those does not have entry in address information
SELECT C.CustomerID, CustomerName FROM Clients C
LEFT JOIN 
(
SELECT CustomerID, COUNT(Address) AddressCount FROM Address GROUP BY CustomerID
)
A ON C.CustomerID = A.CustomerID
WHERE AddressCount IS NULL;





--2) Return CustomerID, Customer Name and No of address
SELECT C.CustomerID, CustomerName, ISNULL(AddressCount, 0) AddressCount FROM Clients C
LEFT JOIN 
(
SELECT CustomerID, COUNT(Address) AddressCount FROM Address GROUP BY CustomerID
)
A ON C.CustomerID = A.CustomerID;





--3) Output 3 Male, 2 Female
SELECT CustomerName, IIF(Gender='M','Male','Female') Gender FROM Clients
WHERE CustomerID IN(SELECT TOP 3 CustomerID FROM Clients WHERE Gender='M' ORDER BY CustomerID ) 
OR CustomerID IN (SELECT TOP 2 CustomerID FROM Clients WHERE Gender='F'  ORDER BY CustomerID);






--4) ID and Name who is having minimum salary									
SELECT CustomerID, CustomerName FROM Clients 
WHERE Salary = (SELECT MIN(Salary) FROM Clients);








--5) City wise no of customers	
SELECT C.City, Count(C.City) NoOfCustomers FROM 
(
 SELECT CustomerID, City FROM Address GROUP BY CustomerID, City
) C GROUP BY C.City








--6) Average salary gender wise									
SELECT (CASE WHEN Gender = 'M' THEN 'Male' WHEN Gender = 'F' THEN 'Female' ELSE 'Transgender' END) Gender, 
AVG(Salary) AvgSalary FROM Clients GROUP BY Gender;






--7) Output Name, salary in format of K; for example, 10,000 as 10K									
--SELECT CustomerName, (CAST(CAST(Salary/1000.0 AS DECIMAL(10,1)) AS VARCHAR(max)) + 'K') SalaryInFractions FROM Clients
SELECT CustomerName, (CAST(Salary/1000 AS VARCHAR(max)) + 'K') Salary FROM Clients;






--8) How many rows cross join will return ?									
SELECT count(1) NoOfRowsInCrossJoin from Clients
CROSS JOIN Address;








--9) Output Name, If age is even, should display EvenAge, otherwise oddAge									
SELECT CustomerName, IIF(Age%2 = 0, 'EvenAge', 'OddAge') AgeType FROM Clients;








--10) Customer names whose address in State - TS									
SELECT CustomerName FROM Clients C
INNER JOIN 
(
	SELECT CustomerID, City, State FROM Address GROUP BY CustomerID, City, State HAVING State = 'TS'

) S ON S.CustomerID = C.CustomerID;









--11) How many rows left join will return ?	

--SELECT COUNT(1) NoOfRowsReturnedInLeftJoinIfDistinct FROM Clients C
--LEFT JOIN
--(
-- SELECT DISTINCT CustomerID FROM Address
--) A ON C.CustomerID = A.CustomerID

SELECT COUNT(1) NoOfRowsReturnedInLeftJoin FROM Clients C
LEFT JOIN
Address A ON C.CustomerID = A.CustomerID










--12) how many rows inner join will return ?

--SELECT COUNT(1) NoOfRowsReturnedInInnerJoinIfDistinct FROM Clients C
--INNER JOIN
--(
-- SELECT DISTINCT CustomerID FROM Address
--) A ON C.CustomerID = A.CustomerID 

SELECT COUNT(1) NoOfRowsReturnedInInnerJoin FROM Clients C
INNER JOIN
Address A ON C.CustomerID = A.CustomerID









--13) Display first address against each customer
SELECT  C.CustomerName, A.Address, A.City, A.State FROM Clients C
INNER JOIN
(
SELECT CustomerID, AddressID,  ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY AddressID) i FROM Address
) 
T ON C.CustomerID = T.CustomerID
INNER JOIN Address A ON A.AddressID = T.AddressID
WHERE i=1

--(OR)

DECLARE @AddressTbl TABLE(AddressID INT, CustomerID INT);
DECLARE @FirstAddressTbl TABLE(AddressID INT, CustomerID INT);
INSERT INTO @AddressTbl 
SELECT AddressID, CustomerID FROM Address ORDER BY AddressID;
DECLARE @loopStart INT = 1;
DECLARE @loopEnd INT = (SELECT MAX(AddressID) FROM @AddressTbl);

WHILE(@loopStart <= @loopEnd)
BEGIN 
	 IF NOT EXISTS(SELECT CustomerID FROM @FirstAddressTbl WHERE CustomerID = @loopStart)
		 BEGIN
			INSERT INTO @FirstAddressTbl
			SELECT TOP 1 * FROM @AddressTbl WHERE CustomerID = @loopStart
		 END

	IF EXISTS(SELECT CustomerID FROM @AddressTbl WHERE AddressID = @loopStart)
		DELETE FROM @AddressTbl WHERE CustomerID = @loopStart

	SET @loopStart = @loopStart + 1;
END

SELECT C.CustomerName, Address, City, State FROM Clients C
INNER JOIN 
@FirstAddressTbl F ON F.CustomerID = C.CustomerID
INNER JOIN 
Address A ON A.AddressID = F.AddressID





















-----
--return
--select c.CID, CName, Salary, pc.pcnt
--from Clients c
--inner join (
--	select distinct cid from Address where Address = 'telangana'
--) a on c.CID = a.CID
--left join
--(
--	select CID, COUNT(1) pcnt from Projects
--	group by CID 
--) pc on c.CID = pc.CID
--where pc.CID is null

--return

--select CName, Salary
--from Clients
--where Salary >= (select AVG(salary) from Clients)


--select CName, Salary, isnull(ac.AddressCnt, 0) AddressCnt, isnull(pc.ProjectCnt, 0) ProjectCnt 
--from clients c
--left join
--(
--	select CID, COUNT(1) AddressCnt from Address
--	group by CID
--) ac on c.CID = ac.CID
--left join
--(
--	select CID, COUNT(1) ProjectCnt from Projects
--	group by CID 
--) pc on c.CID = pc.CID

----where ac.AddressCnt >=2 or pc.ProjectCnt >= 2

--return

--select * from clients c
--inner join Address a on c.CID = a.CID
--inner join Projects p on c.CID = p.CID


--return

--declare @tbl table(cid int, cname varchar(50), salary int)

--insert into @tbl(cid, cname, salary )
--select 1, 'customer 11', 1000 union all
--select 2, 'customer 21', 1000

--select * from @tbl

