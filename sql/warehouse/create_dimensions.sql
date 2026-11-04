
USE OlistRetailDW;
GO


CREATE TABLE dw.DimCustomer (
	Customerkey INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID NVARCHAR(50) NOT NULL UNIQUE,
	CustomerUniqueID NVARCHAR(50),
	ZipCodePrefix NVARCHAR(10),
	City NVARCHAR(100),
	State NVARCHAR(10))
;

