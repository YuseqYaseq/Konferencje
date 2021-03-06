USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[AddAddress]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAddress](
	@BuildingNumber nvarchar(50),
	@StreetName nvarchar(300),
	@City nvarchar(300),
	@PostalCode nvarchar(20),
	@Region nvarchar(200),
	@Country nvarchar(200))
AS BEGIN
	INSERT INTO Address(BuildingNumber, StreetName, City, PostalCode, Region, Country)
	VALUES (@BuildingNumber, @StreetName, @City, @PostalCode, @Region, @Country);
END
GO
